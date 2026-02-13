#!/usr/bin/env python3
import os
import time
import subprocess
import shutil
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

class JSPChangeHandler(FileSystemEventHandler):
    def __init__(self, project_dir, deploy_dir):
        self.project_dir = project_dir
        self.deploy_dir = deploy_dir
        self.last_compile = 0
        
    def on_modified(self, event):
        if event.is_directory:
            return
        
        file_path = event.src_path
        print(f"📝 Modification détectée: {os.path.basename(file_path)}")
        
        # Si c'est un fichier Java, recompiler
        if file_path.endswith('.java'):
            self.compile_java()
        # Si c'est un fichier web, copier directement
        elif any(file_path.endswith(ext) for ext in ['.jsp', '.html', '.css', '.js', '.xml']):
            self.copy_web_file(file_path)
    
    def compile_java(self):
        # Évitez de recompiler trop souvent
        current_time = time.time()
        if current_time - self.last_compile < 5:
            return
            
        print("🔨 Compilation Java...")
        result = subprocess.run(['mvn', 'compile'], 
                              cwd=self.project_dir,
                              capture_output=True,
                              text=True)
        
        if result.returncode == 0:
            print("✅ Compilation réussie")
            # Copier les classes
            classes_src = os.path.join(self.project_dir, 'target/classes')
            classes_dst = os.path.join(self.deploy_dir, 'WEB-INF/classes')
            
            if os.path.exists(classes_src):
                if os.path.exists(classes_dst):
                    shutil.rmtree(classes_dst)
                # Copier avec sudo pour les permissions
                subprocess.run(['sudo', 'cp', '-r', classes_src, classes_dst])
                print("✅ Classes mises à jour")
                # Changer les permissions
                subprocess.run(['sudo', 'chmod', '-R', '755', classes_dst])
        else:
            print("❌ Erreur de compilation:")
            print(result.stderr)
        
        self.last_compile = current_time
    
    def copy_web_file(self, file_path):
        # Calculez le chemin relatif
        rel_path = os.path.relpath(file_path, os.path.join(self.project_dir, 'src/main/webapp'))
        dst_path = os.path.join(self.deploy_dir, rel_path)
        
        try:
            # Créez le répertoire cible si nécessaire
            os.makedirs(os.path.dirname(dst_path), exist_ok=True)
            
            # Copiez le fichier avec sudo
            subprocess.run(['sudo', 'cp', file_path, dst_path])
            
            # Assurez les bonnes permissions (lecture pour tous)
            subprocess.run(['sudo', 'chmod', '644', dst_path])
            
            print(f"✅ Fichier copié: {rel_path}")
            
            # Toucher web.xml pour forcer le rechargement
            if file_path.endswith('.jsp'):
                webxml_path = os.path.join(self.deploy_dir, 'WEB-INF/web.xml')
                if os.path.exists(webxml_path):
                    subprocess.run(['sudo', 'touch', webxml_path])
                    print("🔄 web.xml touché (rechargement forcé)")
                    
        except Exception as e:
            print(f"❌ Erreur lors de la copie: {e}")

def main():
    project_dir = "/home/evens/Bureau/cloud_portfolio"
    deploy_dir = "/var/lib/tomcat10/webapps/cloud-portfolio"
    
    print("🚀 Démarrage du mode développement...")
    print(f"📂 Projet: {project_dir}")
    print(f"📦 Déploiement: {deploy_dir}")
    print("🌐 URL: http://localhost:8080/cloud-portfolio")
    print("👁️ Surveillance des modifications...")
    print("🛑 Ctrl+C pour arrêter\n")
    
    # Vérifiez les répertoires
    if not os.path.exists(deploy_dir):
        print("⚠️  Le répertoire de déploiement n'existe pas.")
        print("   Déployez d'abord avec: mvn clean package")
        print("   Puis décompressez le WAR dans le répertoire approprié.")
        return
    
    # Configurez les permissions pour le répertoire de déploiement
    print("🔧 Configuration des permissions...")
    subprocess.run(['sudo', 'chown', '-R', 'tomcat10:tomcat10', deploy_dir])
    subprocess.run(['sudo', 'chmod', '-R', '755', deploy_dir])
    
    # Autorisez votre utilisateur à écrire dans le répertoire via ACL
    subprocess.run(['sudo', 'setfacl', '-R', '-m', f'u:{os.getenv("USER")}:rwx', deploy_dir])
    
    # Compilez initialement
    print("🔨 Compilation initiale...")
    result = subprocess.run(['mvn', 'clean', 'compile'], 
                          cwd=project_dir,
                          capture_output=True,
                          text=True)
    
    if result.returncode != 0:
        print("❌ Erreur de compilation initiale:")
        print(result.stderr)
        return
    
    print("✅ Compilation initiale réussie")
    
    # Copiez les fichiers web initiaux
    webapp_src = os.path.join(project_dir, 'src/main/webapp')
    if os.path.exists(webapp_src):
        print("📁 Copie des fichiers web...")
        for root, dirs, files in os.walk(webapp_src):
            for file in files:
                src_file = os.path.join(root, file)
                rel_path = os.path.relpath(src_file, webapp_src)
                dst_file = os.path.join(deploy_dir, rel_path)
                
                # Créer le répertoire cible si nécessaire
                os.makedirs(os.path.dirname(dst_file), exist_ok=True)
                
                # Copier le fichier
                subprocess.run(['sudo', 'cp', src_file, dst_file])
                
                # Changer les permissions
                subprocess.run(['sudo', 'chmod', '644', dst_file])
        
        print("✅ Fichiers web copiés")
    
    # Configurez la surveillance
    event_handler = JSPChangeHandler(project_dir, deploy_dir)
    observer = Observer()
    
    # Surveillez les répertoires
    java_dir = os.path.join(project_dir, 'src/main/java')
    if os.path.exists(java_dir):
        observer.schedule(event_handler, java_dir, recursive=True)
    
    webapp_dir = os.path.join(project_dir, 'src/main/webapp')
    if os.path.exists(webapp_dir):
        observer.schedule(event_handler, webapp_dir, recursive=True)
    
    observer.start()
    print("\n🎯 Surveillance active! Modifiez vos fichiers et rafraîchissez le navigateur.")
    
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
        print("\n👋 Surveillance arrêtée.")
    
    observer.join()

if __name__ == "__main__":
    main()
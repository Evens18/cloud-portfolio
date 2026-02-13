<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Even's MOUNGALA - Cloud Architect & DevOps</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>☁️</text></svg>">
</head>
<body>
    <!-- Messages de feedback -->
    <c:if test="${not empty success}">
        <div class="alert success">
            <i class="fas fa-check-circle"></i> ${success}
            <span class="close-btn">&times;</span>
        </div>
    </c:if>
    
    <c:if test="${not empty error}">
        <div class="alert error">
            <i class="fas fa-exclamation-circle"></i> ${error}
            <span class="close-btn">&times;</span>
        </div>
    </c:if>

    <!-- Navigation -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="#home" class="logo">EM<span class="dot">.</span></a>
            <div class="menu-toggle" id="mobile-menu">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <ul class="nav-menu">
                <li><a href="#home" class="nav-link active">Accueil</a></li>
                <li><a href="#about" class="nav-link">À propos</a></li>
                <li><a href="#skills" class="nav-link">Compétences</a></li>
                <li><a href="#portfolio" class="nav-link">Portfolio</a></li>
                <li><a href="#services" class="nav-link">Services</a></li>
                <li><a href="#contact" class="nav-link">Contact</a></li>
            </ul>
        </div>
    </nav>

    <!-- Section Accueil -->
    <section id="home" class="home-section">
        <div class="container">
            <div class="home-container">
                <div class="home-text">
                    <span class="greeting">Bonjour, je suis</span>
                    <h1>Even's <span class="highlight">MOUNGALA</span></h1>
                    <div class="typing-container">
                        <h2>Je suis <span class="typed-text"></span><span class="cursor">&nbsp;</span></h2>
                    </div>
                    <p class="description">
                        Architecte Cloud & DevOps Engineer passionné par l'infrastructure, 
                        l'automatisation et les solutions scalables. Je conçois et déploie 
                        des architectures robustes pour propulser les entreprises vers le futur.
                    </p>
                    <div class="home-buttons">
                        <a href="#contact" class="btn btn-primary">Me Contacter</a>
                        <a href="src/main/webapp/doc/MY_CV_Francais.pdf" class="btn btn-secondary" download="Evens_cv.pdf">Télécharger CV</a>
                    </div>
                    <div class="social-icons">
                        <a href="https://github.com/Evens18/Java_Projet_By_Eunice_And_Evens" target="_blank" class="social-icon">
                            <i class="fab fa-github"></i>
                        </a>
                        <a href="https://www.linkedin.com/in/even-s-rick-moungala-ghomby-399834381/" target="_blank" class="social-icon">
                            <i class="fab fa-linkedin"></i>
                        </a>
                        <a href="https://x.com/Evens_Dev_241" target="_blank" class="social-icon">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="https://app.docker.com/accounts/evens18" target="_blank" class="social-icon">
                            <i class="fab fa-docker"></i>
                        </a>
                    </div>
                </div>
                <div class="home-image">
                    <div class="image-wrapper">
                        <div class="image-frame">
                            <img src="src/main/webapp/images/profil_4.jpg" 
                                 alt="Even's MOUNGALA">
                        </div>
                        <div class="tech-badges">
                            <span class="tech-badge"><i class="fab fa-python"></i> Python</span>
                            <span class="tech-badge"><i class="fab fa-aws"></i> AWS</span>
                            <span class="tech-badge"><i class="fab fa-docker"></i> Docker</span>
                            <span class="tech-badge"><i class="fas fa-cube"></i> Kubernetes</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="scroll-down">
            <a href="#about"><i class="fas fa-chevron-down"></i></a>
        </div>
    </section>

    <!-- Section À propos -->
    <section id="about" class="about-section">
        <div class="container">
            <div class="section-header">
                <span class="section-subtitle">Découvrez</span>
                <h2 class="section-title">À Propos de Moi</h2>
                <div class="underline"></div>
            </div>
            <div class="about-content">
                <div class="about-image">
                    <div class="image-container">
                        <img src="src/main/webapp/images/profil_3.png" 
                             alt="About Even's MOUNGALA">
                        <div class="experience-badge">
                            <h3>2+</h3>
                            <p>Années d'expérience</p>
                        </div>
                    </div>
                </div>
                <div class="about-text">
                    <h3>Cloud Architect & DevOps Specialist</h3>
                    <p>
                        Expert en conception et déploiement d'infrastructures cloud scalables et résilientes. 
                        Ma passion pour l'automatisation et l'optimisation me pousse à créer des solutions 
                        innovantes qui transforment les défis techniques en opportunités.
                    </p>
                    <p>
                        Avec une expertise approfondie en AWS, Azure, Kubernetes et Python, je développe 
                        des pipelines CI/CD robustes et des architectures microservices qui améliorent 
                        significativement la performance et la fiabilité des systèmes.
                    </p>
                    <div class="about-info">
                        <div class="info-item">
                            <span class="info-label"><i class="fas fa-user"></i> Nom :</span>
                            <span class="info-value">Even's MOUNGALA</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label"><i class="fas fa-envelope"></i> Email :</span>
                            <span class="info-value">evensmoungala@gmail.com</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label"><i class="fas fa-phone"></i> Téléphone :</span>
                            <span class="info-value">+241 077 40 05 82</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label"><i class="fas fa-map-marker-alt"></i> Localisation :</span>
                            <span class="info-value">Libreville, Gabon</span>
                        </div>
                    </div>
                    <a href="#portfolio" class="btn btn-outline">Voir mes projets</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Section Compétences -->
    <section id="skills" class="skills-section">
        <div class="container">
            <div class="section-header">
                <span class="section-subtitle">Expertise</span>
                <h2 class="section-title">Compétences Techniques</h2>
                <div class="underline"></div>
            </div>
            <div class="skills-grid">
                <div class="skill-category">
                    <div class="category-header">
                        <i class="fas fa-cloud"></i>
                        <h3>Cloud Platforms</h3>
                    </div>
                    <div class="skill-items">
                        <div class="skill-item">
                            <div class="skill-name">
                                <span>Huawei Cloud</span>
                                <span>90%</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" style="width: 90%"></div>
                            </div>
                        </div>
                        <div class="skill-item">
                            <div class="skill-name">
                                <span>Azure</span>
                                <span>85%</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" style="width: 85%"></div>
                            </div>
                        </div>
                        <div class="skill-item">
                            <div class="skill-name">
                                <span>Google Cloud</span>
                                <span>75%</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" style="width: 75%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="skill-category">
                    <div class="category-header">
                        <i class="fas fa-code-branch"></i>
                        <h3>DevOps & Automation</h3>
                    </div>
                    <div class="skill-items">
                        <div class="skill-item">
                            <div class="skill-name">
                                <span>Docker & Kubernetes</span>
                                <span>95%</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" style="width: 95%"></div>
                            </div>
                        </div>
                        <div class="skill-item">
                            <div class="skill-name">
                                <span>CI/CD (Jenkins, GitLab)</span>
                                <span>90%</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" style="width: 90%"></div>
                            </div>
                        </div>
                        <div class="skill-item">
                            <div class="skill-name">
                                <span>Terraform & Ansible</span>
                                <span>88%</span>
                            </div>
                            <div class="skill-bar">
                                <div class="skill-progress" style="width: 88%"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="certifications">
                <h3>Certifications</h3>
                <div class="certs-grid">
                    <div class="cert-card">
                        <i class="fas fa-certificate"></i>
                        <h4>HCIA-Cloud Computing</h4>
                        <p>Associate Level</p>
                    </div>
                    <div class="cert-card">
                        <i class="fas fa-certificate"></i>
                        <h4>HCIA-Cloud Service</h4>
                        <p>Associate Level</p>
                    </div>
                    <div class="cert-card">
                        <i class="fas fa-certificate"></i>
                        <h4>HCIA-AI V4.0</h4>
                        <p>Associate Level</p>
                    </div>
                    <div class="cert-card">
                        <i class="fas fa-certificate"></i>
                        <h4>CISCO Hardware Basic</h4>
                        <p>Associate Level</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Section Portfolio -->
    <section id="portfolio" class="portfolio-section">
        <div class="container">
            <div class="section-header">
                <span class="section-subtitle">Réalisations</span>
                <h2 class="section-title">Portfolio de Projets</h2>
                <div class="underline"></div>
            </div>
            <div class="portfolio-filters">
                <button class="filter-btn active" data-filter="all">Tous</button>
                <button class="filter-btn" data-filter="cloud">Cloud</button>
                <button class="filter-btn" data-filter="devops">DevOps</button>
                <button class="filter-btn" data-filter="automation">Automation</button>
            </div>
            <div class="portfolio-grid">
                <div class="portfolio-card" data-category="cloud devops">
                    <div class="portfolio-image">
                        <img src="https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-4.0.3&auto=format&fit=crop&w=872&q=80" 
                             alt="Migration Cloud">
                    </div>
                    <div class="portfolio-content">
                        <h3>Migration Cloud Multi-Région</h3>
                        <p>Architecture AWS hautement disponible avec auto-scaling</p>
                        <div class="portfolio-tags">
                            <span>AWS</span>
                            <span>Terraform</span>
                            <span>Docker</span>
                        </div>
                    </div>
                </div>
                <div class="portfolio-card" data-category="devops automation">
                    <div class="portfolio-image">
                        <img src="https://images.unsplash.com/photo-1558494949-ef010cbdcc31?ixlib=rb-4.0.3&auto=format&fit=crop&w=874&q=80" 
                             alt="CI/CD Pipeline">
                    </div>
                    <div class="portfolio-content">
                        <h3>Pipeline CI/CD Enterprise</h3>
                        <p>Automatisation complète du déploiement avec tests intégrés</p>
                        <div class="portfolio-tags">
                            <span>Jenkins</span>
                            <span>Kubernetes</span>
                            <span>GitLab</span>
                        </div>
                    </div>
                </div>
                <div class="portfolio-card" data-category="cloud automation">
                    <div class="portfolio-image">
                        <img src="https://images.unsplash.com/photo-1558494949-ef010cbdcc31?ixlib=rb-4.0.3&auto=format&fit=crop&w=874&q=80" 
                             alt="Infrastructure as Code">
                    </div>
                    <div class="portfolio-content">
                        <h3>Infrastructure as Code</h3>
                        <p>Déploiement automatisé avec Terraform et Ansible</p>
                        <div class="portfolio-tags">
                            <span>Terraform</span>
                            <span>Ansible</span>
                            <span>Azure</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Section Services -->
    <section id="services" class="services-section">
        <div class="container">
            <div class="section-header">
                <span class="section-subtitle">Services</span>
                <h2 class="section-title">Ce Que Je Propose</h2>
                <div class="underline"></div>
            </div>
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-cloud"></i>
                    </div>
                    <h3>Cloud Architecture</h3>
                    <p>Conception et déploiement d'architectures cloud scalables, sécurisées et optimisées.</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-code-branch"></i>
                    </div>
                    <h3>DevOps Engineering</h3>
                    <p>Mise en place de pipelines CI/CD robustes et automatisation du cycle de développement.</p>
                </div>
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-server"></i>
                    </div>
                    <h3>System Administration</h3>
                    <p>Administration système Linux, gestion de serveurs et optimisation des performances.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Section Contact -->
    <section id="contact" class="contact-section">
        <div class="container">
            <div class="section-header">
                <span class="section-subtitle">Contactez-moi</span>
                <h2 class="section-title">Travaillons Ensemble</h2>
                <div class="underline"></div>
            </div>
            <div class="contact-container">
                <div class="contact-info">
                    <h3>Discutons de votre projet</h3>
                    <p>Vous avez un projet cloud, besoin d'automatisation ou d'optimisation de votre infrastructure ? 
                       Je serais ravi d'échanger avec vous.</p>
                    <div class="contact-details">
                        <div class="contact-item">
                            <i class="fas fa-envelope"></i>
                            <div>
                                <h4>Email</h4>
                                <p>evensmoungala@gmail.com</p>
                            </div>
                        </div>
                        <div class="contact-item">
                            <i class="fas fa-phone"></i>
                            <div>
                                <h4>Téléphone</h4>
                                <p>+241 077 40 05 82</p>
                            </div>
                        </div>
                        <div class="contact-item">
                            <i class="fas fa-map-marker-alt"></i>
                            <div>
                                <h4>Localisation</h4>
                                <p>Libreville, Gabon</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="contact-form">
                    <form action="${pageContext.request.contextPath}/contact" method="post">
                        <div class="form-group">
                            <input type="text" name="name" placeholder="Votre nom" required>
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" placeholder="Votre email" required>
                        </div>
                        <div class="form-group">
                            <input type="text" name="subject" placeholder="Sujet" required>
                        </div>
                        <div class="form-group">
                            <textarea name="message" rows="5" placeholder="Votre message" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Envoyer le message</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-left">
                    <h3>Even's MOUNGALA</h3>
                    <p>Cloud Architect | DevOps Engineer | System Administrator</p>
                </div>
                <div class="footer-links">
                    <h4>Navigation</h4>
                    <ul>
                        <li><a href="#home">Accueil</a></li>
                        <li><a href="#about">À propos</a></li>
                        <li><a href="#skills">Compétences</a></li>
                        <li><a href="#portfolio">Portfolio</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div>
                <div class="footer-social">
                    <h4>Suivez-moi</h4>
                    <div class="social-links">
                        <a href="https://github.com/Evens18/Java_Projet_By_Eunice_And_Evens" target="_blank"><i class="fab fa-github"></i></a>
                        <a href="https://www.linkedin.com/in/even-s-rick-moungala-ghomby-399834381/" target="_blank"><i class="fab fa-linkedin"></i></a>
                        <a href="https://x.com/Evens_Dev_241" target="_blank"><i class="fab fa-twitter"></i></a>
                        <a href="https://app.docker.com/accounts/evens18" target="_blank"><i class="fab fa-docker"></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 Even's MOUNGALA. Tous droits réservés.</p>
            </div>
        </div>
    </footer>

    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
</body>
</html>

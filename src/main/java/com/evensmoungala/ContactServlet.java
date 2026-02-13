package com.evensmoungala;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class ContactServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Récupération des paramètres du formulaire
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        
        // Validation simple
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            subject == null || subject.trim().isEmpty() ||
            message == null || message.trim().isEmpty()) {
            
            request.setAttribute("error", "Tous les champs sont requis.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }
        
        // Simuler l'enregistrement du message
        System.out.println("=== NOUVEAU MESSAGE ===");
        System.out.println("De: " + name + " (" + email + ")");
        System.out.println("Sujet: " + subject);
        System.out.println("Message: " + message);
        System.out.println("=====================");
        
        // Stocker un message de succès
        request.setAttribute("success", 
            "Merci pour votre message " + name + "! Je vous répondrai dans les plus brefs délais.");
        
        // Redirection vers la page d'accueil
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}

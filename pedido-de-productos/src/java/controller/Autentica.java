package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;

@WebServlet(name = "Autentica", urlPatterns = {"/autentica"})
public class Autentica extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        Usuario us = new Usuario();
        String user = request.getParameter("usuario");        
        String psw = request.getParameter("password");
        Usuario logueado = us.autoriza(user, psw);
        if (logueado != null){
            HttpSession sessionUsuario = request.getSession(); 
            sessionUsuario.setAttribute("logueado", logueado);
            request.getRequestDispatcher("productos.jsp").forward(request, response);
        } else{
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } 

    }
}

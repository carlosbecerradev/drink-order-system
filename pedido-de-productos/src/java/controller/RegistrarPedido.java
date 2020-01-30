package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Articulo;
import model.DetallePedido;
import model.Pedido;
import model.Producto;
import model.Usuario;


@WebServlet(name = "RegistrarPedido", urlPatterns = {"/registrarpedido"})
public class RegistrarPedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession sesion = request.getSession(true);        
        ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? new ArrayList<>() : (ArrayList)sesion.getAttribute("carrito");
    
        Pedido nuevoPedido = new Pedido();
        Collection<DetallePedido> listDetallePedido = new ArrayList<DetallePedido>();
        Usuario usuarioLogueado;
        
        // nuevoPedido.setUsuario(usuarioLogueado);
        nuevoPedido.setFecha(new Date());
        nuevoPedido.setMonto_final(Double.MIN_NORMAL);
        
        if (articulos != null) {
            for (Articulo articulo : articulos) {
                DetallePedido detallePedido = new DetallePedido();
                detallePedido.setId_pedido(nuevoPedido.getId_pedido());
                detallePedido.setId_producto(articulo.getIdProducto());
                detallePedido.setCantidad(articulo.getCantidad());
            }
        }
        
        sesion.setAttribute("carrito", null);
    
        response.sendRedirect("ver_pedidos.jsp");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

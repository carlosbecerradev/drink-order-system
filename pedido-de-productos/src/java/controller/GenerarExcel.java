package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "GenerarExcel", urlPatterns = {"/generarexcel"})
public class GenerarExcel extends HttpServlet {
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try (PrintWriter out = response.getWriter()) {
            
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "attachmet; filename=miexcel.xls");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", -1);
            
            String fecha = request.getParameter("fecha");
            String monto_final = request.getParameter("montofinal");
            String [] producto = request.getParameterValues("producto");
            String [] precio = request.getParameterValues("precio");
            String [] cantidad = request.getParameterValues("cantidad");
            String [] importe = request.getParameterValues("importe");
            
            out.println("\t"+ "Fecha" + "\t" +fecha);
            out.println("");
            out.println("\t"+ "Detalle del Pedido");
            out.println("\t"+ "Producto" + "\t"+ "Precio (S/" +"\t"+ "Cantidad"+"\t"+ "Importe (S/");
            for (int i = 0; i < producto.length; i++) {
                out.println("\t"+ producto[i] + "\t"+ precio[i] +"\t"+ cantidad[i] +"\t"+ importe[i]);
            }
            
            out.println("\t\t\tTotal (S/)\t+" + monto_final);
        }
        
    }


}

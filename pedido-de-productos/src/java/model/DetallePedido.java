package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.LinkedList;

public class DetallePedido {

    private Integer id_detalle_pedido;
    private Integer id_pedido;
    private Integer id_producto;
    private Integer cantidad;

    public DetallePedido() {
    }

    public Integer getId_detalle_pedido() {
        return id_detalle_pedido;
    }

    public void setId_detalle_pedido(Integer id_detalle_pedido) {
        this.id_detalle_pedido = id_detalle_pedido;
    }

    public Integer getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(Integer id_pedido) {
        this.id_pedido = id_pedido;
    }

    public Integer getId_producto() {
        return id_producto;
    }

    public void setId_producto(Integer id_producto) {
        this.id_producto = id_producto;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    /* Gestion de Producto*/
    private Connection conexion;

    public void conecta() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bd_donlicor";
            String login = "root";
            String pass = "12345678";
            this.conexion = DriverManager.getConnection(url, login, pass);
        } catch (Exception ex) {
            System.out.println("No se conectó ... ");
        }
    }

    public LinkedList<DetallePedido> listaDetallePedidosPorIdPedido(Integer id_pedido) {
        try {
            conecta();
            String query = "SELECT * FROM DetallePedido where id_pedido = " + id_pedido;
            Statement sentencia = conexion.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<DetallePedido> lista;
            lista = new LinkedList<DetallePedido>();
            while (resultado.next()) {
                DetallePedido u = new DetallePedido();
                u.setId_detalle_pedido(resultado.getInt("id_detalle_pedido"));
                u.setId_pedido(resultado.getInt("id_pedido"));
                u.setId_producto(resultado.getInt("id_producto"));
                u.setCantidad(resultado.getInt("cantidad"));
                lista.add(u);
            }
            conexion.close();
            return lista;
        } catch (Exception ex) {
            System.out.println("Problemas ... ");
        }
        return null;
    }
    
    public void agregaDetallePedido(Integer id_pedido, Integer id_producto, Integer cantidad) {
        try {
            conecta();
            String query = "insert into DetallePedido(id_pedido,id_producto,cantidad) values (?,?,?)";
            PreparedStatement sentencia = conexion.prepareStatement(query);
            sentencia.setInt(1, id_pedido);
            sentencia.setInt(2, id_producto);
            sentencia.setInt(3, cantidad);
            sentencia.executeUpdate();
            sentencia.close();
            conexion.close();
        } catch (Exception ex) {
            System.out.println("Problemas ... ");
        }
    }
    
    
}

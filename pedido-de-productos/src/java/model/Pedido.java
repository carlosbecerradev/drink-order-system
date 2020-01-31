package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.LinkedList;

public class Pedido {

    private Integer id_pedido;
    private Integer id_usuario;
    private Date fecha;
    private Double monto_final;

    public Pedido() {
    }

    public Integer getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(Integer id_pedido) {
        this.id_pedido = id_pedido;
    }

    public void setId_usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Integer getId_usuario() {
        return id_usuario;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Double getMonto_final() {
        return monto_final;
    }

    public void setMonto_final(Double monto_final) {
        this.monto_final = monto_final;
    }

    /* Gestion de Producto*/
    private Connection conexion;

    public void conecta() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bd_beeru";
            String login = "root";
            String pass = "12345678";
            this.conexion = DriverManager.getConnection(url, login, pass);
        } catch (Exception ex) {
            System.out.println("No se conectó ... ");
        }
    }
    
    public LinkedList<Pedido> listaPedidosPorIdUsuario(Integer id_usuario) {
        try {
            conecta();
            String query = "SELECT * FROM Pedido where id_usuario = " + id_usuario;
            Statement sentencia = conexion.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Pedido> lista;
            lista = new LinkedList<Pedido>();
            while (resultado.next()) {
                Pedido u = new Pedido();
                u.setId_pedido(resultado.getInt("id_pedido"));
                u.setId_usuario(resultado.getInt("id_usuario"));
                u.setFecha(resultado.getDate("fecha"));
                u.setMonto_final(resultado.getDouble("monto_final"));
                lista.add(u);
            }
            conexion.close();
            return lista;
        } catch (Exception ex) {
            System.out.println("Problemas ... ");
        }
        return null;
    }

    public LinkedList<Pedido> listaPedidos() {
        try {
            conecta();
            String query = "SELECT * FROM Pedido";
            Statement sentencia = conexion.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Pedido> lista;
            lista = new LinkedList<Pedido>();
            while (resultado.next()) {
                Pedido u = new Pedido();
                u.setId_pedido(resultado.getInt("id_pedido"));
                u.setId_usuario(resultado.getInt("id_usuario"));
                u.setFecha(resultado.getDate("fecha"));
                u.setMonto_final(resultado.getDouble("monto_final"));
                lista.add(u);
            }
            conexion.close();
            return lista;
        } catch (Exception ex) {
            System.out.println("Problemas ... ");
        }
        return null;
    }

    public Integer agregaPedido(Integer id_usuario, Date fecha, Double monto_final) {
        try {
            conecta();
            String query = "insert into Pedido(id_usuario,fecha,monto_final) values (?,?,?)";
            PreparedStatement sentencia = conexion.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            sentencia.setInt(1, id_usuario);
            sentencia.setDate(2, fechaPedido(fecha));
            sentencia.setDouble(3, monto_final);
            sentencia.executeUpdate();
            ResultSet rs = sentencia.getGeneratedKeys();
            if (rs != null && rs.next() ) {
                return  rs.getInt(1);
            }
            sentencia.close();
            conexion.close();
        } catch (Exception ex) {
            System.out.println("Problemas ... ");
        }
        return -1;
    }

    private java.sql.Date fechaPedido(Date fecha) {
        java.sql.Date fechaSQL = new java.sql.Date(fecha.getTime());
        return fechaSQL;
    }

}

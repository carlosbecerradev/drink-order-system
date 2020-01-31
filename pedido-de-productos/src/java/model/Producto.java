package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

public class Producto {

    private Integer id_producto;
    private String nombre;
    private Double precio;
    private Integer stock;

    public Producto() {
    }

    public Integer getId_producto() {
        return id_producto;
    }

    public void setId_producto(Integer id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
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

    public LinkedList<Producto> listarProductos() {
        try {
            conecta();
            String query = "select * from Producto";
            Statement sentencia = conexion.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Producto> lista;
            lista = new LinkedList<Producto>();
            while (resultado.next()) {
                Producto p = new Producto();
                p.setId_producto(resultado.getInt("id_producto"));
                p.setNombre(resultado.getString("nombre"));
                p.setPrecio(resultado.getDouble("precio"));
                p.setStock(resultado.getInt("stock"));
                lista.add(p);
            }
            conexion.close();
            return lista;
        } catch (Exception ex) {
            System.out.println("Problemas ... ");
        }
        return null;
    }

    public Producto buscarProductoById(Integer id_producto) {
        try {
            conecta();
            String query = "select * from Producto where id_producto=" + id_producto;
            Statement sentencia = conexion.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            Producto p = new Producto();
            resultado.next();
            p.setId_producto(resultado.getInt("id_producto"));
            p.setNombre(resultado.getString("nombre"));
            p.setPrecio(resultado.getDouble("precio"));
            p.setStock(resultado.getInt("stock"));

            conexion.close();
            return p;
        } catch (Exception ex) {
            System.out.println("Problemas ... ");
        }
        return null;
    }

}

package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;

public class Usuario {

    private Integer id_usuario;
    private String username;
    private String contrasenia;
    private Integer celular;

    public Usuario() {
    }

    public String getUsername() {
        return username;
    }

    public Integer getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public Integer getCelular() {
        return celular;
    }

    public void setCelular(Integer celular) {
        this.celular = celular;
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

    public Usuario autoriza(String usr, String psw) {
        try {
            conecta();
            String query = "SELECT * FROM Usuario WHERE ";
            query = query + " username = '" + usr + "' AND ";
            query = query + " contrasenia = '" + psw + "'; ";
            Statement sentencia = conexion.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            Usuario u = new Usuario();
            resultado.next();
            u.setId_usuario(resultado.getInt("id_usuario"));
            u.setUsername(resultado.getString("username"));
            u.setContrasenia(resultado.getString("contrasenia"));
            u.setCelular(resultado.getInt("celular"));

            conexion.close();
            return u;
        } catch (Exception ex) {
            System.out.println("Problemas ... ");
        }
        return null;
    }

    public LinkedList<Usuario> listaUsuario() {
        try {
            conecta();
            String query = "SELECT * FROM Usuario";
            Statement sentencia = conexion.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            LinkedList<Usuario> lista;
            lista = new LinkedList<Usuario>();
            while (resultado.next()) {
                Usuario u = new Usuario();
                u.setId_usuario(resultado.getInt("id_usuario"));
                u.setUsername(resultado.getString("username"));
                u.setContrasenia(resultado.getString("contrasenia"));
                u.setCelular(resultado.getInt("celular"));
                lista.add(u);
            }
            conexion.close();
            return lista;
        } catch (Exception ex) {
            System.out.println("Problemas ... ");
        }
        return null;
    }

    public void agregaUsuario(String username, String contrasenia, Integer celular) {
        try {
            conecta();
            String query = "insert into Usuario(username,contrasenia,celular) values (?,?,?)";
            PreparedStatement sentencia = conexion.prepareStatement(query);
            sentencia.setString(1, username);
            sentencia.setString(2, contrasenia);
            sentencia.setInt(3, celular);
            sentencia.executeUpdate();
            sentencia.close();
            conexion.close();
        } catch (Exception ex) {
            System.out.println("Problemas ... ");
        }
    }

    public void editaUsuario(String username, String contrasenia, Integer celular, Integer id_usuario) {
        try {
            conecta();
            String query = "update Usuario set username=?, contrasenia=?, celular=? where id_usuario=?";
            PreparedStatement sentencia = conexion.prepareStatement(query);
            sentencia.setString(1, username);
            sentencia.setString(2, contrasenia);
            sentencia.setInt(3, celular);
            sentencia.setInt(4, id_usuario);
            sentencia.executeUpdate();
            sentencia.close();
            conexion.close();
        } catch (Exception ex) {
            System.out.println("Problemas ... ");
        }
    }

    public void eliminaUsuario(Integer id_usuario) {
        try {
            conecta();
            String query = "delete from Usuario where id_usuario=?";
            PreparedStatement sentencia = conexion.prepareStatement(query);
            sentencia.setInt(1, id_usuario);
            sentencia.executeUpdate();
            sentencia.close();
            conexion.close();
        } catch (Exception ex) {
            System.out.println("Problemas ... ");
        }
    }
 
    
    public Usuario buscarUsuarioById(Integer id_usuario) {
        try {
            conecta();
            String query = "select * from Usuario where id_usuario=" + id_usuario;
            Statement sentencia = conexion.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);
            Usuario u = new Usuario();
            resultado.next();
            u.setId_usuario(resultado.getInt("id_usuario"));
            u.setUsername(resultado.getString("username"));
            u.setContrasenia(resultado.getString("contrasenia"));
            u.setCelular(resultado.getInt("celular"));

            conexion.close();
            return u;
        } catch (Exception ex) {
            System.out.println("Problemas ... ");
        }
        return null;
    }

    
}

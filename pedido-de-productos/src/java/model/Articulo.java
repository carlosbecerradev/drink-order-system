package model;

public class Articulo {
    private Integer idProducto;
    private Integer cantidad;

    public Articulo(Integer idProducto, Integer cantidad) {
        this.idProducto = idProducto;
        this.cantidad = cantidad;
    }

    public Integer getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Integer idProducto) {
        this.idProducto = idProducto;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }
    
    public Double getImporte(Producto prod){
        return Math.ceil(this.getCantidad() * prod.getPrecio());
    }
}

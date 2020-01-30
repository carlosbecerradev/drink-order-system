<%@page import="model.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Articulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    HttpSession sesion = request.getSession(true);        
    ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList)sesion.getAttribute("carrito");      
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Don Licor - Carrito</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              crossorigin="anonymous">
    </head>
    <body>        
        <header class="text-center bg-white">
            <a class="display-4 py-2 text-dark" href="#"></a>
        </header>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark justify-content-center">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                    aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown">
                <ul class="navbar-nav text-center">
                    <li class="nav-item  mx-4">
                        <a class="nav-link" href="productos.jsp">Productos</a>
                    </li>
                    <li class="nav-item mx-4">
                        <a class="nav-link active" href="carrito.jsp">Carrito</a>
                    </li>
                    <li class="nav-item dropdown mx-4">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Usuario
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="ver_pedidos.jsp">Ver Pedidos</a>
                            <form method="post" action="cerrarsesion">
                                <button class="dropdown-item">Cerrar sesión</button>
                            </form>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        
        <!-- contenido-->   
        <%  if (sesion.getAttribute("logueado") != null) { %>
        <div class="container mt-5">
            <h1 class="mb-3">| Su Carrito de Pedidos</h1>
            <table class="table table-light table-hover table-bordered ">
                <thead class="thead-dark ">
                    <tr>
                        <th>Producto</th>
                        <th>Precio (S/)</th>
                        <th>Cantidad</th>
                        <th>Importe (S/)</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Producto p = new Producto();
                        double monto = 0;
                        if(articulos != null){
                        for (Articulo articulo : articulos) {
                                Producto prod = p.buscarProductoById(articulo.getIdProducto());            
                    %>  
                    <tr>  
                        <td class="border"><%= prod.getNombre()%></td>
                        <td class="border"><%= prod.getPrecio()%></td>
                        <td class="border"><%= articulo.getCantidad()%></td>
                        <td class="border"><%= articulo.getImporte(prod) %></td>
                        <td class="border">
                             <form method="post" action="quitarproducto">
                                <input type="hidden" value="<%= prod.getId_producto()%>"  name="idProducto"/>
                                <button class="btn btn-danger btn-sm">Quitar Articulo</button>
                            </form>
                        </td>
                    </tr>
                    <% 
                        monto += Math.round(articulo.getCantidad() * prod.getPrecio());
                        }}
                    %>
                </tbody>
            </table>
            <hr>
            <p style="font-size: 2rem;">Monto Final: <span class="text-success">S/ <% out.print(monto); %></span></p>
            <hr>
            <a class="btn btn-primary" href="javascript:window.history.go(-1)">Seguir comprando</a>
            <button class="btn btn-success">Registrar Pedido</button>
        </div>       
        <% }%>       

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
                integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
                integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
                integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
    </body>
</html>

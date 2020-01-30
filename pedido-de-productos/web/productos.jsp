<%@page import="java.util.LinkedList"%>
<%@page import="model.Usuario"%>
<%@page import="model.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesion = request.getSession(true);   %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Don Licor - Productos</title>
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
                    <li class="nav-item active mx-4">
                        <a class="nav-link" href="productos.jsp">Productos</a>
                    </li>
                    <li class="nav-item mx-4">
                        <a class="nav-link" href="carrito.jsp">Carrito</a>
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
            <h1 class="mb-2">|Productos</h1>
            <div class="row justify-content-center">   
                
                <%
                    Producto p = new Producto();
                    LinkedList<Producto> ListaUsuario = p.listarProductos();
                    for (Producto producto : ListaUsuario) {
                %>
                <div class="col-12 col-sm-6 col-md-6 col-lg-4 col-xl-3">   
                    <form method="post" action="agregarcarrito" class="border m-3">
                        <input type="hidden" value="<%= producto.getId_producto()%>" name="idProducto" />
                        <div class="bg-dark" style="width: 100%;height: 200px;"></div>
                        <div class="text-center">
                            <p class="my-2 px-2 font-weight-bold"><%= producto.getNombre()%></p>
                            <p class="my-2 px-2 text-success" style="font-size: 1.8rem;">
                                S/ <span><%= producto.getPrecio()%></span>
                            </p>
                            <div class="border"></div>
                            <div class="d-flex justify-content-center align-items-center py-2">                                                       
                                <input type="number" name="cantidad" value="0" min="0" style="width: 60px;" class="text-center mr-2 form-control" autocomplete="off" />
                                <button class="btn btn-dark ml-2">AÑADIR</button>
                            </div>
                        </div>
                    </form>
                </div>
                <% }%>
            </div>
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

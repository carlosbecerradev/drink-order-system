<%@page import="model.Usuario"%>
<%@page import="model.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Articulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession(true);
    ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
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
        <script src="https://kit.fontawesome.com/9dca648001.js" crossorigin="anonymous"></script>
    </head>
    <body>        
        <header class="container text-center bg-white border-bottom">
            <div class=" d-flex justify-content-between align-items-center">
                <div class="py-2 text-dark flex-grow-0" href="#" style="font-size: 1.5rem;">
                    <a class="m-0 text-success "  href="login.jsp"><i class="fas fa-beer"></i> Beeru</a>                       
                </div>
                <nav class="navbar navbar-expand-md navbar-light bg-white justify-content-center">
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
                                <a class="nav-link " href="carrito.jsp">Carrito</a>
                            </li>

                        </ul>
                    </div>
                </nav>
                <div class="dropdown  d-inline">
                    <div class="nav-link dropdown-toggle text-success" href="#" id="navbarDropdownMenuLink" role="button"
                         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <%
                            Usuario usr = (Usuario) sesion.getAttribute("logueado");
                            if (usr != null) {
                                out.print(usr.getUsername().toUpperCase());
                            } else {
                                out.print("Usuario");
                            } %>

                    </div>

                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <%
                            if (usr != null) { %>
                        <a class="dropdown-item " href="ver_pedidos.jsp">Ver Pedidos</a>
                        <form method="post" action="cerrarsesion">
                            <button class="dropdown-item">Cerrar sesión</button>
                        </form>
                        <% } else { %>
                        <a class='dropdown-item ' href='registrar_cliente.jsp'>Registrate</a>
                        <a class='dropdown-item active' href='login.jsp'>Logueate</a>
                        <% }%>

                    </div>
                </div>
            </div>            
        </header>

        <!-- contenido-->   
        <%  if (sesion.getAttribute("logueado") != null) { %>
        <div class="container my-5">
            <h1 class="mb-0">Carrito de pedidos</h1>
            <div class="my-3">                
                <a class="btn btn-outline-dark" href="productos.jsp">Seguir comprando</a>
            </div>
            <table class="table table-light table-hover table-bordered text-center table-responsive-sm">
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
                        if (articulos != null) {
                            for (Articulo articulo : articulos) {
                                Producto prod = p.buscarProductoById(articulo.getIdProducto());
                    %>  
                    <tr>  
                        <td class="border"><%= prod.getNombre()%></td>
                        <td class="border"><%= prod.getPrecio()%></td>
                        <td class="border"><%= articulo.getCantidad()%></td>
                        <td class="border"><%= articulo.getImporte(prod)%></td>
                        <td class="border">
                            <form method="post" action="quitarproducto">
                                <input type="hidden" value="<%= prod.getId_producto()%>"  name="idProducto"/>
                                <button class="btn btn-danger btn-sm">Quitar Articulo</button>
                            </form>
                        </td>
                    </tr>
                    <%
                                monto += Math.round(articulo.getCantidad() * prod.getPrecio());
                            }
                        }
                    %>
                </tbody>
            </table>
            <hr>
            <div class="row justify-content-between align-items-center">
                <div class="col-12 col-sm-6">
                    <p class="m-0" style="font-size: 2rem;">Monto Final: <span class="text-success">S/ <% out.print(monto);%></span></p>
                </div>
                <div class="col-12 col-sm-6">
                    <form method="post" action="registrarpedido" class="mt-3 mt-sm-0">
                        <input type="hidden" value="<%= monto%>" name="monto_final"/>
                        <button class="btn btn-success float-right btn-md">Registrar Pedido</button>
                    </form>
                </div>
            </div>
        </div>       
        <% } else { %>    
        <div class="container mt-5">
            <div class="alert alert-warning" role="alert">
                Necesitas tener una cuenta
                <a class='ml-2 mr-2' href='registrar_cliente.jsp'>Registrate</a>
                o
                <a class='ml-2 mr-2' href='login.jsp'>Inicia sesión</a>
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

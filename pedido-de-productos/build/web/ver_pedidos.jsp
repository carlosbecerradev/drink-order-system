<%@page import="java.util.LinkedList"%>
<%@page import="model.DetallePedido"%>
<%@page import="model.Producto"%>
<%@page import="model.Usuario"%>
<%@page import="model.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% HttpSession sesion = request.getSession(true); %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Beeru - Tus Pedidos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/9dca648001.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <header class="container text-center bg-white border-bottom">
            <div class=" d-flex justify-content-between align-items-center">
                <div class="py-2 text-dark flex-grow-0" href="#" style="font-size: 1.5rem;">
                    <a class="m-0 text-success"  href="login.jsp"><i class="fas fa-beer"></i> Beeru</a>                       
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

                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                        <%
                            if (usr != null) { %>
                        <a class="dropdown-item active" href="ver_pedidos.jsp">Ver Pedidos</a>
                        <form method="post" action="cerrarsesion">
                            <button class="dropdown-item">Cerrar sesión</button>
                        </form>
                        <% } else { %>
                        <a class='dropdown-item ' href='registrar_cliente.jsp'>Registrate</a>
                        <a class='dropdown-item' href='login.jsp'>Logueate</a>
                        <% }%>

                    </div>
                </div>
            </div>            
        </header>
        <!-- contenido-->
        <%  if (sesion.getAttribute("logueado") != null) { %>

        <div class="container my-5">
            <h1 class="mb-4">Mis pedidos</h1>
            <div class="row align-items-center">
                <%
                    Pedido p = new Pedido();
                    Usuario usuario = (Usuario) sesion.getAttribute("logueado");

                    if (usuario != null) {
                        for (Pedido pedido : p.listaPedidosPorIdUsuario(usuario.getId_usuario())) {
                %>  
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="card border-dark mb-3 w-100">
                        <div class="card-header bg-dark text-white border-dark">Pedido el <%= pedido.getFecha()%></div>
                        <div class="card-body text-secondary">
                            <h5 class="card-title text-success">Detalle del Pedido</h5>
                            <%
                                DetallePedido detallepedido = new DetallePedido();
                                LinkedList<DetallePedido> ListaDetallePedido = detallepedido.listaDetallePedidosPorIdPedido(pedido.getId_pedido());
                                if (ListaDetallePedido.size() > 0) {
                                    for (DetallePedido dt : ListaDetallePedido) {
                                        Producto prod = new Producto();
                                        Producto producto = prod.buscarProductoById(dt.getId_producto());
                            %>
                            <div class="alert alert-light">
                                <p class="card-text mb-0 text-dark"><%=  producto.getNombre()%></p>
                                <ul class="m-0">
                                    <li>Precio: S/ <%=  producto.getPrecio()%></li>
                                    <li>Cantidad: <%=  dt.getCantidad()%></li>
                                    <li>Importe: S/ <%=  dt.getCantidad() * producto.getPrecio()%></li>
                                </ul>
                            </div>
                            <% }
                                }%>
                        </div>
                        <div class="card-footer bg-transparent">
                            <span>Monto Final:</span> <span class="ml-4  text-success" style="font-size: 1.5rem;">S/ <%= pedido.getMonto_final()%></span>
                        </div>
                    </div>
                </div>     
                <% }
                    }%>
            </div>
        </div>     
        <footer class="bg-success text-light mt-5">
            <div class="container">
                <div class="row align-items-center text-center">
                    <div class="col-12 col-sm-6 col-md-4">
                        <div class="my-3">
                            <p class="mb-1">500 Surco - San Roque</p>
                            <p class="mb-1">Calle Mallbor CB 40023</p>
                            <br>
                            <p class="mb-1">Email: hello@beeru.com</p>
                            <p class="mb-1">Celular: 920 523 578</p>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-4 offset-md-4">
                        <div class="my-3">
                            <p class="mb-1">Recibe nuestros novedades</p>
                            <form>
                                <input type="text" class="form-control" placeholder="tucorreo@gmail.com" />
                                <button class="btn btn-dark mt-2">Subscribirse</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
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

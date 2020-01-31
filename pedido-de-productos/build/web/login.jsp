<%@page import="model.Usuario"%>
<%@page import="model.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Don Licor - Inicio</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/9dca648001.js" crossorigin="anonymous"></script>
        <style>img{object-fit: cover;width: 100%;height: 100%;object-position: center;}</style>
    </head>
    <body >
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

        <div class="container my-4">
            <h1>Inicia sesión para realizar sus pedidos</h1>
            <form class="needs-validation mt-4 " method="post" action="autentica">
                <div class="form-row justify-content-between">
                    <div class="col-md-4 mb-3">
                        <label >Usuario</label>
                        <input type="text" name="usuario" class="form-contol w-100">
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Contraseña</label>
                        <input type="password" name="password" class="form-contol w-100">
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="h-100 w-100 d-flex justify-content-center align-items-end">
                            <button class="btn btn-dark btn-block btn-sm">Iniciar</button>
                        </div>                        
                    </div>
                </div>
            </form>
        </div>
        <div id="carouselExampleFade" class="carousel slide carousel-fade container" data-ride="carousel"
             style="height: 320px;overflow: hidden;" >
            <div class="carousel-inner h-100">
                <div class="carousel-item active" data-interval="1500">
                    <img src="https://cdn.pixabay.com/photo/2016/11/29/02/53/bottle-caps-1866945_960_720.jpg" 
                         style="height: 500px;"/>
                </div>
                <div class="carousel-item " data-interval="15000">
                    <img src="https://cdn.pixabay.com/photo/2016/03/27/18/47/beers-1283566_960_720.jpg" 
                         style="height: 500px;"/>
                </div>
                <div class="carousel-item">
                    <img src="https://cdn.pixabay.com/photo/2015/07/10/17/53/cheers-839865_960_720.jpg" 
                         style="height: 500px;"/>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12 col-sm-6 col-md-4">

                </div>
            </div>
        </div>

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

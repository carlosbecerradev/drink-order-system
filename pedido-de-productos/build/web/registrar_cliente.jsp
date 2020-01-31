<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesion = request.getSession(true);   %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Beeru - Registrarse</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/9dca648001.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <header class="container text-center bg-white border-bottom">
            <div class=" d-flex justify-content-between align-items-center">
                <div class="py-2 flex-grow-0" style="font-size: 1.5rem;">
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

                    <div class="dropdown-menu  dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                        <%
                            if (usr != null) { %>
                        <a class="dropdown-item " href="ver_pedidos.jsp">Ver Pedidos</a>
                        <form method="post" action="cerrarsesion">
                            <button class="dropdown-item">Cerrar sesión</button>
                        </form>
                        <% } else { %>
                        <a class='dropdown-item active ' href='registrar_cliente.jsp'>Registrate</a>
                        <a class='dropdown-item' href='login.jsp'>Logueate</a>
                        <% }%>

                    </div>
                </div>
            </div>            
        </header>
        <div class="container  my-4">
            <h1>Crea tu cuenta y comienza a pedir nuestros productos</h1>
            <form class="needs-validation mt-4"  name="nuevoUsuario" method="post" action="registrarcliente">
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
                        <label>Celular</label>
                        <input type="number" name="celular" class="form-contol w-100">
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="h-100 w-100 d-flex justify-content-center align-items-end">
                            <button class="btn btn-dark btn-block btn-sm">Confirmar</button>
                        </div>                        
                    </div>
                </div>
            </form> 
        </div>

        <div class="container mt-5 py-3">
            <div class="row justify-content-center">
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="d-flex justify-content-center align-items-center flex-column mb-4 mb-md-0">
                        <i class="fas fa-truck mb-3 text-success" style="font-size: 2.5rem;"></i>
                        <p class="font-weight-bold">Envió y Retorno</p>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-md-4">
                    <div class="d-flex justify-content-center align-items-center flex-column mb-4 mb-md-0">
                        <i class="fas fa-lock mb-3 text-success" style="font-size: 2.5rem;"></i>
                        <p class="font-weight-bold">Pagos Segutos</p>
                    </div>
                </div>
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="d-flex justify-content-center align-items-center flex-column mb-4 mb-md-0">
                        <i class="fas fa-concierge-bell mb-3 text-success" style="font-size: 2.5rem;"></i>
                        <p class="font-weight-bold">Servicio al Cliente</p>
                    </div>
                </div>
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

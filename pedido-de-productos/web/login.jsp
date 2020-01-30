<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4"><br><br><br><br>
                    <div class="card" style="width: 400px;">
                        <div class="card-body">
                            <form name=login" method="post" action="autentica">
                                <h2 style="text-align:center">Login</h2>
                                <h5>Usuario</h5>
                                <input type="text" name="usuario" style="width: 100%;" class="form-contol"><br>
                                <h5>Contraseña</h5>
                                <input type="password" name="password"  style="width: 100%;" class="form-contol"><br><br>
                                <input type="submit" name="logme"  style="width: 100%;">
                            </form>
                        </div>
                    </div>                
                </div>
                <div class="col-sm-4"></div>
            </div>
        </div>
    </body>
</html>

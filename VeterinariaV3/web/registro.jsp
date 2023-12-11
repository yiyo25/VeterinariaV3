<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <title>AnimalVetPro</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    <link href="img/favicon.ico" rel="icon">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet"> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5">
                        <img src="img/team-2.jpg" width="450px"/>
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">¡Crea una cuenta!</h1>
                            </div>
                            <form class="user" method="POST" action="RegistroServlet">
                                <div class="form-group">
                                    <input type="text" name="nombres" class="form-control form-control-user" id="exampleFirstName"
                                            placeholder="Nombre y Apellidos">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <input type="number" name="dni" class="form-control form-control-user" id="exampleLastName"
                                            placeholder="N° Documento">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="number" name="celular" class="form-control form-control-user" id="exampleLastName"
                                            placeholder="N° Celular">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="email" name="correo" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Correo electrónico">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" name="password" class="form-control form-control-user"
                                            id="exampleInputPassword" placeholder="Contraseña">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="Repita la contraseña">
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                    Registrar Cuenta
                                </button
                                <hr>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="#">¿Has olvidado tu contraseña?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.jsp">¿Ya tienes una cuenta? ¡Acceso!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>
    <script src="js/main.js"></script>
</body>

</html>
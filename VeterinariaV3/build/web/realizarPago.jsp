<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html lang="es">
<%@page session="true" %>
<%
    String precio = request.getParameter("precio");
    String precioFormateado = "";
    if (precio != null) {
    try {
        double preci = Double.parseDouble(precio);
        DecimalFormat formato = new DecimalFormat("#0.00");
        precioFormateado = formato.format(preci);

    } catch (NumberFormatException e) {
        e.printStackTrace(); 
    }
}
    
    String servicio = request.getParameter("servicio");
    String correo = "";
    int idUsuario = 0;
    HttpSession sesion = request.getSession();
    correo = (String) sesion.getAttribute("usuario");

    if (correo != null && !correo.isEmpty()) {
        try (Connection conexion = Conexion.obtenerConexion();
             PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuario WHERE emaUsuario = ?");
        ) {
            ps.setString(1, correo);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                idUsuario = rs.getInt("idUsuario");
                System.out.println(idUsuario);
%>

<head>
    <meta charset="utf-8">
    <title>Panel</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    <link href="img/favicon.ico" rel="icon">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet"> 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link  href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet">
    <link href="assets/css/sb-admin-2.min.css" rel="stylesheet">
        <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD"></script>

</head>

<body id="page-top">

    <div id="wrapper">

        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="panelAdmin.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Panel <br>AnimalVetPro</div>
            </a>

            <hr class="sidebar-divider">

            <div class="sidebar-heading">
                Interfaz
            </div>
            
            <hr class="sidebar-divider d-none d-md-block">
            
            <li class="nav-item">
                <a class="nav-link" href="listaMascotaCliente.jsp">
                    <i class="fa fa-paw"></i>
                    <span>Mascotas</span></a>
            </li>
            
            <li class="nav-item active">
                <a class="nav-link " href="listaCitaCliente.jsp">
                    <i class="fa fa-calendar"></i>
                    <span>Citas Resevadas</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="cerrarSesion.jsp">
                    <i class="fa-solid fa-power-off"></i>
                    <span>Cerrar Sesión</span></a>
            </li>

            <hr class="sidebar-divider d-none d-md-block">

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>   
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <div class="topbar-divider d-none d-sm-block"></div>
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=rs.getString("nomUsuario") %></span>
                                <img class="img-profile rounded-circle"
                                    src="img/team-2.jpg">
                            </a>
                        </li>
                        <%          }
                                }
                            } catch (SQLException e) {
                                e.printStackTrace(); // Manejar la excepción adecuadamente en un entorno de producción
                            }
                        }%>
                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6"> 
                            <span><b>Métodos de pago</b></span>
                            <div class="card">
                                <div class="accordion" id="accordionExample">
                                    <div class="card">
                                        <div class="card-header p-0" id="headingTwo">
                                            <h2 class="mb-0">
                                                <div class="btn btn-light btn-block text-left collapsed p-3 rounded-0 border-bottom-custom" id="paypal-buttons"s>
                                                </div>
                                            </h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <span><b>Detalle</b></span>
                            <div class="card">
                                <div class="p-3">
                                    <div class="d-flex justify-content-between mb-2">
                                        <center><span><b>ANIMALVET</b></span></center>
                                    </div>
                                </div>
                                <hr class="mt-0 line">
                                <div class="p-3 d-flex justify-content-between">
                                    <div class="d-flex flex-column">
                                        <span><%=servicio%></span>
                                    </div>
                                    <span><%=precioFormateado%></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Desarrollo Web Integrado</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
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
    <script>
    // Configuración de PayPal
    paypal.Buttons({
        createOrder: function(data, actions) {
            // Lógica para crear una orden de pago
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: '<%=precio%>' // Monto del pago
                    }
                }]
            });
        },
         onApprove: function(data, actions) {
            // Lógica después de la aprobación del pago
            return actions.order.capture().then(function(details) {
                // Redirige a otra vista después de completar el pago ficticio
                window.location.href = 'http://localhost:8080/VeterinariaV3/listaCitaCliente.jsp';
            });
        }
    }).render('#paypal-buttons'); // Renderizar los botones en el contenedor

</script>

</body>
</html>

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
    double precio = 0;
    String detalle = "";
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

                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Citas</h1>
                    </div>
                    <div>
                        <a href="listaCitaCliente.jsp" class="btn btn-sm btn-warning"><i class="fas fa-list fa-sm text-white-50"></i> Listar</a>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="card">
                              <div class="card-body">
                                <h5 class="card-title">Reservar Cita</h5>
                                <form method="POST" action="registrarCita">
                                    <input type="text" value="<%=idUsuario%>" name="idUsuario" class="form-control" style="display:none">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row mb-6">
                                                <label for="inputEmail" class="col-sm-5 col-form-label">Fecha</label>
                                                <div class="col-sm-7">
                                                    <input type="date" name="fecha" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="row mb-6">
                                                <label for="inputPassword" class="col-sm-4 col-form-label">Hora</label>
                                                <div class="col-sm-8">
                                                    <input type="time" name="hora" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row mb-6">
                                                <label class="col-sm-5 col-form-label">Mascota</label>
                                                <div class="col-sm-7">
                                                    <select class="form-control" name="mascota" aria-label="Default select example">
                                                        <%
                                                            try (Connection conexion = Conexion.obtenerConexion();
                                                                PreparedStatement ps1 = conexion.prepareStatement("SELECT * FROM mascota WHERE estadoMascota = 'ACTIVO' AND usuario_idUsuario ="+idUsuario);
                                                                ResultSet rs1 = ps1.executeQuery()) {
                                                                    while (rs1.next()) {
                                                        %>

                                                        <option value="<%= rs1.getString("idMascota") %>"><%= rs1.getString("nomMascota") %></option>
                                                        <%
                                                                    }
                                                            } catch (SQLException e) {
                                                                e.printStackTrace();
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                                    
                                        <div class="col-md-6">
                                            <div class="row mb-6">
                                                <label class="col-sm-3 col-form-label">Servicio</label>
                                                <div class="col-sm-9">
                                                    <select class="form-control" name="servicio" aria-label="Default select example">
                                                        <%
                                                            try (Connection conexion = Conexion.obtenerConexion();
                                                                PreparedStatement ps1 = conexion.prepareStatement("SELECT * FROM servicio");
                                                                ResultSet rs1 = ps1.executeQuery()) {
                                                                    while (rs1.next()) {
                                                                        precio = rs1.getDouble("preServicio");
                                                                        detalle = rs1.getString("desServicio");
                                                        %>

                                                        <option value="<%= rs1.getString("idServicio") %>"><%= rs1.getString("desServicio") %></option>
                                                        <%
                                                                    }
                                                            } catch (SQLException e) {
                                                                e.printStackTrace();
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="text" value="<%=precio%>" name="precio" class="form-control" style="display:none">
                                        <input type="text" value="<%=detalle%>" name="descripcion1" class="form-control" style="display:none">
             
                                    </div>
                                                    
                                                    <br>
                                                    
                                        <div class="col-md-6">
                                            <div class="row mb-6">
                                                <label for="inputPassword" class="col-sm-4 col-form-label">Detalle</label>
                                                <div class="col-sm-8">
                                                    <textarea type="textarea" name="detalle" class="form-control"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    
                                    <br>
                                    
                                    <div class="row mb-3">
                                        <div class="col-sm-10">
                                            <button type="submit" class="btn btn-primary">Guardar</button>
                                        </div>
                                    </div>
                                </form>

                              </div>
                            </div>

                          </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

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
</body>
</html>

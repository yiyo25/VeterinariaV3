<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<html lang="es">
<%@page session="true" %>
<%
    String correo = "";
    HttpSession sesion = request.getSession();
    correo = (String) sesion.getAttribute("usuario");

    if (correo != null && !correo.isEmpty()) {
        try (Connection conexion = Conexion.obtenerConexion();
             PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuario WHERE emaUsuario = ?");
        ) {
            ps.setString(1, correo);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
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

            <hr class="sidebar-divider my-0">

            <li class="nav-item active">
                <a class="nav-link" href="panel.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <hr class="sidebar-divider">

            <div class="sidebar-heading">
                Interfaz
            </div>

            <hr class="sidebar-divider d-none d-md-block">
            
            <li class="nav-item">
                <a class="nav-link" href="listaVeterinario.jsp">
                    <i class="fa fa-plus-circle"></i>
                    <span>Veterinarios</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="listaAsistente.jsp">
                    <i class="fa fa-users"></i>
                    <span>Asistentes</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="listaCliente.jsp">
                    <i class="fa fa-users"></i>
                    <span>Clientes</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="listaMascota.jsp">
                    <i class="fa fa-paw"></i>
                    <span>Mascotas</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="listaCitas.jsp">
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

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        
                        <%
                        String usuario = "";
                        try (Connection connection = Conexion.obtenerConexion();
                            PreparedStatement ps1 = connection.prepareStatement("SELECT COUNT(*) as total_usuarios FROM usuario")) {
                            try (ResultSet rs1 = ps1.executeQuery()) {
                                while (rs1.next()) {
                                    usuario = rs1.getString("total_usuarios");
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        %>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Cantidad de Usuarios
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"> 
                                                <%= usuario%>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-user fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                                            
                        <%
                            String clientes = "";
                            try (Connection connection = Conexion.obtenerConexion();
                                PreparedStatement ps1 = connection.prepareStatement("SELECT COUNT(*) as total_clientes FROM usuario WHERE usuario_idTipoUsuario = '1'")) {
                                try (ResultSet rs1 = ps1.executeQuery()) {
                                    while (rs1.next()) {
                                        clientes = rs1.getString("total_clientes");
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Cantidad de Clientes</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%=clientes%></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-users fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                                        
                        <%
                            String veterinario = "";
                            try (Connection connection = Conexion.obtenerConexion();
                                PreparedStatement ps1 = connection.prepareStatement("SELECT COUNT(*) as total_veterinario FROM usuario WHERE usuario_idTipoUsuario = '4'")) {
                                try (ResultSet rs1 = ps1.executeQuery()) {
                                    while (rs1.next()) {
                                        veterinario = rs1.getString("total_veterinario");
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Cantidad de Veterinario
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><%=veterinario%></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-user-plus fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                                                
                        <%
                            String asistente = "";
                            try (Connection connection = Conexion.obtenerConexion();
                                PreparedStatement ps1 = connection.prepareStatement("SELECT COUNT(*) as total_asistente FROM usuario WHERE usuario_idTipoUsuario = '3'")) {
                                try (ResultSet rs1 = ps1.executeQuery()) {
                                    while (rs1.next()) {
                                        asistente = rs1.getString("total_asistente");
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Cantidad de Asistente</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><%=asistente%></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-user fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                                        
                                        
                    </div>
                                        
                    <div class="row">
                                        
                        <%
                            String cancelado =  "";
                            String completado = "";
                            String pendiente = "";
                            try (Connection connection = Conexion.obtenerConexion();
                                PreparedStatement ps1 = connection.prepareStatement("SELECT COUNT(*) as total_completado FROM citas WHERE estadoCita = 'COMPLETADO'")) {
                                try (ResultSet rs1 = ps1.executeQuery()) {
                                    while (rs1.next()) {
                                        completado = rs1.getString("total_completado");
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                            try (Connection connection = Conexion.obtenerConexion();
                                PreparedStatement ps1 = connection.prepareStatement("SELECT COUNT(*) as total_cancelado FROM citas WHERE estadoCita = 'CANCELADO'")) {
                                try (ResultSet rs1 = ps1.executeQuery()) {
                                    while (rs1.next()) {
                                        cancelado = rs1.getString("total_cancelado");
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                            try (Connection connection = Conexion.obtenerConexion();
                                PreparedStatement ps1 = connection.prepareStatement("SELECT COUNT(*) as total_pendiente FROM citas WHERE estadoCita = 'PENDIENTE'")) {
                                try (ResultSet rs1 = ps1.executeQuery()) {
                                    while (rs1.next()) {
                                        pendiente = rs1.getString("total_pendiente");
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                            System.out.println(pendiente);
                        %>

                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Citas</h5>

                                    <!-- Pie Chart -->
                                    <canvas id="pieChart" style="max-height: 400px;"></canvas>
                                    <script>
                                        document.addEventListener("DOMContentLoaded", () => {
                                            console.log(<%=pendiente%>);
                                            new Chart(document.querySelector('#pieChart'), {
                                              type: 'pie',
                                              data: {
                                                labels: [
                                                  'Pendiente',
                                                  'Completado',
                                                  'Cancelado'
                                                ],
                                                datasets: [{
                                                  label: 'Citas Realizadas',
                                                  data: [<%=pendiente%>, <%=completado%>, <%=cancelado%>],
                                                  backgroundColor: [
                                                    'rgb(255, 99, 132)',
                                                    'rgb(54, 162, 235)',
                                                    'rgb(255, 205, 86)'
                                                  ],
                                                  hoverOffset: 4
                                                }]
                                              }
                                            });
                                          });
                                    </script>
                                    <!-- End Pie CHart -->
                                  </div>
                            </div>
                        </div>

                        <%
                            String perro =  "";
                            String gato = "";
                            String loro = "";
                            String otro = "";
                            try (Connection connection = Conexion.obtenerConexion();
                                PreparedStatement ps1 = connection.prepareStatement("SELECT COUNT(*) as total_perro FROM mascota WHERE tipo_mascota_idTipo_mascota = '1'")) {
                                try (ResultSet rs1 = ps1.executeQuery()) {
                                    while (rs1.next()) {
                                        perro = rs1.getString("total_perro");
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                            try (Connection connection = Conexion.obtenerConexion();
                                PreparedStatement ps1 = connection.prepareStatement("SELECT COUNT(*) as total_gato FROM mascota WHERE tipo_mascota_idTipo_mascota = '2'")) {
                                try (ResultSet rs1 = ps1.executeQuery()) {
                                    while (rs1.next()) {
                                        gato = rs1.getString("total_gato");
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                            try (Connection connection = Conexion.obtenerConexion();
                                PreparedStatement ps1 = connection.prepareStatement("SELECT COUNT(*) as total_loro FROM mascota WHERE tipo_mascota_idTipo_mascota = '3'")) {
                                try (ResultSet rs1 = ps1.executeQuery()) {
                                    while (rs1.next()) {
                                        loro = rs1.getString("total_loro");
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                            try (Connection connection = Conexion.obtenerConexion();
                                PreparedStatement ps1 = connection.prepareStatement("SELECT COUNT(*) as total_otro FROM mascota WHERE tipo_mascota_idTipo_mascota = '4'")) {
                                try (ResultSet rs1 = ps1.executeQuery()) {
                                    while (rs1.next()) {
                                        otro = rs1.getString("total_otro");
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        %>

                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Tipo de Mascota</h5>
                                    <canvas id="doughnutChart" style="max-height: 400px;"></canvas>
                                    <script>
                                      document.addEventListener("DOMContentLoaded", () => {
                                        new Chart(document.querySelector('#doughnutChart'), {
                                          type: 'doughnut',
                                          data: {
                                            labels: [
                                              'Perro',
                                              'Gato',
                                              'Loro',
                                              'Otro'
                                            ],
                                            datasets: [{
                                              label: 'Cantidad tipo de mascota',
                                              data: [<%=perro%>, <%=gato%>, <%=loro%>, <%=otro%>],
                                              backgroundColor: [
                                                'rgb(54, 162, 235)',
                                                'rgb(255, 205, 86)',
                                                'rgb(75, 192, 192)',
                                                'rgb(153, 102, 255)'
                                              ],
                                              hoverOffset: 4
                                            }]
                                          }
                                        });
                                      });
                                    </script>
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
    <script src="js/chart.umd.js"></script>
    
</body>
</html>

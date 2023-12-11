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
    String prueba ="Sofia Joselin Cajahuaman Mendoza";
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
    <script src="js/jspdf.min.js"></script>

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
            
            <br>

            <div class="sidebar-heading">
                Interfaz
            </div>
            
            <hr class="sidebar-divider d-none d-md-block">
            
            <li class="nav-item">
                <a class="nav-link" href="listaMascotaAsistente.jsp">
                    <i class="fa fa-paw"></i>
                    <span>Mascotas</span></a>
            </li>
            
            <li class="nav-item active">
                <a class="nav-link" href="listaCitaAsistente.jsp">
                    <i class="fa fa-calendar"></i>
                    <span>Citas</span></a>
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

                    <br>
                    
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                              <div class="card-body">
                                  <h5 class="card-title">Lista de Citas</h5>
                                  <table class="table">
                                      <thead>
                                          <tr>
                                              <th scope="col">#</th>
                                              <th scope="col">Nombre</th>
                                              <th scope="col">Sexo</th>
                                              <th scope="col">Fecha</th>
                                              <th scope="col">Hora</th>
                                              <th scope="col">Servicio</th>
                                              <th scope="col">Detalle</th>
                                              <th scope="col">Cliente</th>
                                              <th scope="col">Celular</th>
                                              <th scope="col">Estado</th>
                                              <th scope="col">Acciones</th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                        <%
                                            try (Connection conexion = Conexion.obtenerConexion();
                                                 PreparedStatement ps = conexion.prepareStatement("SELECT * FROM citas INNER JOIN mascota ON citas.mascota_idMascota = mascota.idMascota INNER JOIN servicio ON citas.servicio_idServicio = servicio.idServicio INNER JOIN usuario ON citas.usuario_idUsuario = usuario.idUsuario;");
                                                 ResultSet rs = ps.executeQuery()) {
                                                while (rs.next()) {
                                        %>
                                                    <tr>
                                                        <th scope="row"><%= rs.getString("idCitas") %></th>
                                                        <td><%= rs.getString("nomMascota") %></td>
                                                        <td><%= rs.getString("sexMascota") %></td>
                                                        <td><%= rs.getString("fecha") %></td>
                                                        <td><%= rs.getString("hora") %></td>
                                                        <td><%= rs.getString("desServicio") %></td>
                                                        <td><%= rs.getString("detalle") %></td>
                                                        <td><%= rs.getString("nomUsuario") %></td>
                                                        <td><%= rs.getString("celUsuario") %></td>
                                                        <td><%= rs.getString("estadoCita") %></td>
                                                        <td>
                                                            <%
                                                            String veterinario = rs.getString("veterinario_idVeterinario");
                                                            String estado = rs.getString("estadoCita");
                                                            
                                                            if (veterinario == null && !estado.equals("CANCELADO") && !estado.equals("COMPLETADO")){%>
                                                            <a href="editarCita.jsp?id=<%= rs.getString("idCitas") %>" class="btn btn-sm btn-warning">
                                                                <i class="fas fa-pen fa-sm text-white-50"></i>
                                                            </a>
                                                            <%} else { %>
                                                                <a></a>
                                                            <% } %>
                                                                
                                                            <%if(estado.equals("PENDIENTE")){ %>        
                                                            <a href="actualizarEstadoCitaAsistente?id=<%= rs.getString("idCitas")%>&estado=<%= rs.getString("estadoCita") %>" class="btn btn-sm btn-danger">
                                                                <i class="fa fa-exclamation-circle fa-sm text-white-50"></i>
                                                            </a>
                                                            <%} else {%>
                                                            <a href="#" class="btn btn-sm btn-success">
                                                                <i class="fa fa-exclamation-circle fa-sm text-white-50"></i>
                                                            </a>
                                                            <%}%>
                                                            
                                                            
                                                            <a href="javascript:void(0)" onclick="generarPDF('<%= rs.getString("idCitas") %>')" class="btn btn-sm btn-primary">
                                                                <i class="fa fa-upload fa-sm text-white-50"></i>
                                                            </a>
                                                            
                                                        </td>
                                                    </tr>
                                        <%
                                                }
                                            } catch (SQLException e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                      </tbody>
                                  </table>
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
    <script>
        function generarPDF(idCitas) {
            console.log(idCitas);

            obtenerInformacionCita(idCitas, function(infoCita) {
                console.log(infoCita);

                var pdf = new jsPDF(); 

                pdf.text('ANIMAL VET SAC', 85, 20);
                pdf.text('JR. SAN LUIS 285', 85, 30);
                pdf.text('VILLA EL SALVADOR - LIMA - LIMA', 65, 40);
                pdf.text('www.animalvet.com | facturacion@animalvet.com', 45, 50);
                pdf.text('987456321', 95, 60);
                pdf.text('-------------------------------------', 75, 65);

                pdf.text('RUC: 20607896541', 85, 75);
                pdf.text('BOLETA DE VENTA ELECTRÓNICA', 60, 85);
                pdf.text('BO01-000'+ infoCita.idCitas, 90, 95);
                pdf.text('FECHA EMISIÓN: '+infoCita.fecha, 65, 105);
                pdf.text('MONEDA: USD', 85, 115);
                pdf.text('-------------------------------------', 75, 120);

                pdf.text('CLIENTE', 95, 130);
                pdf.text('N° DNI: '+ infoCita.dni, 85, 140);
                pdf.text('DENOMINACIÓN: ' + infoCita.nombre, 45, 150);
                pdf.text('-------------------------------------', 75, 155);

                pdf.text('DETALLE DE LA TRANSACCIÓN', 65, 165);
                pdf.text('SERVICIO: ' + infoCita.servicio, 60, 175);
                pdf.text('CANTIDAD: 1', 90, 185);
                pdf.text('PRECIO UNITARIO: ' + infoCita.precio, 85, 195);
                pdf.text('TOTAL: ' + infoCita.precio, 90, 205);
                pdf.text('------------------------------------', 75, 210);

                pdf.text('TOTAL A PAGAR: ' + infoCita.precio, 85, 220);
                pdf.text('MÉTODO DE PAGO: TARJETA DE CRÉDITO O DÉBITO', 45, 230);

                pdf.text('------------------------------------', 75, 240);
                pdf.text('GRACIAS POR SU PREFERENCIA', 60, 250);
                pdf.save('comprobante_boleta_' + infoCita.idCitas + '.pdf');
            });
        }

        function obtenerInformacionCita(idCitas1, callback) {
            console.log(idCitas1);
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "detalleCitasComprobante?idCitas=" + idCitas1, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        var infoCita = JSON.parse(xhr.responseText);
                        callback(infoCita);
                    } else {
                        console.error("Error en la solicitud AJAX:", xhr.statusText);
                    }
                }
            };
            xhr.send();
        }
    </script>
    
</body>
</html>

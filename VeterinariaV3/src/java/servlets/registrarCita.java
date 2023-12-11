package servlets;

import conexion.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "registrarCita", urlPatterns = {"/registrarCita"})
public class registrarCita extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registrarCita</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registrarCita at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idUsuario = request.getParameter("idUsuario");
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String mascota = request.getParameter("mascota");
        String detalle = request.getParameter("detalle");
        String servicio = request.getParameter("servicio");
        String precio = request.getParameter("precio");
        String descripcion = request.getParameter("descripcion1");
        String estado = "PENDIENTE";
        try (Connection conexion = Conexion.obtenerConexion()) {
            // Insertar nuevo veterinario
            try (PreparedStatement insertStatement = conexion.prepareStatement("INSERT INTO citas (fecha, hora , detalle, mascota_idMascota, servicio_idServicio, usuario_idUsuario, estadoCita) VALUES (?, ?, ?, ?, ?, ?, ?)")) {
                insertStatement.setString(1, fecha);
                insertStatement.setString(2, hora);
                insertStatement.setString(3, detalle);
                insertStatement.setString(4, mascota); 
                insertStatement.setString(5, servicio); 
                insertStatement.setString(6, idUsuario); 
                insertStatement.setString(7, estado); 
                insertStatement.executeUpdate();
            }

            response.sendRedirect("http://localhost:8080/VeterinariaV3/realizarPago.jsp?servicio="+ descripcion + "&precio=" + precio);
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar la excepción adecuadamente, posiblemente registrándola o mostrando un mensaje de error al usuario.
            response.getWriter().write("Error al procesar la solicitud.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

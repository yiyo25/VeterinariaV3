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

@WebServlet(name = "registrarMascota", urlPatterns = {"/registrarMascota"})
public class registrarMascota extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registrarMascota</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registrarMascota at " + request.getContextPath() + "</h1>");
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
        String nombre = request.getParameter("nombre");
        String edad = request.getParameter("edad");
        String tipo = request.getParameter("tipo");
        String raza = request.getParameter("raza");
        String sexo = request.getParameter("sexo");
        String estado = "ACTIVO";
        System.out.println(idUsuario);
        System.out.println(tipo);
        try (Connection conexion = Conexion.obtenerConexion()) {
            // Insertar nuevo veterinario
            try (PreparedStatement insertStatement = conexion.prepareStatement("INSERT INTO mascota (nomMascota, edaMascota , sexMascota, razMascota, tipo_mascota_idTipo_mascota, usuario_idUsuario, estadoMascota) VALUES (?, ?, ?, ?, ?, ?, ?)")) {
                insertStatement.setString(1, nombre);
                insertStatement.setString(2, edad);
                insertStatement.setString(3, sexo);
                insertStatement.setString(4, raza); 
                insertStatement.setString(5, tipo); 
                insertStatement.setString(6, idUsuario); 
                insertStatement.setString(7, estado); 
                insertStatement.executeUpdate();
            }

            response.sendRedirect("http://localhost:8080/VeterinariaV3/listaMascotaCliente.jsp");
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

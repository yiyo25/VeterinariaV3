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

/**
 *
 * @author Aroon
 */
@WebServlet(name = "registrarVeterinario", urlPatterns = {"/registrarVeterinario"})
public class registrarVeterinario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registrarVeterinario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registrarVeterinario at " + request.getContextPath() + "</h1>");
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
        String nombre = request.getParameter("nombre");
        String dni = request.getParameter("dni");
        String celular = request.getParameter("celular");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        int cargo = 4;
        String estado = "ACTIVADO";
        try (Connection conexion = Conexion.obtenerConexion()) {
            // Insertar nuevo veterinario
            try (PreparedStatement insertStatement = conexion.prepareStatement("INSERT INTO usuario (nomUsuario, dniUsuario, celUsuario, emaUsuario, pasUsuario, usuario_idTipoUsuario, estado) VALUES (?, ?, ?, ?, ?, ?, ?)")) {
                insertStatement.setString(1, nombre);
                insertStatement.setString(2, dni);
                insertStatement.setString(3, celular);
                insertStatement.setString(4, correo); // Recomiendo utilizar funciones de hash para almacenar contraseñas
                insertStatement.setString(5, password);
                insertStatement.setInt(6, cargo);
                insertStatement.setString(7, estado);

                insertStatement.executeUpdate();
            }

            response.sendRedirect("http://localhost:8080/VeterinariaV3/listaVeterinario.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar la excepción adecuadamente, posiblemente registrándola o mostrando un mensaje de error al usuario.
            response.getWriter().write("Error al procesar la solicitud.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description"; 
    }

}

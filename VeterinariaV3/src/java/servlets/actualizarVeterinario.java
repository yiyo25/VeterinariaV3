
package servlets;

import conexion.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "actualizarVeterinario", urlPatterns = {"/actualizarVeterinario"})
public class actualizarVeterinario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet actualizarVeterinario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet actualizarVeterinario at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("idVeterinario");
        String nombre = request.getParameter("nombre");
        String dni = request.getParameter("dni");
        String celular = request.getParameter("celular");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        try (Connection conexion = Conexion.obtenerConexion()) {
            // Update the veterinarian
            try (PreparedStatement updateStatement = conexion.prepareStatement("UPDATE usuario SET nomUsuario = ?, dniUsuario = ?, celUsuario = ?, emaUsuario = ?, pasUsuario = ? WHERE idUsuario = ?")) {
                updateStatement.setString(1, nombre);
                updateStatement.setString(2, dni);
                updateStatement.setString(3, celular);
                updateStatement.setString(4, correo); 
                updateStatement.setString(5, password); 
                updateStatement.setString(6, id); 

                updateStatement.executeUpdate();
            }

            response.sendRedirect("http://localhost:8080/VeterinariaV3/listaVeterinario.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception appropriately, possibly logging it or showing an error message to the user.
            response.getWriter().write("Error al procesar la solicitud.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

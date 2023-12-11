
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

@WebServlet(name = "EliminarVeterinario", urlPatterns = {"/EliminarVeterinario"})
public class EliminarVeterinario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EliminarVeterinario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EliminarVeterinario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idVeterinario = request.getParameter("id");
        eliminarVeterinario(idVeterinario);
        response.sendRedirect("listaVeterinario.jsp");
    }
    
    private void eliminarVeterinario(String idVeterinario) {
        try (Connection connection = Conexion.obtenerConexion();
            PreparedStatement ps = connection.prepareStatement("DELETE FROM usuario WHERE idUsuario = ?")) {
            ps.setString(1, idVeterinario);
            ps.executeUpdate();
        } 
        catch (SQLException e) {
                    e.printStackTrace(); 
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

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

@WebServlet(name = "actualizarEstadoMascota", urlPatterns = {"/actualizarEstadoMascota"})
public class actualizarEstadoMascota extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet actualizarEstadoMascota</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet actualizarEstadoMascota at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idMascota = request.getParameter("id");
        String estado = request.getParameter("estado");
        System.out.println(idMascota);
        System.out.println(estado);
        String estadoUp = "";
        System.out.println("entro aqui");

        if (estado.equals("ACTIVO")) {
            estadoUp = "DESACTIVO";
        }else{
            estadoUp = "ACTIVO";
        }

        try (Connection conexion = Conexion.obtenerConexion()) {
            // Update the user
            try (PreparedStatement updateStatement = conexion.prepareStatement("UPDATE mascota SET estadoMascota = ? WHERE idMascota = ?")) {
                updateStatement.setString(1, estadoUp);
                updateStatement.setString(2, idMascota);
                updateStatement.executeUpdate();
                System.out.println(updateStatement);
            }
            
            response.sendRedirect("http://localhost:8080/VeterinariaV3/listaMascotaCliente.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error al procesar la solicitud.");
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

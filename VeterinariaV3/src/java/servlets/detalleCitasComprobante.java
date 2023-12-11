
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
import org.json.JSONObject;

@WebServlet(name = "detalleCitasComprobante", urlPatterns = {"/detalleCitasComprobante"})
public class detalleCitasComprobante extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet detalleCitasComprobante</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet detalleCitasComprobante at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idCitas = request.getParameter("idCitas");
        String fecha = "";
        String dni = "";
        String nombre = "";
        String servicio = "";
        String desServicio = "";
        String precio = "";

        JSONObject jsonResponse = new JSONObject();

        try (Connection conexion = Conexion.obtenerConexion();
             PreparedStatement ps = conexion.prepareStatement("SELECT * FROM citas INNER JOIN servicio ON citas.servicio_idServicio = servicio.idServicio INNER JOIN usuario ON citas.usuario_idUsuario = usuario.idUsuario WHERE idCitas = " + idCitas);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                fecha = rs.getString("fecha");
                dni = rs.getString("dniUsuario");
                nombre = rs.getString("nomUsuario");
                servicio = rs.getString("desServicio");
                precio = rs.getString("preServicio");
            }

            jsonResponse.put("idCitas", idCitas);
            jsonResponse.put("fecha", fecha);
            jsonResponse.put("dni", dni);
            jsonResponse.put("nombre", nombre);
            jsonResponse.put("servicio", servicio);
            jsonResponse.put("desServicio", desServicio);
            jsonResponse.put("precio", precio);

        } catch (SQLException e) {
            e.printStackTrace();

            jsonResponse.put("error", "Error al obtener la información de la cita.");
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
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

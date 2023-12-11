
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Aroon
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession sesion = request.getSession();
        String nombreUsuario = request.getParameter("txtCorreo");
        String pass = request.getParameter("txtPass");
        System.out.println(pass);
        
        try (Connection conexion = Conexion.obtenerConexion()) {
            try (PreparedStatement statement = conexion.prepareStatement("SELECT * FROM usuario WHERE emaUsuario = ? AND pasUsuario = ?")) {
            statement.setString(1, nombreUsuario);
            statement.setString(2, pass);

                try (ResultSet result = statement.executeQuery()) {
                    if (result.next()) {
                        int cargo = result.getInt("usuario_idTipoUsuario");
                        System.out.println(cargo);
                        // Autenticación exitosa
                        sesion.setAttribute("usuario", nombreUsuario);
                        if(cargo == 2){
                            response.sendRedirect("http://localhost:8080/VeterinariaV3/panel.jsp");
                        }else if(cargo == 3){
                            response.sendRedirect("http://localhost:8080/VeterinariaV3/listaCitaAsistente.jsp");
                        }else if(cargo == 4){
                            response.sendRedirect("http://localhost:8080/VeterinariaV3/listaCitaVeterinario.jsp");
                        }else{
                            response.sendRedirect("http://localhost:8080/VeterinariaV3/listaCitaCliente.jsp");
                        }
                    } else {
                        // Autenticación fallida
                        response.sendRedirect("http://localhost:8080/VeterinariaV3/login.jsp");
                    }
                }
            }
        } catch (SQLException e) {
            // Manejar la excepción adecuadamente, mostrar mensaje de error, registrar, etc.
            e.printStackTrace();
            response.sendRedirect("http://localhost:8080/VeterinariaV2/error.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

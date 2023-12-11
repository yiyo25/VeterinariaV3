package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "contadorVistas", urlPatterns = {"/contadorVistas"})
public class contadorVistas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet contadorVistas</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet contadorVistas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int contador = obtenerContador(request);

        // Incrementar el contador
        contador++;

        // Actualizar el contador en el ámbito de la aplicación
        getServletContext().setAttribute("contadorVisitas", contador);

        // Crear o actualizar la cookie
        Cookie contadorCookie = new Cookie("contadorVisitas", String.valueOf(contador));
        response.addCookie(contadorCookie);
        System.out.println(contadorCookie);
    }

    private int obtenerContador(HttpServletRequest request) {
        // Obtener el contador actual desde el ámbito de la aplicación
        Integer contador = (Integer) getServletContext().getAttribute("contadorVisitas");

        // Si el contador aún no está inicializado, establecerlo en 0
        if (contador == null) {
            contador = 0;
        }

        return contador;
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

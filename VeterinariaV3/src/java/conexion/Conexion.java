package conexion;

import java.sql.*;

public class Conexion {
    
    private static final String URL = "jdbc:mysql://localhost:3306/veterinaria";
    private static final String USUARIO = "root";
    private static final String PASS = "";
    
    public static Connection obtenerConexion() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(URL, USUARIO, PASS);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("Error al cargar el driver de la base de datos.");
        }
    }

    public static void cerrarConexion(Connection conexion) {
        if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

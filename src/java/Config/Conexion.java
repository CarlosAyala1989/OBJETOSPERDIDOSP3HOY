  /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Config;
import java.sql.*;

public class Conexion {
        Connection con=null;
       
    public Conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://mysql9001.site4now.net:3306/db_aaf2ce_perdido", "aaf2ce_perdido", "perdido13");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("error conexion "+e.getMessage()); 
        }
    }
    public Connection getConnection(){
        return con;
    }
}
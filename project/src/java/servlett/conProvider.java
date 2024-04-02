package servlett;
import java.sql.*;

public class conProvider {
    public static Connection getcon(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/chat_app","root","");
             return con;
        } catch (Exception ex) {
          System.out.println( ex);
          return null;
        }
       
    }
}

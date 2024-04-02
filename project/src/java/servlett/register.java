package servlett;


import java.awt.SystemColor;
import static java.awt.SystemColor.text;
import java.io.*;
import static java.lang.System.out;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import servlett.conProvider;


public class register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        
        try {
            
        Connection con = conProvider.getcon();
        Statement st = con.createStatement();
        String qur2 = "SELECT `email`  FROM `user` WHERE email = '" + email + "';";
        ResultSet rs = st.executeQuery(qur2);
        
        if(password1.equals(password2)){           
            if(rs.next()){
                response.sendRedirect("register.jsp?msg1=emailRegisterd");
                System.out.println("email invalid");
            }
            else{
            
                String sql = "INSERT INTO user (firstName, lastName, email, phoneNumber , country , city "
                        + " , password ) VALUES (?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement statement = con.prepareStatement(sql)) {
                    statement.setString(1, firstName);
                    statement.setString(2, lastName);
                    statement.setString(3, email);
                    statement.setString(4, phoneNumber);
                    statement.setString(5, country);
                    statement.setString(6, city);
                    statement.setString(7, password2);
                    statement.executeUpdate();
                }
                response.sendRedirect("index.jsp?msg=registerd");
            }
        }
        else{
            response.sendRedirect("register.jsp?msg2=invalidPassword");
        }
         
       
        
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        
        }
}




        
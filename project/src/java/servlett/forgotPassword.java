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


public class forgotPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String newPassword1 = request.getParameter("newPassword1");
        String newPassword2 = request.getParameter("newPassword2");
        
        try {
            
            Connection con = conProvider.getcon();
            Statement st = con.createStatement();
            
            if(newPassword1.equals(newPassword2)){  
                ResultSet rs = st.executeQuery("select password from user where firstname = '"+ firstName +"' and lastName= '"+lastName+"' and email='" +email+"' and phoneNumber='"+phoneNumber+"'");
                if(rs.next()){                    
                       String qur = "UPDATE `user` SET `password`='"+newPassword2+"' WHERE email = '"+ email +"'"; 
                        int rs2 = st.executeUpdate(qur);
                        response.sendRedirect("index.jsp?passwordChanged=true");
                }
                else{
                    response.sendRedirect("forgotPassword.jsp?passwordChanged=false");
                }
        }
        else{
            response.sendRedirect("forgotPassword.jsp?passwordChanged=false");
        }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        
        }
}




        
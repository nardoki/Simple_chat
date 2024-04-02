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


public class changePassword2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        
        String userId = session.getAttribute("userId").toString();
        String oldPassword = request.getParameter("oldPassword");
        String newPassword1 = request.getParameter("newPassword1");
        String newPassword2 = request.getParameter("newPassword2");
        
        try {
            
            Connection con = conProvider.getcon();
            Statement st = con.createStatement();
            
            if(newPassword1.equals(newPassword2)){  
                ResultSet rs = st.executeQuery("select password from user where userId = '"+ userId +"'");
                if(rs.next()){
                    if(rs.getString("password").equals(oldPassword)){  
                       String qur = "UPDATE `user` SET `password`='"+newPassword2+"' WHERE userId = '"+ userId +"'"; 
                        int rs2 = st.executeUpdate(qur);
                        response.sendRedirect("home.jsp?passwordChanged=true");
                    }
                    else{
                        response.sendRedirect("home.jsp?passwordChanged=false");
                    }
                }
                else{
                    response.sendRedirect("home.jsp?passwordChanged=false");
                }
        }
        else{
            response.sendRedirect("home.jsp?passwordChanged=false");
        }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        
        }
}




        
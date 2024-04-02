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


public class changePassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        
        String oldPassword = request.getParameter("oldPassword");
        String newPassword1 = request.getParameter("newPassword1");
        String newPassword2 = request.getParameter("newPassword2");
        
        try {
            
            Connection con = conProvider.getcon();
            Statement st = con.createStatement();
            
            if(newPassword1.equals(newPassword2)){  
                ResultSet rs = st.executeQuery("select password from admin");
                if(rs.next()){
                    if(rs.getString("password").equals(oldPassword)){                    
                        PreparedStatement statement = con.prepareStatement("update admin set password = (?);");
                        statement.setString(1, newPassword2);
                        int rs2 = statement.executeUpdate();
                        response.sendRedirect("adminSite.jsp?inf=passwordChnged");
                    }
                    else{
                        response.sendRedirect("adminSite.jsp?info=invalidEntry");
                    }
                }
                else{
                    response.sendRedirect("adminSite.jsp?info=invalidEntry");
                }
        }
        else{
            response.sendRedirect("adminSite.jsp?info=invalidEntry");
        }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        
        }
}




        
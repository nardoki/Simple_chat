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


public class delete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
       
        String userId = request.getParameter("userId");
        
        try {
            System.out.println(userId);
            Connection con = conProvider.getcon();
            Statement st = con.createStatement(); 
            
            String sql1 = "DELETE FROM feedback where senderId = '" + userId + "'";
            String sql3 = "DELETE FROM groupMessage where senderId = '" + userId + "'";
            String sql4 = "DELETE FROM message where senderId = '" + userId + "' or recieverId = '" + userId + "'";
            String sql5 = "DELETE FROM user where userId = '" + userId + "'";
                       
            int rs1 = st.executeUpdate(sql1);
            int rs3 = st.executeUpdate(sql3);
            int rs4 = st.executeUpdate(sql4);
            int rs5 = st.executeUpdate(sql5);
            
            
            response.sendRedirect("adminSite.jsp?msg=deleted");           
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("adminSite.jsp?msg=notDeleted");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }      
        }
}




        
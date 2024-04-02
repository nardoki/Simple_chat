
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


public class changeProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
       
       String userId = session.getAttribute("userId").toString();
       String firstName = request.getParameter("firstName");
       String lastName = request.getParameter("lastName");
       String phoneNumber = request.getParameter("phoneNumber");
       String country = request.getParameter("country");
       String city = request.getParameter("city");
       
       String qur = "UPDATE user SET `firstName`='"+ firstName +"',`lastName`='"+ lastName+"',`phoneNumber`='"+ phoneNumber +"',`country`='"+country+"',`city`='"+ city + "' WHERE userId = '"+ userId+"'";
        
       try{
       Connection con = conProvider.getcon();
       Statement st = con.createStatement();
       int rs = st.executeUpdate(qur);  
       response.sendRedirect("home.jsp?profileChanged=true"); 
           System.out.println("done");
       
       }
       catch(Exception e){
           System.out.println( e);
           response.sendRedirect("home.jsp?profileChanged=false");
           System.out.println("undone");
           }
             
        }
}
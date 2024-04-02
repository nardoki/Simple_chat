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


public class feedback extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
       
       String senderId = session.getAttribute("userId").toString();
       String feedback = request.getParameter("feedback");
       
       
       String qur = "INSERT INTO feedback( senderId, content) VALUES ( '"+ senderId +"' , '"+feedback+"');";
        
       try{
       Connection con = conProvider.getcon();
       Statement st = con.createStatement();
       int rs = st.executeUpdate(qur);  
       response.sendRedirect("home.jsp?feedback=feedbackSent"); 
       
       }
       catch(Exception e){
           System.out.println( e);
           response.sendRedirect("home.jsp?feedback=feedbackNotSent");
           }
             
        }
}


        
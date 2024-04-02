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


public class sendMessage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
       
       String receiverId = session.getAttribute("receiver").toString();
       String senderId = session.getAttribute("userId").toString();
       String content = request.getParameter("content");
        System.out.println(receiverId);
        System.out.println(senderId);
        System.out.println(content);
       
       
       String qur = "INSERT INTO message( senderId, recieverId, content) VALUES ( '"+senderId+"','"+receiverId+"','" + content +"');";
        
       try{
       Connection con = conProvider.getcon();
       Statement st = con.createStatement();
       int rs = st.executeUpdate(qur);  
       session.setAttribute("receiver",receiverId);
       response.sendRedirect("home.jsp?identifier=identified"); 
       
       }
       catch(Exception e){
           System.out.println( e);
           response.sendRedirect("home.jsp?pass=empty");
           }
             
        }
}


        
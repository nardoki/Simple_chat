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


public class identifier extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
       
       String receiverId = request.getParameter("receiverId");
       String senderId = session.getAttribute("userId").toString();
       String qur = "select * from message  where senderId=" + senderId +" and recieverId=" + receiverId + 
               "or senderId=" + receiverId +" and recieverId=" + senderId + ";";
       String qur2 = "select * from message  where senderId='"+senderId+"' and recieverId='"+receiverId+"' or senderId='"+receiverId+"' and recieverId='"+senderId+"';";
        
       try{
       Connection con = conProvider.getcon();
       Statement st = con.createStatement();
       ResultSet rs = st.executeQuery(qur2);
       if(rs.next()){
          session.setAttribute("receiver",receiverId);
          response.sendRedirect("home.jsp?identifier=identified"); 
       }
       else{
           session.setAttribute("receiver",receiverId);
           response.sendRedirect("home.jsp?identifier=identified");
       }
       
           }
       catch(Exception e){
           System.out.println( e);
           response.sendRedirect("home.jsp?pass=empty");
           }
             
        }
}


        
<%@page import="servlett.conProvider" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>receiver identifier</title>
    </head>
    <body>
       <%
       String reciverId = request.getParameter("reciverId");
       String senderId = session.getAttribute("userId").toString();
       String qur = "select * from message  where senderId=" + senderId +" and recieverId=" + reciverId + 
               "or senderId=" + reciverId +" and recieverId=" + senderId + ";";
        
       try{
       Connection con = conProvider.getcon();
       Statement st = con.createStatement();
       ResultSet rs = st.executeQuery(qur);
       if(rs.next()){
          session.setAttribute("reciever",reciverId);
          response.sendRedirect("home.jsp?identifier=identified"); 
          System.out.println("done");
       }
       else{
           response.sendRedirect("home.jsp?pass=empty");
           System.out.println("fuck");
       }
       
           }
       catch(Exception e){
           System.out.println( e);
           response.sendRedirect("home.jsp?pass=empty");
           }
       
       %>
      
    </body>
</html>

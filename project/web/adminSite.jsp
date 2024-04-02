<%@page import="java.sql.*"%>
<%@page import="servlett.conProvider" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Site</title>
        <link rel="stylesheet" href="css/admin2.css"/>
    </head>
    <body>
        
        <%
            Connection con = conProvider.getcon();
            Statement st = con.createStatement();
        %>
        <div class="main">
            <div class="div1">
                <button onclick="func1()">Users</button>
                <button onclick="func2()">Feedback</button>
                <button onclick="func3()">Change password</button>
                <form action="index.jsp">
                <input class="logout" type="submit" value="Log out">
            </form>
            </div>
            <div class="main3">
                <div class="search_result">
                    <form class="search" action="servlett.search" method="post">
                        <input type="search" name="search" placeholder="search here" required="">
                    <input class="search_button" type="submit" value="search">
                    </form>
                    
                    <%
                 String msg=request.getParameter("msg");
                 if("searchedResult".equals(msg)){                
                    String search =session.getAttribute("search").toString();
                    String searche1 = search + "%";
                    String searche2 ="%" + search + "%";
                    ResultSet rs1 = st.executeQuery("SELECT *  FROM user WHERE firstName like '" + searche1 + "' "
                        + "or lastName like '" + search + "' or email like '" + searche2 + "' or country like '" + search + "'");
                   %> 
                         <table>
                       <thead>
                           <tr>
                               <th>User id</th>
                               <th>first name</th>
                               <th>last name</th>
                               <th>email</th>
                               <th>phone number</th>
                               <th>country</th>
                               <th>city</th>
                               <th>Action</th>
                           </tr>

                       </thead>
                       <tbody>
                          <% while(rs1.next()){ %>
                                   <tr>
                                       <td><%out.println(rs1.getString("userId"));%></td>
                                       <td><%out.println(rs1.getString("firstName"));%></td>
                                       <td><%out.println(rs1.getString("lastName"));%></td>
                                       <td><%out.println(rs1.getString("email"));%></td>
                                       <td><%out.println(rs1.getString("phoneNumber"));%></td>
                                       <td><%out.println(rs1.getString("country"));%></td>
                                       <td><%out.println(rs1.getString("city"));%></td>
                                       <td> 
                                           <a href="servlett.delete?userId=<%out.println(rs1.getString("userId"));%>"><button>Delete</button></a>
                                       </td>
                                   </tr>
                           <% }%>
                       </tbody>
                   </table>  
            
                <% }%>
             
                
                <%
                 String msg2=request.getParameter("msg");
                 if("notExist".equals(msg2)){
                %>
                 <div class="notexist">
                     <P class="notexist">not exist</P>
                 </div>
                <%}%>
                
                <%
                 String msg3=request.getParameter("msg");
                 if("deleted".equals(msg3)){
                %>
                 <div class="deleted">
                     <P class="deleted">Deleted successfully</P>
                 </div>
                <%}%>
                
                <%
                 String msg4=request.getParameter("msg");
                 if("notDeleted".equals(msg4)){
                %>
                 <div class="notdeleted">
                     <P class="notdeleted">Unable to delete!</P>
                 </div>
                <%}%>
                </div>
                
                 <table>
                    <thead>
                        <tr>
                            <th>User id</th>
                            <th>first name</th>
                            <th>last name</th>
                            <th>email</th>
                            <th>phone number</th>
                            <th>country</th>
                            <th>city</th>
                            <th>Action</th>
                        </tr>
                        
                    </thead>
                    <tbody>
               
                            <%
                                
                                ResultSet rs2 = st.executeQuery("select * from user;");
                                while(rs2.next()){ %>
                                <tr>
                                    <td><%out.println(rs2.getString("userId"));%></td>
                                       <td><%out.println(rs2.getString("firstName"));%></td>
                                       <td><%out.println(rs2.getString("lastName"));%></td>
                                       <td><%out.println(rs2.getString("email"));%></td>
                                       <td><%out.println(rs2.getString("phoneNumber"));%></td>
                                       <td><%out.println(rs2.getString("country"));%></td>
                                       <td><%out.println(rs2.getString("city"));%></td>
                                       <td> 
                                           <a href="servlett.delete?userId=<%out.println(rs2.getString("userId"));%>"><button>Delete</button></a>
                                       </td>
                                </tr>
                                    
                                <% }%> 
                    </tbody>
                </table>
            </div>
                    
            <div class="feedback">
                <div class="viewbox">
                    <%
                        ResultSet rs3 = st.executeQuery("SELECT U.firstName, U.lastName, F.content, F.time FROM Feedback F JOIN User U ON F.senderId = U.userId order by time asc;");
                        while(rs3.next()){ %>
                            <div class="viewbox1">
                                <p class="p1"><%out.println(rs3.getString("U.firstName") +" " + rs3.getString("U.lastName"));%> </p>
                                <p class="p2"><%out.println(rs3.getString("F.content"));%></p>
                    </div>
                        <%}%>
                    
                  
                </div>             
            </div>
                
            <div class="changePassword">
                <form action="servlett.changePassword" method="POST">
                    <h2>Change password</h2>
            
                    <%
                        String info=request.getParameter("inf");
                        if("passwordChnged".equals(info)){
                   %>
                    <script>
                        const changepassword1=document.querySelector('.changePassword');
                        const member5=document.querySelector('.main3');
                        changepassword1.style.display="flex"
                        member5.style.display="none";
                    </script>
                    <h5 class="h5">Password changed Successfully!</h5>
                    <%}%>
                    
                    <%
                        String info1=request.getParameter("info");
                        if("invalidEntry".equals(info1)){
                   %>
                   <script>
                        const changepassword2=document.querySelector('.changePassword');
                        const member6=document.querySelector('.main3');
                        changepassword2.style.display="flex"
                        member6.style.display="none";
                    </script>
                    <h4 class="h5">Invalid entry!</h4>
                    <%}%>
                   
                
                    <input type="password" name="oldPassword" placeholder="Old password" required>
                    <input type="password" name="newPassword1" placeholder="New password" required> 
                    <input type="password" name="newPassword2" placeholder="Confirm password" required>
                    <input class="submit1" type="submit" value="Submit"> 
                </form>            
            </div>            
                        
                        
        </div>
      <script src="js/admin.js"></script> 
    </body>
</html>

<%@page import="servlett.conProvider" %>




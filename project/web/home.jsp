<%-- 
    Document   : home
    Created on : Feb 17, 2024, 5:07:22 PM
    Author     : Mercy
--%>

<%
    
    Connection con = conProvider.getcon();
    Statement st = con.createStatement();
    
    String sender = "";
    String receiver = "";
    
    String userId = session.getAttribute("userId").toString();                     
    if(userId == null){
        response.sendRedirect("index.jsp");
    }
     session.setAttribute("userId", userId);
    
%>

<%@page import="java.sql.*"%>
<%@page import="servlett.conProvider" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/home.css">
</head>
<body >
    <div class="navigBar">
               
        <div class="div1">
        <img src="icon/csec.jpg" alt="">
            <p>Chat-App</p>
        </div>
        <div class="div2">
            <button onclick="personal()" > personal </button>
            <button onclick="group1()" > Group </button>
  
        </div>
        <div  class="div3">
            <button class="menuBtn" onclick="close1()" >
                <img src="icon/drop-down-menu.png" alt="">
            </button> 
        </div>
        <div  class="div4">
            <button class="menuBtn" onclick="close2()" >
                <img src="icon/drop-down-menu.png" alt="">
            </button> 
        </div>

        <div class="dropDown">
            <li>
                <button onclick="personal()" > personal </button>
                <button onclick="group1()" > Group </button>
                <button onclick="feedback1()" > feedback</button>
                <button onclick="profile1()" > profile </button>
                <button onclick="changepassword1()" > change password </button>
                <a href="index.jsp"><button>log out</button></a> 
            </li>
            
        </div> 
        <div class="dropDown1">
            <li>
                <button onclick="feedback1()" > feedback</button>
                <button onclick="profile1()" > profile </button>
                <button onclick="changepassword1()" >change password</button>
                <a href="index.jsp"><button>log out</button></a> 
            </li>
            
        </div>    
    </div>

            <!-- HOME -->

<section class="personal" onclick="closeDrop()">

    <div class="list">
        <% 
           

            %>
            <div class="search_result">
                <form class="search" action="servlett.search2" method="post">
                    <span>
                        <input type="search" name="search2" placeholder="search here" required="">
                        <input class="search_button" type="submit" value="search">
                    </span>
                    <%
                        String searchh=request.getParameter("searchResult");
                        if("false".equals(searchh)){
                    %>
                    <div class="notexist">
                        <P class="notexist">not exist</P>
                    </div>
                    <%}%>
                </form>
            </div> 
                
                
            <%
                
            String searchResult =request.getParameter("searchResult");
            if("true".equals(searchResult)){
                String search = session.getAttribute("search").toString();
                String searched = search + "%";
                ResultSet rs11 = st.executeQuery("SELECT * FROM user WHERE userId != '"+ userId +"'and firstName like '" + searched + "' "
                        + "or lastName like '" + searched + "';");
                while(rs11.next()){ %>
                    <div class="div1">
                        <a href="servlett.identifier?receiverId=<%out.println(rs11.getString("userId"));%>">
                        <div>
                            <p><% out.println(rs11.getString("firstName")); %></p>
                            <p><% out.println(rs11.getString("lastName")); %></p>                             
                        </div>
                        </a>
                    </div>
                <%}%>
                
            <%}
                else{
                      ResultSet rs1 = st.executeQuery("select * from user where userId != '" +userId+ "';");
                      while(rs1.next()){ %>
                      <div class="div1">
                            <a href="servlett.identifier?receiverId=<%out.println(rs1.getString("userId"));%>">
                            <div>
                                    <p><% out.println(rs1.getString("firstName")); %></p>
                                    <p><% out.println(rs1.getString("lastName")); %></p>                             
                            </div>
                            </a>
                        </div>
                      
                <%}%>
            <%}%>
                    
                   
                    
                    
        </div>
    <div class="message">
        <div class="viewbox">
            <%
             String senderName = "";
             ResultSet rs3 = st.executeQuery("select firstName from user where userId = '"+ userId+ "';");
             if(rs3.next()){
                        senderName = rs3.getString("firstName");
                    }
            
            String identity=request.getParameter("identifier");
            
                if("identified".equals(identity)){
                   sender = userId;
                   receiver = session.getAttribute("receiver").toString();
                   ResultSet rs2 = st.executeQuery("SELECT m.content, m.time, sender.firstName AS sender_first_name,receiver.firstName AS receiver_first_name"
                   + " FROM Message m INNER JOIN User sender ON m.senderId = sender.userId INNER JOIN User receiver ON m.recieverId = receiver.userId where senderId= '" + sender +"' and recieverId='" + receiver + "'"
                                     + "or senderId='" + receiver +"' and recieverId='" + sender + "' order by time;");
                   
                   while(rs2.next()){ 
                        if(senderName.equals(rs2.getString("sender_first_name"))){ %>
                            <div class="myMessage">
                                <span class="content1">
                                    <p> <% out.println(rs2.getString("content")); %> </p>
                                </span>
                            </div>
                        <%} 
                          else{ %>
                            <div class="otherMessage">
                                <span class="content2">
                                    <p> <% out.println(rs2.getString("content")); %> </p>
                                </span>
                            </div>
                        <% }%>
           
                    <%}%>
                <%}
                    else{ %>
                        <div class="viewbox1">
                            <p class="p1">no message select the chat</p>
                            
                        </div>
                   <% }%>
                
                
        </div>
        <div class="textbox1">

            <form action="servlett.sendMessage">
                <%

                   session.setAttribute("receiver",receiver);
                %>
                <input class="b1" type="text" name="content" placeholder="type here..." required>
                <input class="b2"  type="submit" value="send" >
            </form>

        </div>                   
    </div> 
</section>

            <!-- GROUP MESSAGE-->
<section class="group">
        <div class="message">
        <div class="viewbox">
            <%
        String msg1 = request.getParameter("groupMessage");
        if("sent".equals(msg1)){ %>
            <script>
                const groupPage=document.querySelector('.group');
                const hom27=document.querySelector('.personal');
                hom27.style.display="none";
                groupPage.style.display="flex";
            </script>
       <% }%>
               
              <% try{
                    ResultSet rs2 = st.executeQuery("SELECT m.content, m.time, sender.firstName AS sender_first_name FROM"
                        + " groupMessage m INNER JOIN User sender ON m.senderId = sender.userId order by time;");
                   while(rs2.next()){ 
                        if(senderName.equals(rs2.getString("sender_first_name"))){ %>
                            <div class="myMessage">
                                <span class="content2">
                                    <p class="senderName">  you </p>
                                    <p class="chat"> <% out.println(rs2.getString("content")); %> </p>
                                </span>
                            </div>
                        <%} 
                          else{ %>
                            <div class="otherMessage">
                                <span class="content1">
                                    <p class="senderName"> <% out.println(rs2.getString("sender_first_name")); %> </p>
                                    <p class="chat"> <% out.println(rs2.getString("content")); %> </p>
                                </span>
                            </div>
                        <% }%>
           
                    <%}%>
                <%}
               catch(Exception e){
                    System.out.println(e);
               }
                
              %>
                
                
        </div>
        <div class="textbox1">

            <form action="servlett.sendMessage2">
                <input class="b1" type="text" name="content" placeholder="type here..." required>
                <input class="b2"  type="submit" value="send" >
            </form>

        </div>                   
    </div> 
</section>

                <!-- FEEDBACK-->
<section class="feedback">


    <P>Write your feedback blow</P>
    <div class="box1">
        <%
        String feedback = request.getParameter("feedback");
        if("feedbackSent".equals(feedback)){ %>
            <script>
                const fedback=document.querySelector('.feedback');
                const hom2=document.querySelector('.personal');
                hom2.style.display="none";
                fedback.style.display="flex";
            </script>
            <h3 class="submited">Submited successfully!</h3>
       <% }%>
        <form action="servlett.feedback" method="POST">
            <label > feedback </label> <input class="description" type="text" name="feedback">
            <input class="submit" type="submit" value="Submit">
        </form>
    </div>    
</section>
<section class="profile">

    
    <%
        String profileChanged = request.getParameter("profileChanged");
        if("true".equals(profileChanged)){ %>
            <script>
                const prfl=document.querySelector('.profile');
                const hom3=document.querySelector('.personal');
                hom3.style.display="none";
                prfl.style.display="flex";
            </script>
            <P class="p">Successfully edited!</P>
        <%}%>

    <%
        ResultSet rs4 = st.executeQuery("select * from user where userId = '"+ userId +"';");
        rs4.next();
    %>
            
    <div class="profile1">
        <div><p class="a1">Full name</p><p class="a2" ><% out.println(rs4.getString("firstName") + " " + rs4.getString("lastName")) ;%></p></div>
        <div><p class="a1">Email</p><p class="a2" ><% out.println(rs4.getString("email"));%> </p></div>
        <div><p class="a1">Phone number</p><p class="a2" ><% out.println(rs4.getString("phoneNumber"));%></p></div>
        <div><p class="a1">country</p><p class="a2" ><% out.println(rs4.getString("country"));%></p></div>
        <div><p class="a1">city</p><p class="a2" ><% out.println(rs4.getString("city"));%></p></div>
        <button onclick="edit()">Edit</button>
    </div>
    <div class="profile2">
        <form action="servlett.changeProfile" method="POST">
        <div><p class="a1">First name</p><p class="a2" ><input type="text" name="firstName" value="<% out.println(rs4.getString("firstName")) ;%>"></p></div>
        <div><p class="a1">Last name</p><p class="a2" ><input type="text" name="lastName" value="<% out.println(rs4.getString("lastName")) ;%>"></p></div>
        <div><p class="a1">Phone number</p><p class="a2" ><input type="text" name="phoneNumber" value="<% out.println(rs4.getString("phoneNumber")) ;%>"></p></div>
        <div><p class="a1">country</p><p class="a2" ><input type="text" name="country" value="<% out.println(rs4.getString("country")) ;%>"></p></div>
        <div><p class="a1">city</p><p class="a2" ><input type="text" name="city" value="<% out.println(rs4.getString("city")) ;%>"></p></div>
        <button >Submit</button>
        </form>
    </div>
    </section>

            <!--  CHANGE PASSWORD-->

<section class="changePassword">
    <h2>Change password</h2>
    <form action="servlett.changePassword2" method="POST">
        <%
            String passwordChanged = request.getParameter("passwordChanged");
            if("true".equals(passwordChanged)){ %>
                <script>
                    const changepassword11=document.querySelector('.changePassword');
                    const hom55=document.querySelector('.personal');
                    hom55.style.display="none";
                    changepassword11.style.display="flex"
                </script>
                <h4 >The password changed successfully!</h4>
        <% }%>
        <%
            if("false".equals(passwordChanged)){ %>
                <script>
                    const changepassword2=document.querySelector('.changePassword');
                    const hom6=document.querySelector('.personal');
                    hom6.style.display="none";
                    changepassword2.style.display="flex"
                </script>
                <h4 class="h5">Invalid entry!</h4>
        <% }%>
            
            <input type="password" name="oldPassword" placeholder="Old password" required> 
            <input type="password" name="newPassword1" placeholder="New password" required> 
            <input type="password" name="newPassword2" placeholder="Confirm password" required>
            <input class="submit1" type="submit" value="Submit"> 
        </form>
</section>


<script src="js/home.js"></script>
</body>
</html>
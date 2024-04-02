<%-- 
    Document   : register
    Created on : Feb 16, 2024, 11:14:39 PM
    Author     : Mercy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/register.css">
</head>
<body>
    <div class="topbar">
        <div class="div1">
            <img src="icon/csec.jpg" alt="">
            <p>Chat Application</p>
        </div>      
        <div class="div2">       
            <a href="index.jsp"> <button> log in </button> </a>
        </div>    
    </div>
    <section>
        <form action="servlett.register" method="POST">
            <h2>Register</h2>
            <h2>Register2</h2>
            
            <%  
                String msg=request.getParameter("msg1");
                if("emailRegisterd".equals(msg)){
            %>
            <h4 class="h5"> The Email is already registered</h4>
            <%}%>
            
            <%
                String msg2=request.getParameter("msg2");
                if("invalidPassword".equals(msg2)){
            %>
            <h4 class="h5"> your password do not match</h4>
            <%}%>
            <h4 class="h5"> your password do not match</h4>
            <div>
                <input type="text" name="firstName" placeholder="First name" required>

                <input type="text" name="lastName" placeholder="Last name" required>
            </div> 
            
            <div>
                <input type="email" name="email" placeholder="Email" required>
                <input type="text" name="phoneNumber" placeholder="Phone Number" required>
            </div>

            <div class="adress">
                <div class="adress1"><p>adress</p></div>
                <div>
                    
                    <select class="Country" name="country">
                        <option value="">Country</option>
                        <option value="usa">USA</option>
                        <option value="ethiopia">Ethiopia</option>
                        <option value="kenya">France</option>
                        <option value="england">England</option>
                    </select>

                    <input type="text" name="city" placeholder="City" required>
                </div>
                
            </div>

            <div>
                <input type="password" name="password1" placeholder="Create password" required>
                <input type="password" name="password2" placeholder="Confirm password" required>
            </div>
            
            <input class="submit1" type="submit" value="Submit"> 

            <div class="haveAcount">
                <a href="index.jsp">already have an account?</a>
            </div>

        </form>
    </section>      
</body>
</html>

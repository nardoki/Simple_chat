<%-- 
    Document   : forgotPassword
    Created on : Feb 16, 2024, 11:15:55 PM
    Author     : Mercy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/register1.css">
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
        <form action="servlett.forgotPassword" method="POST">
            <h2>Forgot password</h2>
            
            <%
                String passwordChanged = request.getParameter("passwordChanged");
                if("false".equals(passwordChanged)){ %>
                    <h4 class="h5">Invalid Entry</h4>
               <% }
            %>
            
            <div>
                <input type="text" name="firstName" placeholder="First name" required>

                <input type="text" name="lastName" placeholder="Last name" required>
            </div> 
            
            <div>
                <input type="email" name="email" placeholder="Email" required>
                <input type="text" name="phoneNumber" placeholder="Phone Number" required>
            </div>

            <div>
                <input type="password" name="newPassword1" placeholder="Create password" required>
                <input type="password" name="newPassword2" placeholder="Confirm password" required>
            </div>
            
            <input class="submit1" type="submit" value="Submit"> 
        </form>
    </section>      
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index1.css">
    <title>Document</title>
</head>
<body>
    <div class="topbar">
        <div class="div1">
            <p>Chat Application</p>
        </div>      
        <div class="div2">
            <a href="register.jsp"> <button> Register</button> </a>
        </div>    
    </div>
    <section class="login">
        <form action="servlett.login" method="POST">
            <h2>Login</h2>
            
            <%
                String msg=request.getParameter("msg");
            %>
            
            <%
               if("registerd".equals(msg)){
           %>
            <h3 class="sucess" id="class1"> Successfully Registered!</h3>
            <%}%>

            <%
               if("passwordChanged".equals(msg)){
           %>
            <h3 class="sucess" id="class1"> Successfully Changed!</h3>
            <%}%>
            
            <%
                String passwordChanged = request.getParameter("passwordChanged");
                if("true".equals(passwordChanged)){ %>
                    <h3 class="sucess" id="class1"> Successfully Changed!</h3>
               <% }
            %>

                

            <input type="text" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            
            <%
               if("invalidCredential".equals(msg)){
           %>
           <h4 class="h4">Invalid email or password</h4>
           <%}%>
             
                        
            <input class="submit" type="submit" value="Login">

            <a href="register.jsp" >Register</a>
            <a href="forgotPassword.jsp">Forgot password?</a>
        </form>
    </section>
</body>
</html>

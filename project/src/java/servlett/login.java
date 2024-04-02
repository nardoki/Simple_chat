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


public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        try {
            
            Connection con = conProvider.getcon();
            Statement st = con.createStatement();
            
            if("admin".equals(email)||"Admin".equals(email)){
                String sql1 = "SELECT password FROM admin";
                ResultSet rs1 = st.executeQuery(sql1);
                if(rs1.next()){
                    String adminPassword = rs1.getString("password");
                    if(adminPassword.equals(password)){
                    response.sendRedirect("adminSite.jsp");
                }
                else{
                    response.sendRedirect("index.jsp?msg=invalidCredential");
                }
                }
                
            }
            else{
            
                String sql2 = "SELECT userId  FROM user WHERE email = '" + email + "' and password = '" + password +"'";
                ResultSet rs2 = st.executeQuery(sql2);

                if(rs2.next()){
                    String userId = rs2.getString("userId");
                    session.setAttribute("userId", userId);
                    response.sendRedirect("home.jsp?");
                }
                else{
                    response.sendRedirect("index.jsp?msg=invalidCredential");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        
        }
}




        
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


public class search extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        
        String search = request.getParameter("search");
        String searched = search + "%";
        
        try {
            
            Connection con = conProvider.getcon();
            Statement st = con.createStatement();
            
            
        
            
                String sql2 = "SELECT * FROM user WHERE firstName like '" + searched + "' "
                        + "or lastName like '" + searched + "' or email like '" + searched + "' or country like '" + searched + "'";
                ResultSet rs2 = st.executeQuery(sql2);  
                if(rs2.next()){
                    session.setAttribute("search", search);
                    response.sendRedirect("adminSite.jsp?msg=searchedResult");
                }
                else{
                    response.sendRedirect("adminSite.jsp?msg=notExist");
                }
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }      
        }
}




        
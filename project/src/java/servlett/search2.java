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


public class search2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        String userId  = session.getAttribute("userId").toString();
        
        String search = request.getParameter("search2");
        String searched = search + "%";
        System.out.println("search");
        try {
            
            Connection con = conProvider.getcon();
            Statement st = con.createStatement();

                String sql2 = "SELECT * FROM user WHERE userId != '"+ userId +"'and firstName like '" + searched + "' "
                        + "or lastName like '" + searched + "';";
                ResultSet rs2 = st.executeQuery(sql2);  
                if(rs2.next()){
                    session.setAttribute("search", search);
                    response.sendRedirect("home.jsp?searchResult=true");
                }
                else{
                    response.sendRedirect("home.jsp?searchResult=false");
                }
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }      
        }
}




        
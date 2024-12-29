import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class login2 extends GenericServlet {
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        int flag = 0;
        PrintWriter out = res.getWriter();
        String a = req.getParameter("username");
        String b = req.getParameter("password");
        res.setContentType("text/html");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sindhu");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from registerm");

            while (rs.next()) {
                if (a.equals(rs.getString(1)) && b.equals(rs.getString(4))) {
                    flag = 1;
                    HttpSession session = ((HttpServletRequest) req).getSession();
                    session.setAttribute("username", a);
                    break;
                }
            }

            con.close(); 

            if (flag == 1) {
                
                RequestDispatcher rd = req.getRequestDispatcher("main2.jsp");
                rd.forward(req, res);
            } else {
                
                out.println("<h3>Sorry! Username or password are incorrect</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("login2.html");
                rd.include(req, res);
            }
        } catch (Exception e) {
            out.println(e);
        }
    }
}

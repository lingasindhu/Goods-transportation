import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class success2 extends GenericServlet
{
   public void service(ServletRequest req,ServletResponse res)throws ServletException,IOException
   {
	PrintWriter out=res.getWriter();
	String a=req.getParameter("username");
	out.println("welcome! "+a);
   }
}
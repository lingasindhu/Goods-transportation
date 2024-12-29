import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class success extends GenericServlet
{
   public void service(ServletRequest req,ServletResponse res)throws ServletException,IOException
   {
	PrintWriter out=res.getWriter();
	String a=req.getParameter("t1");
	out.println("welcome! "+a);
   }
}
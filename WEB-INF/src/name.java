import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class name extends HttpServlet
{
   public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
   {
	PrintWriter out=res.getWriter();
	try
	{
	
	String name=req.getParameter("name");
	
    	res.addCookie(new Cookie("name",name));
	res.sendRedirect("age.html");
	}
    
     catch(Exception ex)
{
  out.println(ex);
}
}
}


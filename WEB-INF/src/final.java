import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class finall extends HttpServlet
{
   public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
   {
PrintWriter out=res.getWriter();
	try
	{
	String a[];
	Cookie ck[]=req.getCookies();   
	for(int i=0;i<ck.length;i++)
	{
	  a[i]=ck[i].getName();

	}
	
	for(int i=0;i<a.length;i++)
	{
	 out.println(a[i]);

	}
	}
     catch(Exception ex)
{
  out.println(ex);
}
}
}

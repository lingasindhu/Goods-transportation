import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class finall extends HttpServlet
{
public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     
        doPost(req, resp);
    }
   public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
   {
PrintWriter out=res.getWriter();
	try
	{
	
	Cookie cookies[]=req.getCookies();   
	for(int i=0;i<2;i++)
	{
		out.println(cookies[i].getValue());
	}
	}
     catch(Exception ex)
{
  out.println(ex);
}
}
}

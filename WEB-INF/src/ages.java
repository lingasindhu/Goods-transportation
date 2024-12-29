import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class ages extends HttpServlet
{

   public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
   {
PrintWriter out=res.getWriter();
	try
	{
	
	Cookie ck[]=req.getCookies(); 
	String name=new String(); 
	for (Cookie cookie : ck) {
               if (cookie.getName().equals("name"))
	       {
                   name = cookie.getValue();
                   break;
               }
           }
	String age=req.getParameter("age");
	
    res.addCookie(new Cookie("name",name));
	res.addCookie(new Cookie("age",age));
        res.sendRedirect("finall");
	}
     catch(Exception ex)
{
  out.println(ex);
}
}
}

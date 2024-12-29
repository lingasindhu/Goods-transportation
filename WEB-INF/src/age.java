import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class ages extends HttpServlet
{
public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Forward the request to the doPost method
        doPost(req, resp);
    }

   public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
   {
PrintWriter out=res.getWriter();
	try
	{
	
	Cookie ck[]=req.getCookies(); 
	String name=new String(); 
	for (Cookie cookie : cookies) {
               if (cookie.getName().equals("name")) {
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

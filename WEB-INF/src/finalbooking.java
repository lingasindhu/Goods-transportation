import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class finalbooking extends HttpServlet
{
public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     
        doPost(req, resp);
    }
   public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
   {
PrintWriter out=res.getWriter();
	try
	{
	String name="";
	String kgs="";
	String gtype="";

	Cookie ck[]=req.getCookies();   
	for (Cookie cookie : ck)
	 {
             name=ck[0].getValue();
	     kgs=ck[1].getValue();
	     gtype=ck[2].getValue();

           }
	req.setAttribute("name", name);
	req.setAttribute("kgs",kgs);
	req.setAttribute("gtype", gtype);
	 RequestDispatcher rd = req.getRequestDispatcher("finalbooking.html");
        rd.forward(req, res);
	}
     catch(Exception ex)
{
  out.println(ex);
}
}
}

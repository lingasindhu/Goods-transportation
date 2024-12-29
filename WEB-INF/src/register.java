import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class register extends HttpServlet
{
   public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
   {
	PrintWriter out=res.getWriter();
	res.setContentType("text/html");
	String a=req.getParameter("t1");
	String b=req.getParameter("t2");
	String c=req.getParameter("t3");
	String d=req.getParameter("t4");
	String e=req.getParameter("t5");
	long f=Long.parseLong(req.getParameter("t6"));
	try
	{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sindhu");
	PreparedStatement pst=con.prepareStatement("insert into register3 values(?,?,?,?,?,?)");
	pst.setString(1,a);
	pst.setString(2,b);
	pst.setString(3,c);
	pst.setString(4,d);
	pst.setString(5,e);
	pst.setLong(6,f);
	int i=pst.executeUpdate();
	if(i==1)
	    out.println("registered successfully");
}
catch(Exception ex)
{
  out.println(e);
}
}
}

	

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class registermy extends HttpServlet
{
   public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
   {
	PrintWriter out=res.getWriter();
	res.setContentType("text/html");
	String a=req.getParameter("name");
	String b=req.getParameter("email");
	long c=Long.parseLong(req.getParameter("phonenumber"));
	String d=req.getParameter("password");
	String e=req.getParameter("confirmpassword");
	String f=req.getParameter("gender");	
try
	{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sindhu");
	PreparedStatement pst=con.prepareStatement("insert into registerm values(?,?,?,?,?,?)");
	pst.setString(1,a);
	pst.setString(2,b);
	pst.setLong(3,c);
	pst.setString(4,d);
	pst.setString(5,e);
	pst.setString(6,f);
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

	

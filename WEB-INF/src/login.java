import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class login extends GenericServlet
{
   public void service(ServletRequest req,ServletResponse res)throws ServletException,IOException
   {
	int flag=0;
	PrintWriter out=res.getWriter();
	String a=req.getParameter("t1");
	String b=req.getParameter("t2");
	res.setContentType("text/html");
	try
	{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sindhu");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from login");
	
	while(rs.next())
	{
	   if(a.equals(rs.getString(1)) && b.equals(rs.getString(2)))
	   {
	       flag=1;
	       break;
	    }
	}
if(flag==1)
{
 	RequestDispatcher rd=req.getRequestDispatcher("success");
	rd.forward(req,res);
}
else
{
   out.println("<h3>sorry! username or password are incorrect</h3>");
   RequestDispatcher rd=req.getRequestDispatcher("login.html");
   rd.include(req,res);
}
con.close();
}
catch(Exception e)
{
    out.println(e);
}
}
}


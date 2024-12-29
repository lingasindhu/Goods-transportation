import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
public class bookingb extends HttpServlet
{
   public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
   {
	PrintWriter out=res.getWriter();
	res.setContentType("text/html");
	String a=req.getParameter("Name");
	String b=req.getParameter("email");
	String c=req.getParameter("pickup");
	String d=req.getParameter("delivery");
	String e=req.getParameter("goodsType");
	String f=req.getParameter("kgs");
	String g=req.getParameter("pickupDate");
        int price=0;
	if(e.equals("delicate"))
	{
	  price=32;
	}
	else if(e.equals("standard"))
	{
	  price=35;
	}
	
	else if(e.equals("heavy"))
	{
	  price=38;
	}
	

	try
	{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","sindhu");
	PreparedStatement pst=con.prepareStatement("insert into bookingbang values(?,?,?,?,?,?,?)");
	pst.setString(1,a);
	pst.setString(2,b);
	pst.setString(3,c);
	pst.setString(4,d);
	pst.setString(5,e);
	pst.setString(6,f);
	pst.setString(7,g);
	pst.executeUpdate();
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from distance");
	float kms=0;
	while(rs.next())
	{
	   if(c.equals(rs.getString(1)) && d.equals(rs.getString(2)))
	   {
	       kms=rs.getFloat(3);
	       break;
	    }
	}
	float finalp=kms*price;
	res.sendRedirect("finalbooking.html?name=" + a + "&kgs=" + f + "&gtype=" + e + "&finalp=" +finalp);
   
       con.commit();	
	 con.close();
}
 
catch(Exception ex)
{
  out.println(ex);
}
}
}

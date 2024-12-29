<%@page import="java.sql.*"%>
<%
String a = request.getParameter("Name");
String b = request.getParameter("email");
String c = request.getParameter("txt");

Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sindhu");
                PreparedStatement pst = con.prepareStatement("insert into contactus values(?,?,?)");
                pst.setString(1, a);
                pst.setString(2, b);
                pst.setString(3, c);
if(i==1)
out.println("question submitted  successfully");
%>

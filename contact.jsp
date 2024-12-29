<html>
<head>
<meta name="transport" content="width=device-width,initial-scale=1.0">
<title>contact us</title>
<style>
*{
  margin:0px;
padding:0px;
box-sizing:border-box;
}
.contact
{
  position:relative;
  min-height:100vh;
 padding: 50px 100px;
 display:flex;
 justify-content:center;
align-items:center;
flex-direction:column;
background-image:url(cbg.png);
background-size:cover;

}
.contact .content
{
  max-width:800px;
  text-align:center;
}
.contact .content
{
  font-size:36px;
  font-weight:500;
  color:white;
}
.container
{
  width:100%;
  display:flex;
  justify-content:center;
  align-items:center;
  margin-top:30px
}
.container .box
{
   color:white;
  width:50%;
  display:flex;
  flex-direction:column;
}
.container .box .info
{
   position:relative;
  padding:20px 0;
  display:flex;
  margin-left:20px;
  font-size:16px;
flex-direction:column;
 }

.container .box .info h2
{
    font-weight:500;
    color:#00bcd4;
}
.contactform
{
  width:40%;
  padding:40px;
 background:white;
}
.contactform h2
{
  font-size:30px;
  font-weight:500;
}
.contactform .inputbox
{
  position:relative;
   width:100%;
   margin-top:10px;
}
.contactform .inputbox input 
{
  width:100%;
 padding: 5px 0;
 font-size:16px;
  margin:10px 0;
 border:none;
 border-bottom:2px solid #333;
outline:none;
}
.contactform .inputbox textarea 
{
  width:100%;
 padding: 5px 0;
 font-size:16px;
  margin:10px 0;
 border:none;
 border-bottom:2px solid #333;
outline:none;
}
.contactform .inputbox input[type="submit"]:hover
{
  background-color:green;
}
.down
{
background: black;
bottom:0;
width:100%;
color:#fff;
padding:100px 0 30px;

font-size:13px;
line-height:20px;
}
.row
{
width:85%;
margin:auto;
display:flex;
flex-wrap:wrap;
align-items:flex-start;
justify-content:space-between;
}
.col
{
 flex-basis:25%;
padding:10px;
}
.col:nth-child(2),.col:nth-child(3)
{
flex-basis:15px;
}
.logo
{
  width:80px;
margin-bottom:30px;
}
 .col h3
{
 width:fit-content;
  margin-bottom:40px;
 position:relative;
}
.email-id
{
 width:fit-content;
 border-bottom:1px solid #ccc;
margin:20px p;
cursor:pointer;
}
ul li
{
 list-style:none;
 margin-bottom:12px;
}
ul li a
{ 
text-decoration:none;
color:white;
}
.social .fab
{
  width:40px;
  height:40px;
  border-radius:50%;
  text-align:center;
  line-height:40px;
   font-size:20px;
  color:#000;
  background:#fff;
 margin-right:15px;
 cursor:pointer;
}

</style>
</head>
<body>
<section class="contact">
<div class="content">
<h1 align="center">CONTACT US</h1>
</div>
<div class="container">
<div class="box">
  <div class="info">
    <h2>Address</h2>
     <p>MG Road,vijayawada<br>andhra pradesh<br>,PIN 502355,India</p>
  </div>
<div class="info">
<h2>Phone</h2>
<p>+91-9876543210</p>
</div>
<div class="info">
<h2>E-mail</h2>
<p>goodstransportation@gmail.com</p>
</div>
</div>
<div class="contactform">
<form  method="POST">
<h2>send Message</h2>
<div class="inputbox">
<input   type="text" id="Name" name="Name" placeholder="Enter Your Name" required>
</div>
<div class="inputbox">
<input  type="text" id="email" name="email" placeholder="Enter your E-mail" required>
</div>
<div class="inputbox">
<textarea required="required" id="txt" name="txt" placeholder="text your message"  ></textarea>
</div>
<div class="inputbox">
<div class="button">
<input  type="submit" value="send">
</div>
</div>
</form> 
<%@page import="java.sql.*"%>

<%
	 if (request.getParameter("submitBtn") != null) 
	{
            String a = request.getParameter("Name");
            String b = request.getParameter("email");
            String c = request.getParameter("txt");
	   if (a != null && !a.isEmpty() && b != null && !b.isEmpty() && c != null && !c.isEmpty()) {
	    try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
               Connection  con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sindhu");
                PreparedStatement pst = con.prepareStatement("insert into contactus values(?,?,?)");
                pst.setString(1, a);
                pst.setString(2, b);
                pst.setString(3, c);
                pst.executeUpdate();
%>
	<script>
                                // Call JavaScript function to display alert message
                                alert("Question has been submitted!");
                            </script>
<%
	     }
	catch(Exception ex)
	{
	  ex.printStackTrace();
	}
}
}
%>
</div>
</div>
</section>
<section class="s4">
<div class="down">
  <div class="row">
   <div class="col">
   <img src="C:\\Users\\sindh\\OneDrive\\Desktop\\logo.png" class="logo">
     <h1> Goods Tranportation </h1>
  </div>
    <div class="col">
    <h3>office</h3>
     <p>MG Road</p>
     <p>Vijayawada</p>
     <p>Andhra Pradesh,PIN 502355,India</p>
    <p class="email-id">goodstransportation@gmail.com</p>
     <h4>+91-9876543210</h4>
    </div>
    <div class="col">
    <h3>Links</h3>
    <ul>
     <li><a href="main.html">Home</a></li>
     <li><a href="about.html">About Us</a></li>
     <li><a href="contact.html">ContactUs</a></li>
     <li><a href="login.html">Login</a></li>
     <li><a href="register2.html">Register</a></li>
     </div>
     <div class="social">
    <i class="fab fa-facebook-f"></i>
    <i class="fab fa-twitter"></i>
    <i class="fab fa-whatsapp"></i>
    <i class="fab fa-pinterest"></i>
   </div>
</div>
</div>
</section>

</body>
</html>
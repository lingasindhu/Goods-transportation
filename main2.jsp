<html>
<head>
<meta name="viewport" content="with-device-width,initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="bg.css"/>
<script src="https://kit.fontawesome.com/97dc0469ce.js" crossorigin="anonymous">
function cs()
{ 
 location.href=cs.html;
}
</script>
</head>
<body>
<section class="back">
<div class="logo">
<img src="logo.png"  style="width:120px;border-radius:65px;float:left;margin-radius:100px">
</div>

<div class="banner">
<h1>GOODS TRANSPORTATION</h1>
<p>Hire trucks from our network of verified truck owners with 100% delivery guaranteed</p>
</div>
<div class="bar">
<ul>
<li><a href="main.html"><h3>Home</h3></a></li>
<li><a href="contact.html"><h3>Contact Us</h3></a></li>
<li><a href="about.html"><h3>About</h3></a></li>
 <%
        String uname = (String) session.getAttribute("username");
         if(uname != null) {
    %><li><h3>welcome:<%= uname %></h3></li>
<%
        } 
    %>
<li><a href="ubooking.jsp"><h3 style="margin-left:20px;">Bookings</h3></a></li>
<li><a href="main.html"><h3 style="margin-left:20px;">Logout</h3></a></li>

</ul>
</div>
</div>
</section>
<section class="s1">
<div class="scroll">
<h1>Booking Information</h1>
<p>To place a shippment click on the icon</p>
<div class="cs">
<a href="cs.html"><img src="cs2.png"  style="width:220px;border-radius:110px; padding-top:30px;margin-right:100px;cursor:pointer;padding-right=10px" ></a>
</div>
</div>
</section>
<div class="ad">
<h2>why to choose us?</h2><ul>
<li>Ø A quick, safe and simple way to book truck</li>
<li>Ø Live location tracking facility</li>
<li>Ø Skilled and dedicated personnel</li>
<li>Ø Comprehensive, advanced and economical moving solution</li>
<li>Ø Customized and modern transportation of goods</li>
<li>Ø 24/7 helpline des</li></ul>
 
<p class="at">TruckGuru is believed to be one of the best goods transportation service providers in catering to the transportation requirement of clients across the country with quick, advanced and cost-effective logistics services.</p>
</div>
 <div class="ad">
<h2>Benefits of choosing our transportation services?</h2>
 
<ul><li>Ø GPS monitoring system to track a fleet of truck</li>
<li>Ø 24X7 customer support</li>
<li>Ø Expert and dedicated personnel</li>
<li>Ø Door to door pickup and delivery</li>
<li>Ø FTL / FCL movements</li></ul>
 
<h2>What more we are offering?</h2>
 
<p class="at">Customers who choose us as one of the best goods transport service providers can enjoy the facility of checking truck rates quickly using our online truck booking app or portal. We allow them to get real-time rates for a vehicle booking. So, to cut down the challenges and make the entire truck booking process easier and affordable, we would be just perfect to go with. Hire our goods transportation services to manage your transport needs more smartly and economically.</p>
</div>

<section class="s2">
<div class="branches">
<h1>Popular-cities we serve</h1>
<div class="bran">
<div class="branches-col">
<figure>
<a href="bangalore.html"><img src="b2.jpg"style="height:150px;width:150px;display:inline-flex;gap:20px;" ></a>
<figcaption>Banglore</figcaption>
</figure>
</div>
<div class="branches-col">
<figure>
<a href="mumbai.html"><img src="m2.jpg"style="height:150px;width:150px;display:inline-flex;gap:20px" ></a>
<figcaption>Mumbai</figcaption>
</figure>
</div>
<div class="branches-col">
<figure>
<a href="delhi.html"><img src="d2.jpg"style="height:150px;width:150px;display:inline-flex;gap:20px" ></a>
<figcaption>Delhi</figcaption>
</figure>
</div>
<div class="branches-col">
<figure>
<a href="hyderabad.html"><img src="h2.jpg"style="height:150px;width:150px;display:inline-flex;gap:20px" ></a>
<figcaption>Hyderabad</figcaption>
</figure>
</div>
<div class="branches-col">
<figure>
<a href="gujarat.html"><img src="j2.jpg"style="height:150px;width:150px;display:inline-flex;gap:20px" ></a>
<figcaption>Gujarat</figcaption>
</figure>
</div>
</div>
</div>
</section>
<section class="s3">
<div>
<p>.</p>
</div>
</section>

<section class="s4">
<div class="down">
  <div class="row">
   <div class="col">
   <img src="logo.png" class="logo">
     <h1> Tranportation </h1>
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
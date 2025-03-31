<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - FreightFlow</title>
    <link rel="stylesheet" href="https://kit.fontawesome.com/97dc0469ce.js" crossorigin="anonymous">
    <style>
        * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Arial', sans-serif;
}

body {
  line-height: 1.6;
  color: #333;
}

/* Header Styles */
.hero {
  background-image: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url("bg4.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  height: 100vh;
  position: relative;
}

.header-top {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px;
  max-width: 1200px;
  margin: 0 auto;
}

.logo-img {
  width: 100px;
  border-radius: 50px;
}

.nav ul {
  display: flex;
  list-style: none;
}

.nav ul li {
  margin: 0 15px;
  padding: 10px 15px;
  position: relative;
  transition: background 0.3s;
}

.nav ul li a {
  text-decoration: none;
  color: white;
  font-size: 16px;
  font-weight: 500;
}

.nav ul li::after {
  content: '';
  height: 3px;
  width: 0;
  background: #ff6f61;
  position: absolute;
  left: 50%;
  bottom: 0;
  transform: translateX(-50%);
  transition: width 0.3s;
}

.nav ul li:hover::after {
  width: 50%;
}

.nav ul li:hover {
  background: rgba(0, 0, 0, 0.7);
  border-radius: 5px;
}

.banner {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
  color: white;
}

.banner h1 {
  font-size: 48px;
  font-weight: 700;
  margin-bottom: 15px;
}

.banner p {
  font-size: 20px;
  font-weight: 300;
  margin-bottom: 30px;
}

.cta-button {
  display: inline-block;
  padding: 15px 30px;
  background: #ff6f61;
  color: white;
  text-decoration: none;
  border-radius: 5px;
  font-size: 18px;
  transition: background 0.3s;
}

.cta-button:hover {
  background: #e65b50;
}

/* Introduction Section */
.intro {
  padding: 60px 20px;
  text-align: center;
  background: #f9f9f9;
}

.intro h2 {
  font-size: 32px;
  color: #004d99;
  margin-bottom: 20px;
}

.intro p {
  font-size: 18px;
  max-width: 800px;
  margin: 0 auto;
  color: #555;
}

/* How It Works Section */
.how-it-works {
  padding: 60px 20px;
  max-width: 1200px;
  margin: 0 auto;
  text-align: center;
}

.how-it-works h2 {
  font-size: 32px;
  color: #004d99;
  margin-bottom: 40px;
}

.steps {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 20px;
}

.step {
  flex: 1;
  min-width: 250px;
  padding: 20px;
}

.step i {
  font-size: 40px;
  color: #ff6f61;
  margin-bottom: 15px;
}

.step h3 {
  font-size: 20px;
  margin-bottom: 10px;
  color: #333;
}

.step p {
  font-size: 16px;
  color: #666;
}

/* Pricing Concept Section */
.pricing-concept {
  padding: 60px 20px;
  background: #f1f5f9;
  text-align: center;
}

.pricing-concept h2 {
  font-size: 32px;
  color: #004d99;
  margin-bottom: 40px;
}

.pricing-info {
  display: flex;
  justify-content: center;
  gap: 30px;
  flex-wrap: wrap;
  max-width: 1200px;
  margin: 0 auto;
}

.price-tier {
  background: white;
  padding: 20px;
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  flex: 1;
  min-width: 250px;
}

.price-tier h3 {
  font-size: 20px;
  color: #333;
  margin-bottom: 10px;
}

.price-tier p:first-of-type {
  font-size: 24px;
  color: #ff6f61;
  font-weight: 700;
  margin-bottom: 10px;
}

.price-tier p:last-of-type {
  font-size: 16px;
  color: #666;
}

.note {
  font-size: 14px;
  color: #777;
  margin-top: 20px;
}

/* Call to Action Section */
.cta {
  padding: 60px 20px;
  text-align: center;
  background: #004d99;
  color: white;
}

.cta h2 {
  font-size: 32px;
  margin-bottom: 20px;
}

.cta p {
  font-size: 18px;
  margin-bottom: 30px;
}

.cta .cta-button {
  background: #ff6f61;
}

/* Footer Styles */
.footer {
  background: linear-gradient(to right, #004d99, #002966);
  color: #fff;
  padding: 60px 20px;
  font-size: 14px;
}

.footer-content {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.col {
  flex-basis: 23%;
  padding: 20px;
}

.col .logo {
  width: 80px;
  border-radius: 40px;
  margin-bottom: 20px;
}

.col h1 {
  font-size: 24px;
  margin-bottom: 10px;
}

.col h3 {
  font-size: 18px;
  margin-bottom: 20px;
}

.email-id a {
  color: #fff;
  text-decoration: none;
  border-bottom: 1px solid #ccc;
  transition: color 0.3s;
}

.email-id a:hover {
  color: #ff6f61;
}

.col ul li a {
  color: #fff;
  text-decoration: none;
  transition: color 0.3s;
}

.col ul li a:hover {
  color: #ff6f61;
}

.social-icons {
  display: flex;
  gap: 15px;
}

.social-icons a {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  text-align: center;
  line-height: 40px;
  font-size: 18px;
  color: #004d99;
  background: #fff;
  transition: background 0.3s, color 0.3s;
}

.social-icons a:hover {
  background: #ff6f61;
  color: #fff;
}

/* Responsive Adjustments */
@media (max-width: 1024px) {
  .col {
      flex-basis: 45%;
  }
  .header-top {
      flex-direction: column;
      align-items: center;
  }
  .nav ul {
      margin-top: 20px;
  }
}

@media (max-width: 768px) {
  .nav ul {
      flex-direction: column;
      padding: 10px 0;
  }
  .nav ul li {
      margin: 10px 0;
  }
  .banner h1 {
      font-size: 36px;
  }
  .banner p {
      font-size: 16px;
  }
}

@media (max-width: 480px) {
  .col {
      flex-basis: 100%;
      text-align: center;
  }
  .social-icons {
      justify-content: center;
  }
  .intro h2, .how-it-works h2, .pricing-concept h2, .cta h2 {
      font-size: 24px;
  }
  .logo-img {
      width: 80px;
  }
}
.nav ul li {
    color: white; /* Ensure text color is white */
}

.nav ul li a, .nav ul li {
    text-decoration: none;
    color: white;
    font-size: 16px;
    font-weight: 500;
}
   

   </style>
</head>
<body>
    <section class="hero">
        <div class="header-top">
            <img src="logo.png" alt="FreightFlow Logo" class="logo-img">
            <div class="nav">
                <ul>
                    <li><a href="main.html">Home</a></li>
                    <li><a href="contact.html">Contact Us</a></li>
                    <li><a href="about.html">About</a></li>
                    <% String uname = (String) session.getAttribute("username");
                        if (uname != null) { %>
                            <li>Welcome: <%= uname %></li>
                    <% } %>
                    <li><a href="ubooking.jsp">Bookings</a></li>
                    <li><a href="main.html">Logout</a></li>
                </ul>
            </div>
        </div>
        <div class="banner">
            <h1>FreightFlow</h1>
            <p>Calculate and Transport Your Goods with Ease – Distance and Type Matter!</p>
            
        </div>
       
    </section>
    <!-- Introduction Section -->
    <section class="intro">
        <div class="content">
            <h2>Smart Pricing for Your Goods</h2>
            <p>At FreightFlow, we make transportation simple and transparent. Enter your pickup and drop-off locations, select your goods type (delicate, medium, or hard), and get an instant price based on distance and handling needs.</p>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="how-it-works">
        <h2>How It Works</h2>
        <div class="steps">
            <div class="step">
                <i class="fas fa-map-marker-alt"></i>
                <h3>Step 1: Enter Locations</h3>
                <p>Provide your pickup and drop-off points to calculate the distance.</p>
            </div>
            <div class="step">
                <i class="fas fa-box"></i>
                <h3>Step 2: Select Goods Type</h3>
                <p>Choose delicate, medium, or hard goods for tailored pricing.</p>
            </div>
            <div class="step">
                <i class="fas fa-calculator"></i>
                <h3>Step 3: Get Your Quote</h3>
                <p>Instant pricing based on kilometers and goods type – book instantly!</p>
            </div>
        </div>
    </section>

    <!-- Pricing Concept Section -->
    <section class="pricing-concept">
        <h2>Pricing Made Simple</h2>
        <div class="pricing-info">
            <div class="price-tier">
                <h3>Delicate Goods</h3>
                <p>₹32/km</p>
                <p>Extra care for fragile items like glass or electronics.</p>
            </div>
            <div class="price-tier">
                <h3>Medium Goods</h3>
                <p>₹35/km</p>
                <p>Standard handling for items like furniture or packaged goods.</p>
            </div>
            <div class="price-tier">
                <h3>Hard Goods</h3>
                <p>₹38/km</p>
                <p>Cost-effective for durable items like metal or machinery.</p>
            </div>
        </div>
        <p class="note">*Prices are indicative and may vary based on additional factors. Get your exact quote on the booking page.</p>
    </section>

    <!-- Call to Action Section -->
    <section class="cta">
        <h2>Ready to Move Your Goods?</h2>
        <p>Calculate your price and book your transportation now with FreightFlow.</p>
        <a href="cs.jsp" class="cta-button">Start Booking</a>
    </section>

    <!-- Footer -->
    <section class="footer">
        <div class="footer-content">
            <div class="col">
                <img src="logo.png" class="logo" alt="FreightFlow Logo">
                <h1>FreightFlow</h1>
                <p>Smart Logistics, Transparent Pricing</p>
            </div>
            <div class="col">
                <h3>Office</h3>
                <p>MG Road, Vijayawada</p>
                <p>Andhra Pradesh, PIN 502355, India</p>
                <p class="email-id"><a href="mailto:support@freightflow.in">support@freightflow.in</a></p>
                <h4>+91-9876543210</h4>
            </div>
            <div class="col">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="main2.jsp">Home</a></li>
                    <li><a href="cs.jsp">Book Now</a></li>
                    <li><a href="about.html">About Us</a></li>
                    <li><a href="contact.html">Contact Us</a></li>
                    <li><a href="login2.jsp">Login</a></li>
                </ul>
            </div>
            <div class="col">
                <h3>Connect With Us</h3>
                <div class="social-icons">
                    <a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
                    <a href="#" target="_blank"><i class="fab fa-whatsapp"></i></a>
                    <a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
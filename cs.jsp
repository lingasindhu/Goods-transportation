<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String uname = (String) session.getAttribute("username"); // Retrieve username from session
    if (uname == null) {
        response.sendRedirect("login2.jsp"); // Redirect to login page if not logged in
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Transportation Booking</title>
  <style>
    :root {
      --primary-color: #0056b3;
      --secondary-color: #003366;
      --accent-color: #ff9800;
      --light-color: #f8f9fa;
      --dark-color: #343a40;
      --success-color: #28a745;
      --danger-color: #dc3545;
      --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      --radius: 8px;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      background-color: #f5f7fa;
      color: #333;
      line-height: 1.6;
    }

    .hero-section {
      background-image: linear-gradient(rgba(0, 54, 102, 0.8), rgba(0, 86, 179, 0.7)), url("/api/placeholder/1200/400");
      background-size: cover;
      background-position: center;
      padding: 80px 0;
      text-align: center;
      color: white;
    }

    .hero-section h1 {
      font-size: 2.5rem;
      margin-bottom: 20px;
    }

    .hero-section p {
      font-size: 1.2rem;
      max-width: 700px;
      margin: 0 auto;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 20px;
    }

    .booking-section {
      margin: -50px auto 50px;
      display: flex;
      justify-content: center;
    }

    .card {
      background: white;
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      overflow: hidden;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      width: 100%;
      max-width: 750px;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
    }

    .card-header {
      background: var(--primary-color);
      color: white;
      padding: 20px;
      text-align: center;
    }

    .card-header h2 {
      font-size: 1.5rem;
    }

    .card-body {
      padding: 30px;
    }

    .form-row {
      display: flex;
      gap: 20px;
      margin-bottom: 20px;
    }

    .form-group {
      margin-bottom: 20px;
      flex: 1;
    }

    label {
      display: block;
      margin-bottom: 8px;
      font-weight: 600;
      color: var(--dark-color);
    }

    input, select {
      width: 100%;
      padding: 12px 15px;
      border: 1px solid #ddd;
      border-radius: var(--radius);
      font-size: 16px;
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
      background-color: white;
      color: #333;
    }

    input:focus, select:focus {
      border-color: var(--primary-color);
      box-shadow: 0 0 0 3px rgba(0, 86, 179, 0.25);
      outline: none;
    }

    .btn {
      display: inline-block;
      padding: 14px 28px;
      background-color: var(--primary-color);
      color: white;
      border: none;
      border-radius: var(--radius);
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: background-color 0.3s ease;
      width: 100%;
      text-align: center;
    }

    .btn:hover {
      background-color: var(--secondary-color);
    }

    .footer {
      background-color: var(--dark-color);
      color: white;
      padding: 60px 0 30px;
    }

    .footer-content {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
    }

    .footer-column {
      flex: 1;
      min-width: 200px;
      margin-bottom: 30px;
      padding: 0 15px;
    }

    .footer-column h3 {
      font-size: 1.2rem;
      margin-bottom: 20px;
      position: relative;
      padding-bottom: 10px;
    }

    .footer-column h3:after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 50px;
      height: 2px;
      background-color: var(--accent-color);
    }

    .footer-links {
      list-style: none;
    }

    .footer-links li {
      margin-bottom: 10px;
    }

    .footer-links a {
      color: #ddd;
      text-decoration: none;
      transition: color 0.3s ease;
    }

    .footer-links a:hover {
      color: var(--accent-color);
    }

    .social-icons {
      display: flex;
      gap: 15px;
      margin-top: 20px;
    }

    .social-icon {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 40px;
      height: 40px;
      background-color: rgba(255, 255, 255, 0.1);
      border-radius: 50%;
      color: white;
      transition: background-color 0.3s ease;
    }

    .social-icon:hover {
      background-color: var(--accent-color);
    }

    .copyright {
      text-align: center;
      padding-top: 30px;
      border-top: 1px solid rgba(255, 255, 255, 0.1);
      margin-top: 30px;
      font-size: 14px;
      color: #aaa;
    }

    .logo {
      width: 80px;
      height: auto;
      margin-bottom: 20px;
    }

    /* Responsive design */
    @media (max-width: 768px) {
      .form-row {
        flex-direction: column;
        gap: 0;
      }
      
      .footer-column {
        flex-basis: 50%;
      }
    }

    @media (max-width: 576px) {
      .card-body {
        padding: 20px;
      }
      
      .footer-column {
        flex-basis: 100%;
      }
    }
  </style>
</head>
<body>
  <!-- Hero Section -->
  <section class="hero-section">
    <div class="container">
      <h1>Reliable Transportation Services</h1>
      <p>Fast, secure, and efficient goods transportation across India</p>
    </div>
  </section>

  <!-- Booking Section -->
  <div class="container">
    <div class="booking-section">
      <!-- Booking Form Card -->
      <div class="card">
        <div class="card-header">
          <h2>Book Transportation</h2>
        </div>
        <div class="card-body">
          <form action="finalbooking1.jsp" method="POST">
            <div class="form-row">
              <div class="form-group">
                <label for="Name">Full Name</label>
                <input type="text" id="Name" name="Name" placeholder="Enter your full name" required>
              </div>
              
              <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email address" required>
              </div>
            </div>
            
            <div class="form-row">
              <div class="form-group">
                <label for="pickup">Pickup Location</label>
                <select id="pickup" name="pickup" required>
                  <option value="">Select pickup location</option>
                  <option value="Hyderabad">Hyderabad</option>
                  <option value="Vijayawada">Vijayawada</option>
                  <option value="Chennai">Chennai</option>
                  <option value="Mumbai">Mumbai</option>
                </select>
              </div>
              
              <div class="form-group">
                <label for="delivery">Delivery Location</label>
                <select id="delivery" name="delivery" required>
                  <option value="">Select delivery location</option>
                  <option value="Chandigarh">Chandigarh</option>
                  <option value="Lucknow">Lucknow</option>
                  <option value="Jaipur">Jaipur</option>
                  <option value="Shimla">Shimla</option>
                </select>
              </div>
            </div>
            
            <div class="form-row">
              <div class="form-group">
                <label for="goodsType">Type of Goods</label>
                <select id="goodsType" name="goodsType" required>
                  <option value="">Select goods type</option>
                  <option value="delicate">Delicate Items</option>
                  <option value="standard">Standard Goods</option>
                  <option value="heavy">Heavy Equipment</option>
                </select>
              </div>
              
              <div class="form-group">
                <label for="kgs">Weight (in kg)</label>
                <input type="number" id="kgs" name="kgs" placeholder="Enter weight in kilograms" min="1" required>
              </div>
            </div>
            
            <div class="form-group">
              <label for="pickupDate">Pickup Date</label>
              <input type="date" id="pickupDate" name="pickupDate" required>
            </div>
            
            <button type="submit" class="btn">Book Transportation</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <footer class="footer">
    <div class="container">
      <div class="footer-content">
        <div class="footer-column">
          <img src="/api/placeholder/80/80" alt="Company Logo" class="logo">
          <h3>Goods Transportation</h3>
          <p>Providing reliable and efficient transportation services across India since 2010.</p>
        </div>
        
        <div class="footer-column">
          <h3>Office</h3>
          <p>MG Road</p>
          <p>Vijayawada</p>
          <p>Andhra Pradesh, PIN 502355, India</p>
          <p>Email: goodstransportation@gmail.com</p>
          <p>Phone: +91-9876543210</p>
        </div>
        
        <div class="footer-column">
          <h3>Quick Links</h3>
          <ul class="footer-links">
            <li><a href="main.html">Home</a></li>
            <li><a href="about.html">About Us</a></li>
            <li><a href="services.html">Services</a></li>
            <li><a href="contact.html">Contact Us</a></li>
            <li><a href="login.html">Login</a></li>
            <li><a href="register2.html">Register</a></li>
          </ul>
        </div>
        
        <div class="footer-column">
          <h3>Connect With Us</h3>
          <p>Follow us on social media for updates and promotions</p>
          <div class="social-icons">
            <a href="#" class="social-icon">f</a>
            <a href="#" class="social-icon">t</a>
            <a href="#" class="social-icon">w</a>
            <a href="#" class="social-icon">p</a>
          </div>
        </div>
      </div>
      
      <div class="copyright">
        <p>&copy; 2025 Goods Transportation. All Rights Reserved.</p>
      </div>
    </div>
  </footer>
</body>
</html>
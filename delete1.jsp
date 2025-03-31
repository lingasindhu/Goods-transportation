<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Status</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #0056b3;
            margin-bottom: 30px;
        }

        .message {
            font-size: 18px;
            margin: 30px 0;
            padding: 20px;
            border-radius: 8px;
            line-height: 1.6;
        }

        .success {
            background-color: #e8f5e9;
            color: #2e7d32;
            border-left: 5px solid #4CAF50;
        }

        .error {
            background-color: #ffebee;
            color: #c62828;
            border-left: 5px solid #f44336;
        }
        
        .confirmation-details {
            background-color: #e3f2fd;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
            text-align: left;
            border-left: 5px solid #2196F3;
        }
        
        .confirmation-details p {
            margin: 10px 0;
            font-size: 16px;
        }

        .button {
            display: inline-block;
            padding: 12px 24px;
            background-color: #0056b3;
            color: white;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s, transform 0.2s;
            margin-top: 20px;
        }

        .button:hover {
            background-color: #003366;
            transform: translateY(-2px);
        }
        
        .icon {
            font-size: 64px;
            margin-bottom: 20px;
        }
        
        .success-icon {
            color: #4CAF50;
        }
        
        .cancel-icon {
            color: #f44336;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            String a = request.getParameter("Name");
            String action = request.getParameter("cancelBtn") != null ? "cancel" : "payment";
            
            boolean isSuccess = false;
            String message = "";
            String title = "";
            String iconClass = "";
            
            if (a != null && !a.isEmpty()) {
                Connection con = null;
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sindhu");
                    
                    if (action.equals("cancel")) {
                        // Handle cancellation
                        PreparedStatement pst = con.prepareStatement("DELETE FROM booking WHERE Name = ?");
                        pst.setString(1, a);
                        int result = pst.executeUpdate();
                        
                        if (result > 0) {
                            isSuccess = true;
                            title = "Booking Cancelled";
                            message = "Your booking has been successfully cancelled. We hope to serve you again in the future.";
                            iconClass = "cancel-icon";
                        } else {
                            title = "Cancellation Failed";
                            message = "We couldn't find your booking in our system. Please contact our customer support for assistance.";
                        }
                    } else {
                        // Handle payment confirmation
                        isSuccess = true;
                        title = "Booking Confirmed";
                        message = "Your booking has been successfully confirmed. Thank you for choosing our transportation services!";
                        iconClass = "success-icon";
                    }
                } catch (Exception ex) {
                    title = "Error";
                    message = "An error occurred while processing your request: " + ex.getMessage();
                    ex.printStackTrace();
                } finally {
                    try {
                        if (con != null) con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            } else {
                title = "Invalid Request";
                message = "No booking information was provided. Please try again.";
            }
        %>
        
        <h1><%= title %></h1>
        
        <div class="icon <%= iconClass %>">
            <%= isSuccess ? (action.equals("cancel") ? "✕" : "✓") : "!" %>
        </div>
        
        <div class="message <%= isSuccess ? "success" : "error" %>">
            <%= message %>
        </div>
        
        <% if (isSuccess && action.equals("payment")) { %>
            <div class="confirmation-details">
                <p><strong>Booking Reference:</strong> <%= System.currentTimeMillis() % 10000000 %></p>
                <p><strong>Status:</strong> Confirmed</p>
                <p><strong>Name:</strong> <%= a %></p>
                <p><strong>Date:</strong> <%= new java.text.SimpleDateFormat("dd MMM yyyy").format(new java.util.Date()) %></p>
                <p>A confirmation email with all the details has been sent to your registered email address.</p>
            </div>
        <% } %>
        
        <a href="main2.jsp" class="button">Return to Home</a>
    </div>
</body>
</html>
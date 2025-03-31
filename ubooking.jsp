<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transportation Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
        }
        .dashboard {
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            margin-top: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <header>
        <h1>Transportation Admin Dashboard</h1>
    </header>
    <div class="container">
        <div class="dashboard">
            <h2>My Bookings</h2>
            
            <%
                String uname = (String) session.getAttribute("username");
              
                if (uname == null || uname.isEmpty()) {
            %>
            <div id="bookingdetails">
                <p>Please log in to view your bookings.</p>
            </div>
            <%
                } else {
                    try {
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sindhu");
                        
                        // Use PreparedStatement
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM booking WHERE name = ?");
                        ps.setString(1, uname);
                        ResultSet rs = ps.executeQuery();

                        boolean hasBookings = false;
            %>
            <div id="bookingdetails">
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Mail-id</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Goods Type</th>
                        <th>Weight (kg)</th>
                        <th>Pickup Date</th>
                    </tr>
                    <% while (rs.next()) { 
                        hasBookings = true;
                    %>
                    <tr>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("pickup") %></td>
                        <td><%= rs.getString("delivery") %></td>
                        <td><%= rs.getString("goodstype") %></td>
                        <td><%= rs.getInt("kgs") %></td>
                        <td><%= rs.getString("pickupdate") %></td>
                    </tr>
                    <% } %>
                </table>
                <% if (!hasBookings) { %>
                    <p>No bookings available.</p>
                <% } %>
            </div>
            <%
                        rs.close();
                        ps.close();
                        con.close();
                    } catch (Exception e) {
                        out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </div>
</body>
</html>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transportation Admin Dashboard</title>
    <style>
        /* Basic styling for demonstration purposes */
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
        .city-options {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .city-option {
            margin: 0 10px;
            cursor: pointer;
            padding: 5px 10px;
            border: 1px solid #333;
            border-radius: 5px;
            background-color: #fff;
            transition: background-color 0.3s ease;
        }
        .city-option:hover {
            background-color: black;
            color: white;
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
                
            </div>
            <%
                } else {
                    try {
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sindhu");
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from booking");
                        boolean hasBookings = false; 

                        Statement st1 = con.createStatement();
                        ResultSet rs1 = st1.executeQuery("select * from bookingbang");
                        boolean hasBookings1 = false;

                        Statement st2 = con.createStatement();
                        ResultSet rs2 = st2.executeQuery("select * from bookinggujarat");
                        boolean hasBookings2 = false;

                        Statement st3 = con.createStatement();
                        ResultSet rs3 = st3.executeQuery("select * from bookingmumbai");
                        boolean hasBookings3 = false;

                        Statement st4 = con.createStatement();
                        ResultSet rs4 = st4.executeQuery("select * from bookingdelhi");
                        boolean hasBookings4 = false;

                        Statement st5 = con.createStatement();
                        ResultSet rs5 = st5.executeQuery("select * from bookinghyderabad");
                        boolean hasBookings5 = false;
			
            %>
            <div id="bookingdetails">
                <table id="bookingdetails">
                    <tr>
                        <th>Name</th>
                        <th>Mail-id</th>
                        <th>From</th>
                        <th>To</th>
                        <th>GoodsType</th>
                        <th>kgs</th>
                    </tr>
                    <% while (rs.next()) {
                        if (uname.equals(rs.getString(1))) {
                            hasBookings = true; // Set flag to true if there are bookings
                    %>
                    <tr>
                        <td><%= rs.getString(1) %></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getString(4) %></td>
                        <td><%= rs.getString(5) %></td>
                        <td><%= rs.getString(6) %></td>
                    </tr>
                    <% } } %>
                      <% while (rs1.next()) {
                        if (uname.equals(rs1.getString(1))) {
                            hasBookings1 = true; // Set flag to true if there are bookings
                    %>
                    <tr>
                        <td><%= rs1.getString(1) %></td>
                        <td><%= rs1.getString(2) %></td>
                        <td><%= rs1.getString(3) %></td>
                        <td><%= rs1.getString(4) %></td>
                        <td><%= rs1.getString(5) %></td>
                        <td><%= rs1.getString(6) %></td>
                    </tr>
                    <% } } %>
			 <% while (rs5.next()) {
                        if (uname.equals(rs5.getString(1))) {
                            hasBookings5 = true; // Set flag to true if there are bookings
                    %>
                    <tr>
                        <td><%= rs5.getString(1) %></td>
                        <td><%= rs5.getString(2) %></td>
                        <td><%= rs5.getString(3) %></td>
                        <td><%= rs5.getString(4) %></td>
                        <td><%= rs5.getString(5) %></td>
                        <td><%= rs5.getString(6) %></td>
                    </tr>
                    <% } } %>
 <% while (rs2.next()) {
                        if (uname.equals(rs2.getString(1))) {
                            hasBookings2 = true; // Set flag to true if there are bookings
                    %>
                    <tr>
                        <td><%= rs2.getString(1) %></td>
                        <td><%= rs2.getString(2) %></td>
                        <td><%= rs2.getString(3) %></td>
                        <td><%= rs2.getString(4) %></td>
                        <td><%= rs2.getString(5) %></td>
                        <td><%= rs2.getString(6) %></td>
                    </tr>
                    <% } } %>
 <% while (rs3.next()) {
                        if (uname.equals(rs3.getString(1))) {
                            hasBookings3 = true; // Set flag to true if there are bookings
                    %>
                    <tr>
                        <td><%= rs3.getString(1) %></td>
                        <td><%= rs3.getString(2) %></td>
                        <td><%= rs3.getString(3) %></td>
                        <td><%= rs3.getString(4) %></td>
                        <td><%= rs3.getString(5) %></td>
                        <td><%= rs3.getString(6) %></td>
                    </tr>
                    <% } } %>
 <% while (rs4.next()) {
                        if (uname.equals(rs4.getString(1))) {
                            hasBookings4 = true; // Set flag to true if there are bookings
                    %>
                    <tr>
                        <td><%= rs4.getString(1) %></td>
                        <td><%= rs4.getString(2) %></td>
                        <td><%= rs4.getString(3) %></td>
                        <td><%= rs4.getString(4) %></td>
                        <td><%= rs4.getString(5) %></td>
                        <td><%= rs4.getString(6) %></td>
                    </tr>
                    <% } } %>
		 
                </table>
                <% if (!hasBookings && !hasBookings1  && !hasBookings2  && !hasBookings3  && !hasBookings4 && !hasBookings5 ) { %>
                    <p>No bookings available.</p> 
                <% } %>
            </div>
            <%
                    rs.close();
                    st.close();
		  rs1.close();
                    st1.close();
			rs2.close();
                    st2.close();
			rs3.close();
                    st3.close();
			rs4.close();
                    st4.close();
			rs5.close();
                    st5.close();
                    con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </div>
</body>
</html>

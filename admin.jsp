<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
        header { background-color: #333; color: #fff; padding: 10px; text-align: center; }
        .container { max-width: 1200px; margin: 20px auto; padding: 0 20px; }
        .dashboard { background-color: #f4f4f4; padding: 20px; border-radius: 5px; box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); }
        h2 { margin-top: 0; }
        .options { display: flex; justify-content: center; margin-top: 20px; }
        .options form { margin: 0 10px; }
        .options input { padding: 10px; border: 1px solid #333; border-radius: 5px; cursor: pointer; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border-bottom: 1px solid #ddd; text-align: center; }
        th { background-color: #333; color: #fff; }
        tr:hover { background-color: #f9f9f9; }
        .btn { background-color: red; color: white; border: none; padding: 5px 10px; cursor: pointer; }
    </style>
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
        <form action="main.html" method="post">
            <input type="submit" value="Logout">
        </form>
    </header>

    <div class="container">
        <div class="dashboard">
            <h2>Manage Bookings & Registrations</h2>
            <div class="options">
                <form method="get">
                    <input type="submit" name="view" value="View Bookings">
                    <input type="submit" name="view" value="View Registrations">
                </form>
            </div>

            <%
                // Database Connection
                Connection con = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sindhu");

                    String action = request.getParameter("view");

                    if ("View Bookings".equals(action)) {
                        pstmt = con.prepareStatement("SELECT * FROM BOOKING");
                        rs = pstmt.executeQuery();
            %>
            <div>
                <h2>Booking Details</h2>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Pickup</th>
                        <th>Delivery</th>
                        <th>Goods Type</th>
                        <th>Weight (Kgs)</th>
                        <th>Pickup Date</th>
                        <th>Cancel</th>
                    </tr>
                    <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getString("NAME") %></td>
                        <td><%= rs.getString("EMAIL") %></td>
                        <td><%= rs.getString("PICKUP") %></td>
                        <td><%= rs.getString("DELIVERY") %></td>
                        <td><%= rs.getString("GOODSTYPE") %></td>
                        <td><%= rs.getInt("KGS") %></td>
                        <td><%= rs.getDate("PICKUPDATE") %></td>
                        <td>
                            <form method="post">
                                <input type="hidden" name="bookingEmail" value="<%= rs.getString("EMAIL") %>">
                                <input type="submit" name="cancelBooking" value="Cancel" class="btn">
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </table>
            </div>
            <%
                    } else if ("View Registrations".equals(action)) {
                        pstmt = con.prepareStatement("SELECT * FROM REGISTERM");
                        rs = pstmt.executeQuery();
            %>
            <div>
                <h2>Registered Users</h2>
                <table>
                    <tr>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone No</th>
                        <th>Password</th>
                        <th>Gender</th>
                    </tr>
                    <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getString("USERNAME") %></td>
                        <td><%= rs.getString("EMAIL") %></td>
                        <td><%= rs.getString("PHONENO") %></td>
                        <td><%= rs.getString("PASSWORD") %></td>
                        <td><%= rs.getString("GENDER") %></td>
                    </tr>
                    <% } %>
                </table>
            </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (con != null) con.close();
                }
            %>

            <%-- Delete Booking --%>
            <%
                if (request.getParameter("cancelBooking") != null) {
                    String bookingEmail = request.getParameter("bookingEmail");

                    try {
                        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sindhu");
                        String query = "DELETE FROM BOOKING WHERE EMAIL = ?";
                        pstmt = con.prepareStatement(query);
                        pstmt.setString(1, bookingEmail);

                        int deleted = pstmt.executeUpdate();

                        if (deleted > 0) {
            %>
            <script>
                alert("Booking deleted successfully!");
                window.location.href = "admin.jsp?view=View+Bookings";
            </script>
            <%
                        } else {
            %>
            <script>
                alert("Error: No matching booking found!");
            </script>
            <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        if (pstmt != null) pstmt.close();
                        if (con != null) con.close();
                    }
                }
            %>

        </div>
    </div>
</body>
</html>

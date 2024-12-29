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
	<form action="main.html " method="post">
            <input type="submit" value="Logout">
        </form>

    </header>
    <div class="container">
        <div class="dashboard">
            <h2>Transportation Dashboard</h2>
            <div class="city-options">
                <form>
                    <input type="submit" value="All Over India" id="all" name="button">
                    <input type="submit" value="Gujarat" id="Gujarat" name="button">
                    <input type="submit" value="Mumbai" id="Mumbai" name="button">
                    <input type="submit" value="Hyderabad" id="Hyderabad" name="button">
                    <input type="submit" value="Delhi" id="Delhi" name="button">
                    <input type="submit" value="Bangolre" id="Bangolre" name="button">
		    <input type="submit" value="Registrations" id="Registrations" name="Registrations">
                </form>
            </div>
            <%
                String bc = request.getParameter("button");
                if (bc == null || bc.isEmpty()) {
            %>
            <div id="transportationDetails">
                
            </div>
            <%
                } else {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sindhu");
                    Statement st = con.createStatement();
                    ResultSet rs = null;
                    if (bc.equals("All Over India")) {
                        rs = st.executeQuery("select * from booking");
                    } else if (bc.equals("Gujarat")) {
                        rs = st.executeQuery("select * from bookinggujarat");
                    } else if (bc.equals("Mumbai")) {
                        rs = st.executeQuery("select * from bookingmumbai");
                    } else if (bc.equals("Hyderabad")) {
                        rs = st.executeQuery("select * from bookinghyderabad");
                    } else if (bc.equals("Delhi")) {
                        rs = st.executeQuery("select * from bookingdelhi");
                    } else if (bc.equals("Bangolre")) {
                        rs = st.executeQuery("select * from bookingbang");
                    }
            %>
            <div id="transportationDetails">
                <table id="transportationDetails">
                    <tr>
                        <th>Name</th>
                        <th>Mail-id</th>
                        <th>From</th>
                        <th>To</th>
                        <th>kgs</th>
			<th>Cancel button</th>
                    </tr>
                    <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getString(1) %></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getString(4) %></td>
                        <td><%= rs.getString(6) %></td>
			 <td>
                            <form method="post" action="">
                                <input type="hidden" name="bookingId" value="<%= rs.getString(1) %>">
				 <input type="hidden" name="city" value="<%= bc %>"> 
                                <input type="submit" value="Cancel" name="cancelBtn">
                            </form>
                        </td>

                    </tr>
                    <% } %>
                </table>
            </div>
            <% } %>
		<%
                String r = request.getParameter("Registrations");
                if (r == null || r.isEmpty()) {
            %>
            <div id="registrationdetails">
                
            </div>
            <%
                } else {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sindhu");
                    Statement s = con.createStatement();
                    ResultSet rss = null;
		    if (r.equals("Registrations")) {
                        rss = s.executeQuery("select * from registerm");
	            }
		
%> <div id="registrationdetails">
                <table id="registrationdetails">
                    <tr>
                        <th>Name</th>
                        <th>Mail-id</th>
                        <th>Phoneno</th>
                        <th>Password</th>
                        <th>gender</th>
                    </tr>
                    <% while (rss.next()) { %>
                    <tr>
                        <td><%= rss.getString(1) %></td>
                        <td><%= rss.getString(2) %></td>
                        <td><%= rss.getString(3) %></td>
                        <td><%= rss.getString(4) %></td>
                        <td><%= rss.getString(6) %></td>

                    </tr>
                    <% } %>
                </table>
            </div>
            <% } %>

	     <%
		Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sindhu");
			 Statement st = con.createStatement();
		 String ccity= request.getParameter("city");
	         String rcity="";
		if (ccity == null || ccity.isEmpty()) {
                        rcity="booking";
                    }
		else if (ccity.equals("All Over India")) {
                        rcity="booking";
                    }
		    else if (ccity.equals("Gujarat")) 
		     {
			rcity="bookinggujarat";
                        
                    }
		     else if (ccity.equals("Mumbai")) 
		    {
			rcity="bookingmumbai";

                    } 
		    else if (ccity.equals("Hyderabad"))
		    {
			rcity="bookinghyderabad";
                       
                    } 
		    else if (ccity.equals("Delhi")) 
		    {
			rcity="bookingdelhi";
                        
                    }
		   else if (ccity.equals("Bangolre")) 
		   {
			rcity="bookingbang";
                        
                    }
                if (request.getParameter("cancelBtn") != null) {
                    String bookingId = request.getParameter("bookingId");
		   
                    try {
                        st.executeUpdate("DELETE FROM " +rcity+  "  WHERE name = '" + bookingId + "'");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </div>
</body>
</html>

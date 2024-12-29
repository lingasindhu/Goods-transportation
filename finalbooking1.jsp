<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
    <style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
}

.p
{
text-align:center;
}

.confirmation  {
  margin-right:20px;
    margin-bottom: 25px;
   
}
.button1 {
  display: inline-block;
  padding: 10px 20px;
  background-color: #4CAF50;
  color: white;
  font-size: 16px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  transition: background-color 0.3s;
  margin-left:15px;
}

.button1:hover {
  background-color: #45a049;
}

</style>
</head>
<body>
<div class="container">
    <h1>Booking Confirmation</h1>
    <div class="confirmation">
        <%
            String a = request.getParameter("Name");
            String b = request.getParameter("email");
            String c = request.getParameter("pickup");
            String d = request.getParameter("delivery");
            String e = request.getParameter("goodsType");
            String f = request.getParameter("kgs");
            String g = request.getParameter("pickupDate");
            int price = 0;
             if (e != null && e.equals("delicate"))  {
                price = 32;
            } else if (e != null && e.equals("standard")) {
                price = 35;
            } else if (e != null &&e.equals("heavy")) {
                price = 38;
            }
            float finalp = 0;
            Connection con = null;
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sindhu");
                PreparedStatement pst = con.prepareStatement("insert into booking values(?,?,?,?,?,?,?)");
                pst.setString(1, a);
                pst.setString(2, b);
                pst.setString(3, c);
                pst.setString(4, d);
                pst.setString(5, e);
                pst.setString(6, f);
                pst.setString(7, g);
                pst.executeUpdate();

                ResultSet rs = null;
                Statement st = con.createStatement();
                rs = st.executeQuery("select * from distance");
                float kms = 0;
                while (rs.next()) {
                    if (c.equals(rs.getString(1)) && d.equals(rs.getString(2))) {
                        kms = rs.getFloat(3);
                        break;
                    }
                }
                finalp = kms * price;
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                try {
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        %>
        <form action="delete1.jsp" method="POST">
            <p class="p">Thank you for your booking!</p>
            <p class="confirmation"><h4>Name: <%= a %></h4></p>
            <p class="confirmation"><h4>Kgs: <%= f %></h4></p>
            <p class="confirmation"><h4>Goods Type: <%= e %></h4></p>
            <p class="confirmation"><h4>Final Price:  <%= String.valueOf(finalp) %></h4></p>
	    <input type="hidden" name="Name" value="<%= (a != null && !a.isEmpty()) ? a : "" %>">
            <input type="submit" value="Proceed To Pay" id="pay" name="pay" class="button1">
            <input type="submit" value="Cancel" id="cancel" name="cancelBtn" class="button1">
       </form>
 
    </div>
</div>
</body>
</html>

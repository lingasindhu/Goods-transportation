<%@ page import="java.sql.*" %>
<%
    String a = request.getParameter("Name"); // Assuming 'Name' is the unique identifier for your booking
    
    if (a != null && !a.isEmpty()) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sindhu");
            PreparedStatement pst = con.prepareStatement("DELETE FROM booking WHERE Name = ?");
            pst.setString(1, a);
            pst.executeUpdate();
            out.println("Booking cancelled successfully!");
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            out.println("Error cancelling booking: " + ex.getMessage());
        }
    } else {
        out.println("No booking specified.");
    }
%>

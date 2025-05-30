<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    // Database connection setup
    String url = "jdbc:mysql://localhost:3306/hotelDB"; // Replace with your DB name
    String user = "root"; // DB username
    String password = "password"; // DB password

    Connection con = null;
    Statement stmt = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String message = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, password);
        stmt = con.createStatement();

        // Create table if it doesn't exist
        stmt.executeUpdate("CREATE TABLE IF NOT EXISTS room_pricing (" +
                           "roomType VARCHAR(50), price DECIMAL(10,2))");

        // Insert data on POST
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String roomType = request.getParameter("roomType");
            double price = Double.parseDouble(request.getParameter("price"));

            ps = con.prepareStatement("INSERT INTO room_pricing (roomType, price) VALUES (?, ?)");
            ps.setString(1, roomType);
            ps.setDouble(2, price);

            int result = ps.executeUpdate();
            message = result > 0 ? "Room pricing added successfully!" : "Failed to add pricing.";
        }

        // Fetch existing pricing
        rs = stmt.executeQuery("SELECT * FROM room_pricing");
    } catch (Exception e) {
        message = "Error: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pricing Details - Hotel Management</title>
    <style>
        body {
            background-color: #0d47a1;
            font-family: Arial, sans-serif;
            color: white;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .container {
            background: white;
            color: #0d47a1;
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        form label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #aaa;
        }

        input[type="submit"] {
            margin-top: 20px;
            background-color: #1E40AF;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #0C2D7D;
        }

        .message {
            text-align: center;
            font-weight: bold;
            margin: 20px 0;
            color: <%= message.startsWith("Error") ? "#d93025" : "#2e7d32" %>;
        }

        table {
            width: 100%;
            margin-top: 30px;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        th {
            background-color: #1976d2;
            color: white;
        }

        .back-btn {
            display: block;
            width: fit-content;
            margin: 30px auto 0;
            padding: 10px 20px;
            background-color: #1E40AF;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }

        .back-btn:hover {
            background-color: #0C2D7D;
        }
    </style>
</head>
<body>
    <h1>Room Pricing Management</h1>

    <div class="container">
        <% if (!message.isEmpty()) { %>
            <div class="message"><%= message %></div>
        <% } %>

        <!-- Add Pricing Form -->
        <form method="post">
            <label for="roomType">Room Type:</label>
            <input type="text" name="roomType" required />

            <label for="price">Price (₹):</label>
            <input type="number" name="price" step="0.01" required />

            <input type="submit" value="Add Pricing" />
        </form>

        <!-- Show Pricing Table -->
        <%
            if (rs != null) {
        %>
        <table>
            <tr>
                <th>Room Type</th>
                <th>Price (₹)</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("roomType") %></td>
                <td><%= rs.getDouble("price") %></td>
            </tr>
            <%
                }
            %>
        </table>
        <% } %>

        <a class="back-btn" href="index.jsp">← Back to Home</a>
    </div>
</body>
</html>

<%
    // Clean up
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (ps != null) ps.close(); } catch (Exception e) {}
    try { if (stmt != null) stmt.close(); } catch (Exception e) {}
    try { if (con != null) con.close(); } catch (Exception e) {}
%>

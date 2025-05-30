<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconnect.jsp" %>
<%
    String message = "";
    boolean showForm = true;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            int reservationId = Integer.parseInt(request.getParameter("reservationId"));
            String customerName = request.getParameter("customerName");
            String roomNumber = request.getParameter("roomNumber");
            java.sql.Date checkInDate = java.sql.Date.valueOf(request.getParameter("checkInDate"));
            java.sql.Date checkOutDate = java.sql.Date.valueOf(request.getParameter("checkOutDate"));
            String contact = request.getParameter("contact");

            PreparedStatement psCheck = con.prepareStatement("SELECT * FROM reservations WHERE reservationId = ? OR roomNumber = ?");
            psCheck.setInt(1, reservationId);
            psCheck.setString(2, roomNumber);
            ResultSet rsCheck = psCheck.executeQuery();

            if (rsCheck.next()) {
                message = "Error: Reservation ID or Room Number already exists.";
            } else {
                PreparedStatement psInsert = con.prepareStatement(
                    "INSERT INTO reservations (reservationId, customerName, roomNumber, checkInDate, checkOutDate, contact) VALUES (?, ?, ?, ?, ?, ?)"
                );
                psInsert.setInt(1, reservationId);
                psInsert.setString(2, customerName);
                psInsert.setString(3, roomNumber);
                psInsert.setDate(4, checkInDate);
                psInsert.setDate(5, checkOutDate);
                psInsert.setString(6, contact);

                int rows = psInsert.executeUpdate();
                if (rows > 0) {
                    message = "Reservation added successfully!";
                    showForm = false;
                } else {
                    message = "Error: Failed to add reservation.";
                }
                psInsert.close();
            }

            rsCheck.close();
            psCheck.close();
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            try { con.close(); } catch (Exception e) {}
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Reservation</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }

        .container {
            width: 90%;
            max-width: 800px;
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 16px;
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
        }

        h1, h2 {
            text-align: center;
            color: #ffffff;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #e0e0e0;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            margin-top: 5px;
            margin-bottom: 10px;
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            margin-top: 20px;
            background-color: #1E40AF;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0C2D7D;
        }

        .message {
            text-align: center;
            font-weight: bold;
            margin: 20px 0;
            color: <%= message.startsWith("Error") ? "#ff6b6b" : "#66ff99" %>;
        }

        .back-home {
            text-align: center;
            margin-top: 30px;
        }

        .back-home a {
            display: inline-block;
            padding: 10px 20px;
            background: #1E40AF;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .back-home a:hover {
            background: #0C2D7D;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hotel Management System</h1>
        <h2>Add New Reservation</h2>

        <% if (!message.isEmpty()) { %>
            <div class="message"><%= message %></div>
        <% } %>

        <% if (showForm) { %>
        <form method="post">
            <label for="reservationId">Reservation ID:</label>
            <input type="number" name="reservationId" required />

            <label for="customerName">Customer Name:</label>
            <input type="text" name="customerName" required />

            <label for="roomNumber">Room Number:</label>
            <input type="text" name="roomNumber" required />

            <label for="checkInDate">Check-In Date:</label>
            <input type="date" name="checkInDate" required />

            <label for="checkOutDate">Check-Out Date:</label>
            <input type="date" name="checkOutDate" required />

            <label for="contact">Contact:</label>
            <input type="text" name="contact" required />

            <input type="submit" value="Add Reservation" />
        </form>
        <% } else { %>
        <div class="back-home">
            <a href="index.jsp">🏠 Back to Home</a>
        </div>
        <% } %>
    </div>
</body>
</html>

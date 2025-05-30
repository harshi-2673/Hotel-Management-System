<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="dbconnect.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Reservations - Hotel Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            margin: 0;
            padding: 40px 20px;
            color: #ffffff;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            color: #ffffff;
            font-size: 2.8rem;
            margin-bottom: 30px;
        }

        .table-container {
            max-width: 1100px;
            margin: auto;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            padding: 30px;
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.25);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            color: #fff;
        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        th {
            background-color: rgba(13, 71, 161, 0.85);
            color: white;
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .back-link {
            text-align: center;
            margin-top: 30px;
        }

        .back-link a {
            text-decoration: none;
            color: #fff;
            background-color: #1E40AF;
            padding: 12px 30px;
            border-radius: 10px;
            font-weight: bold;
            transition: background 0.3s;
            display: inline-block;
        }

        .back-link a:hover {
            background-color: #0C2D7D;
        }
    </style>
</head>
<body>

<h1>Hotel Management System - All Reservations</h1>

<div class="table-container">
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Room</th>
            <th>Check-In</th>
            <th>Check-Out</th>
            <th>Contact</th>
        </tr>

        <%
            try {
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM reservations ORDER BY reservationId ASC");

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("reservationId") %></td>
            <td><%= rs.getString("customerName") %></td>
            <td><%= rs.getString("roomNumber") %></td>
            <td><%= rs.getDate("checkInDate") %></td>
            <td><%= rs.getDate("checkOutDate") %></td>
            <td><%= rs.getString("contact") %></td>
        </tr>
        <%
                }

                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
        %>
        <tr><td colspan="6" style="color: red;">Error: <%= e.getMessage() %></td></tr>
        <%
            }
        %>
    </table>
</div>

<div class="back-link">
    <a href="index.jsp">⬅ Back to Home</a>
</div>

</body>
</html>

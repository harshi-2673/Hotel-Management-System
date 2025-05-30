<%@ page import="java.sql.*" %>
<%@ include file="dbconnect.jsp" %>
<html>
<meta charset="UTF-8">
<head>
    <title>Hotel Report Summary</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f6ff; /* very light blue */
            margin: 0; 
            padding: 0;
            color: #1e3a5f; /* dark blue text */
        }
        .container {
            max-width: 800px;
            margin: 40px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 12px #90b4e8; /* blue shadow */
        }
        h2, h3 {
            color: #1b2e4b; /* darker blue */
            text-align: center;
            font-weight: 700;
            letter-spacing: 0.04em;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 0 6px #c3dbf5;
        }
        th, td {
            border: 1px solid #b3c9e6;
            padding: 10px;
            text-align: center;
            color: #1e3a5f;
        }
        th {
            background-color: #1b2e4b; /* dark blue */
            color: white;
            font-weight: 600;
            letter-spacing: 0.05em;
        }
        tr:nth-child(even) {
            background-color: #eaf2fc; /* light blue */
        }
        p {
            text-align: center;
            color: #2f4f76;
            font-size: 1.1em;
        }
        a.btn-back {
            display: block;
            width: 180px;
            margin: 30px auto 0;
            padding: 12px 20px;
            background: #1b2e4b; /* dark blue */
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            transition: background 0.3s ease;
        }
        a.btn-back:hover {
            background: #122138; /* darker blue */
        }
    </style>
</head>
<body>
<div class="container">
<h2>Hotel Report Summary</h2>

<%
String type = request.getParameter("type");

if (con == null) {
    out.println("<p>Database connection failed.</p>");
} else if (type == null) {
    out.println("<p>No report type selected.</p>");
} else {
    if (type.equals("dateRange")) {
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        if (start != null && end != null) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM Reservations WHERE CheckIn BETWEEN ? AND ?");
            ps.setString(1, start);
            ps.setString(2, end);
            ResultSet rs = ps.executeQuery();
%>
<h3>Reservations from <%= start %> to <%= end %></h3>
<table>
<tr><th>ID</th><th>Name</th><th>Room</th><th>Check-In</th><th>Check-Out</th><th>Amount</th></tr>
<%
            while (rs.next()) {
%>
<tr>
    <td><%= rs.getInt("ReservationID") %></td>
    <td><%= rs.getString("CustomerName") %></td>
    <td><%= rs.getString("RoomNumber") %></td>
    <td><%= rs.getDate("CheckIn") %></td>
    <td><%= rs.getDate("CheckOut") %></td>
    <td>₹ <%= String.format("%.2f", rs.getDouble("TotalAmount")) %></td>
</tr>
<%
            }
            rs.close();
            ps.close();
        } else {
            out.println("<p>Please provide start and end dates.</p>");
        }

    } else if (type.equals("frequentRooms")) {
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(
            "SELECT RoomNumber, COUNT(*) AS Bookings FROM Reservations GROUP BY RoomNumber ORDER BY Bookings DESC");
%>
<h3>Most Frequently Booked Rooms</h3>
<table>
<tr><th>Room Number</th><th>Number of Bookings</th></tr>
<%
        while (rs.next()) {
%>
<tr>
    <td><%= rs.getString("RoomNumber") %></td>
    <td><%= rs.getInt("Bookings") %></td>
</tr>
<%
        }
        rs.close();
        stmt.close();

    } else if (type.equals("revenue")) {
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        if (start != null && end != null) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT SUM(TotalAmount) AS TotalRevenue FROM Reservations WHERE CheckIn BETWEEN ? AND ?");
            ps.setString(1, start);
            ps.setString(2, end);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                double revenue = rs.getDouble("TotalRevenue");
%>
<h3>Total Revenue from <%= start %> to <%= end %></h3>
<p><strong>₹ <%= String.format("%.2f", revenue) %></strong></p>
<%
            } else {
                out.println("<p>No revenue data found for this period.</p>");
            }
            rs.close();
            ps.close();
        } else {
            out.println("<p>Please provide start and end dates.</p>");
        }

    } else {
        out.println("<p>Invalid report type.</p>");
    }

    con.close();
}
%>

<a href="reports.jsp" class="btn-back">Return to Dashboard</a>
</div>
</body>
</html>

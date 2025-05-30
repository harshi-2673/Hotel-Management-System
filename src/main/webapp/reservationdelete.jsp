<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconnect.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Delete Reservation</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #ffffff;
        }

        .container {
            width: 90%;
            max-width: 500px;
            background: rgba(255, 255, 255, 0.1);
            padding: 40px;
            border-radius: 16px;
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        h1 {
            font-size: 2.8rem;
            margin-bottom: 10px;
        }

        h2 {
            font-size: 1.6rem;
            margin-bottom: 25px;
            color: #e0e0e0;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #fff;
            text-align: left;
        }

        select {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            border-radius: 8px;
            margin-bottom: 20px;
            border: none;
            background: rgba(255,255,255,0.2);
            color: #fff;
        }

        input[type="submit"] {
            background-color: #1E40AF;
            color: white;
            border: none;
            padding: 14px;
            width: 100%;
            font-size: 1.1rem;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0C2D7D;
        }

        .message, .error {
            margin-top: 20px;
            font-weight: bold;
            font-size: 1rem;
        }

        .message {
            color: #66ff99;
        }

        .error {
            color: #ff6666;
        }

        .back-link {
            margin-top: 30px;
        }

        .back-link a {
            display: inline-block;
            padding: 10px 25px;
            background-color: #1E40AF;
            color: #fff;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background 0.3s;
        }

        .back-link a:hover {
            background-color: #0C2D7D;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Hotel Management</h1>
    <h2>Delete Reservation</h2>

    <form method="post" action="">
        <label for="reservationId">Select Reservation:</label>
        <select name="reservationId" id="reservationId" required>
            <option value="">-- Choose a reservation --</option>
            <%
                try {
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT reservationId, customerName, roomNumber FROM reservations");
                    while (rs.next()) {
                        int id = rs.getInt("reservationId");
                        String name = rs.getString("customerName");
                        String room = rs.getString("roomNumber");
            %>
                <option value="<%= id %>"><%= name %> (Room: <%= room %>)</option>
            <%
                    }
                    rs.close();
                    stmt.close();
                } catch(Exception e) {
            %>
                <option disabled>Error loading reservations</option>
            <%
                }
            %>
        </select>

        <input type="submit" value="Delete Reservation" />
    </form>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            try {
                int reservationId = Integer.parseInt(request.getParameter("reservationId"));
                PreparedStatement ps = con.prepareStatement("DELETE FROM reservations WHERE reservationId = ?");
                ps.setInt(1, reservationId);
                int rows = ps.executeUpdate();

                if (rows > 0) {
    %>
                    <p class="message">Reservation deleted successfully.</p>
    <%
                } else {
    %>
                    <p class="error">No reservation found with that ID.</p>
    <%
                }
                ps.close();
                con.close();
            } catch (Exception e) {
    %>
                <p class="error">Error: <%= e.getMessage() %></p>
    <%
            }
        }
    %>

    <div class="back-link">
        <a href="index.jsp">⬅ Back to Home</a>
    </div>
</div>

</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconnect.jsp" %>
<%
    String message = "";
    boolean showForm = true;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            int reservationId = Integer.parseInt(request.getParameter("reservationId"));
            java.sql.Date newCheckIn = java.sql.Date.valueOf(request.getParameter("checkInDate"));
            java.sql.Date newCheckOut = java.sql.Date.valueOf(request.getParameter("checkOutDate"));

            PreparedStatement psCheck = con.prepareStatement("SELECT * FROM reservations WHERE reservationId = ?");
            psCheck.setInt(1, reservationId);
            ResultSet rsCheck = psCheck.executeQuery();

            if (!rsCheck.next()) {
                message = "Error: Reservation ID not found.";
            } else {
                PreparedStatement psUpdate = con.prepareStatement(
                    "UPDATE reservations SET checkInDate = ?, checkOutDate = ? WHERE reservationId = ?"
                );
                psUpdate.setDate(1, newCheckIn);
                psUpdate.setDate(2, newCheckOut);
                psUpdate.setInt(3, reservationId);

                int rows = psUpdate.executeUpdate();
                if (rows > 0) {
                    message = "Reservation dates updated successfully!";
                    showForm = false;
                } else {
                    message = "Error: Update failed.";
                }
                psUpdate.close();
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Reservation - Hotel Management</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            color: #ffffff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        .container {
            width: 100%;
            max-width: 800px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            padding: 40px 50px;
            text-align: center;
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.37);
            border: 1px solid rgba(255, 255, 255, 0.18);
        }

        h1 {
            font-size: 2.5rem;
            color: #ffffff;
            margin-bottom: 20px;
        }

        .message {
            text-align: center;
            font-weight: bold;
            margin: 20px 0;
            font-size: 1.1rem;
            color: <%= message.startsWith("Error") ? "#d93025" : "#2e7d32" %>;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            font-weight: 600;
            color: #ffffff;
            margin: 15px 0 5px;
            font-size: 1.1rem;
        }

        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 20px;
        }

        input[type="submit"] {
            background-color: #3b5998; 
            color: white;
            padding: 14px;
            font-size: 1.1rem;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #2a3e73;
        }

        .buttons a {
            background-color: #3b5998;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            margin: 0 10px;
            transition: background-color 0.3s;
            display: inline-block;
        }

        .buttons a:hover {
            background-color: #2a3e73;
        }

        footer {
            margin-top: 50px;
            color: #bcd1e5;
            font-size: 1rem;
        }

        footer strong {
            color: #ffffff;
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 2rem;
            }

            input[type="submit"] {
                padding: 12px;
                font-size: 1rem;
            }

            .buttons a {
                padding: 8px 16px;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Update Reservation Dates</h1>

    <% if (!message.isEmpty()) { %>
        <div class="message"><%= message %></div>
        <% if (!showForm) { %>
            <div class="buttons">
                <a href="reservationupdate.jsp">🔁 Update Another</a>
                <a href="index.jsp">🏠 Back to Home</a>
            </div>
        <% } %>
    <% } %>

    <% if (showForm) { %>
    <form method="post">
        <label for="reservationId">Reservation ID:</label>
        <input type="number" name="reservationId" required />

        <label for="checkInDate">New Check-In Date:</label>
        <input type="date" name="checkInDate" required />

        <label for="checkOutDate">New Check-Out Date:</label>
        <input type="date" name="checkOutDate" required />

        <input type="submit" value="Update Reservation" />
    </form>
    <% } %>
</div>

<footer>
    Developed by <strong>Ashritha</strong>
</footer>

</body>
</html>

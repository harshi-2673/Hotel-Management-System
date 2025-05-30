<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Member Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 50px;
        }
        .login-container {
            background-color: #1E40AF;
            padding: 30px;
            border-radius: 10px;
            color: white;
            max-width: 400px;
            margin: auto;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: none;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #0C2D7D;
            color: white;
            padding: 12px;
            width: 100%;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #06326B;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Member Login</h2>
        <form method="POST">
            <label for="registrationId">Registration ID:</label>
            <input type="text" id="registrationId" name="registrationId" required />

            <label for="roomNumber">Room Number:</label>
            <input type="text" id="roomNumber" name="roomNumber" required />

            <input type="submit" value="Login" />
        </form>

        <%
            String message = "";
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String registrationId = request.getParameter("registrationId");
                String roomNumber = request.getParameter("roomNumber");

                // Simple hardcoded login check (in real-world, use a database or file)
                if ("12345".equals(registrationId) && "101".equals(roomNumber)) {
                    // Store login details in session
                    session.setAttribute("registrationId", registrationId);
                    session.setAttribute("roomNumber", roomNumber);
                    session.setAttribute("guestName", "John Doe"); // Example Name

                    // Redirect to the member details page
                    response.sendRedirect("memberdetails.jsp");
                } else {
                    message = "Invalid Registration ID or Room Number!";
                }
            }

            // Output message if login fails
            if (!message.isEmpty()) {
                out.println("<p style='color: red;'>" + message + "</p>");
            }
        %>
    </div>
</body>
</html>

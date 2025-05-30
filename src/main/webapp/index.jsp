<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Hotel Management System</title>
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
            max-width: 900px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            padding: 60px 50px;
            text-align: center;
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.37);
            border: 1px solid rgba(255, 255, 255, 0.18);
        }

        h1 {
            font-size: 3rem;
            color: #ffffff;
            margin-bottom: 10px;
        }

        .divider {
            height: 3px;
            width: 60px;
            margin: 20px auto;
            background: #ffffff;
            border-radius: 50px;
        }

        p.subtitle {
            font-size: 1.2rem;
            margin-bottom: 40px;
            color: #d0dfe6;
        }

        .menu {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .menu a {
            display: inline-block;
            padding: 14px 28px;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
            text-decoration: none;
            border-radius: 12px;
            font-weight: bold;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .menu a:hover {
            background: linear-gradient(135deg, #16222a, #3a6073);
            transform: scale(1.05);
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
                font-size: 2.2rem;
            }

            .menu a {
                width: 100%;
                font-size: 1rem;
                padding: 12px 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hotel Management System</h1>
        <div class="divider"></div>
        <p class="subtitle">Manage Your Bookings with Ease</p>

        <div class="menu">
            <a href="reservationadd.jsp">Add Booking</a>
            <a href="reservationupdate.jsp">Update Booking</a>
            <a href="reservationdelete.jsp">Delete Booking</a>
            <a href="reservationdisplay.jsp">View Bookings</a>
            <a href="reportsummary.jsp">Report Summary</a>
        </div>

        <footer>
            Developed by <strong>Ashritha</strong>
        </footer>
    </div>
</body>
</html>

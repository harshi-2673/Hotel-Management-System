<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Report Summary - Hotel Management</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background-color: #0d1b2a;
            color: #ffffff;
            margin: 0;
            padding: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #1b263b;
            padding: 40px;
            border-radius: 12px;
            width: 90%;
            max-width: 600px;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #e0e1dd;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #415a77;
        }

        th {
            background-color: #415a77;
            color: white;
        }

        .back-btn {
            display: block;
            width: fit-content;
            margin: 0 auto;
            padding: 10px 20px;
            background-color: #1d3557;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
        }

        .back-btn:hover {
            background-color: #457b9d;
        }

        footer {
            margin-top: 20px;
            text-align: center;
            color: #a8dadc;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Report Summary</h1>
        <table>
            <tr>
                <th>Room ID</th>
                <th>Room Number</th>
            </tr>
            <tr>
                <td>101</td>
                <td>A-1</td>
            </tr>
            <tr>
                <td>102</td>
                <td>A-2</td>
            </tr>
            <tr>
                <td>103</td>
                <td>B-1</td>
            </tr>
            <!-- Add more rows as needed -->
        </table>

        <a href="index.jsp" class="back-btn">← Back to Home</a>

        <footer>
            Developed by <strong>Ashritha</strong>
        </footer>
    </div>
</body>
</html>

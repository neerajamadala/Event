<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Management</title>
    <style>
        /* Updated CSS styles for the page */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e3f2fd;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }
        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 500px;
        }
        h1 {
            color: #444;
            margin-bottom: 25px;
            font-size: 28px;
        }
        .operation-links {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
        }
        .operation-links a {
            display: inline-block;
            padding: 12px 25px;
            font-size: 18px;
            text-decoration: none;
            color: #ffffff;
            background-color: #4caf50; /* Green */
            border-radius: 8px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .operation-links a:hover {
            background-color: #388e3c; /* Darker green */
            transform: scale(1.05);
        }
        .operation-links a:active {
            background-color: #2c6d2f; /* Even darker green */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Event Management</h1>
        <div class="operation-links">
            <a href="createEvent.jsp">Create Event</a>
            <a href="listEvents.jsp">List Events</a>
            <a href="updateEvent.jsp">Update Event</a>
            <a href="deleteEvent.jsp">Delete Event</a>
        </div>
    </div>
</body>
</html>
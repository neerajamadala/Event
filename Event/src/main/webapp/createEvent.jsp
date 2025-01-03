<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Event</title>
    <style>
        /* Updated CSS styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e8f0fe;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        h1 {
            color: #444;
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
        }
        form {
            background: #ffffff;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 450px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"],
        input[type="date"],
        input[type="time"],
        textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="date"]:focus,
        input[type="time"]:focus,
        textarea:focus {
            border-color: #4a90e2;
        }
        input[type="submit"] {
            background-color: #4a90e2;
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: block;
            width: 100%;
            box-sizing: border-box;
        }
        input[type="submit"]:hover {
            background-color: #357ab7;
        }
    </style>
</head>
<body>
    <form action="createEventServlet" method="post">
        <h1>Create Event</h1>

        <label for="name">Event Name:</label>
        <input type="text" name="name" id="name" required>

        <label for="date">Event Date:</label>
        <input type="date" name="date" id="date" required>

        <label for="time">Event Time:</label>
        <input type="time" name="time" id="time" required>

        <label for="venue">Venue:</label>
        <input type="text" name="venue" id="venue" required>

        <label for="description">Description:</label>
        <textarea name="description" id="description" rows="4" required></textarea>

        <input type="submit" value="Create Event">
    </form>
</body>
</html>

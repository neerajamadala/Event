<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="com.vignan.Event"%>
<%@ page import="com.helper.FactoryProvider"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Event</title>
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #e8f4f8;
        color: #333;
        padding: 20px;
    }

    h1, h2 {
        color: #004085;
        text-align: center;
    }

    form {
        max-width: 400px;
        margin: 30px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        color: #333;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 6px;
        background-color: #f9f9f9;
    }

    input[type="submit"] {
        background-color: #ff4d4d;
        color: white;
        border: none;
        border-radius: 6px;
        padding: 12px 20px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        width: 100%;
    }

    input[type="submit"]:hover {
        background-color: #e63946;
    }

    table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
    }

    th {
        background-color: #007bff;
        color: white;
    }

    td {
        background-color: #f9f9f9;
    }

    .container {
        text-align: center;
        margin-top: 20px;
    }

    .container a {
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
    }

    .container a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <h1>Delete Event</h1>

    <h2>List of Events</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Date</th>
            <th>Time</th>
            <th>Venue</th>
            <th>Description</th>
        </tr>

        <% 
        // Open a session from the factory provider
        Session session2 = FactoryProvider.getFactory().openSession();
        try {
            // Begin a transaction
            session2.beginTransaction();

            // Retrieve the list of events from the database
            List<Event> events = session2.createQuery("from Event").getResultList();

            // Loop through each event and display its details in the table
            for (Event event : events) {
        %>
        <tr>
            <td><%= event.getId() %></td>
            <td><%= event.getName() %></td>
            <td><%= event.getDate() %></td>
            <td><%= event.getTime() %></td>
            <td><%= event.getVenue() %></td>
            <td><%= event.getDescription() %></td>
        </tr>
        <%
            }
            // Commit the transaction
            session2.getTransaction().commit();
        } finally {
            // Close the session
            session2.close();
        }
        %>
    </table>

    <h2>Delete Event</h2>
    <form action="deleteEventServlet" method="post">
        <label for="id">Event ID:</label>
        <input type="text" name="id" required>
        <input type="submit" value="Delete Event">
    </form>

    <div class="container">
        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>
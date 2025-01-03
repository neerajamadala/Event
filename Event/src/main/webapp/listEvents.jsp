<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.vignan.Event" %>
<%@ page import="com.helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Events</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .container {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>List of Events</h1>
    
    <table>
        <tr>
            <th>ID</th>
            <th>Event Name</th>
            <th>Date</th>
            <th>Time</th>
            <th>Venue</th>
            <th>Description</th>
        </tr>
        
        <% 
            // Open a Hibernate session to fetch the list of events
            Session session2 = FactoryProvider.getFactory().openSession();
            
            try {
                session2.beginTransaction();
                // Fetch all events from the database
                List<Event> events = session2.createQuery("from Event", Event.class).getResultList();
                
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
                session2.getTransaction().commit();
            } catch (Exception e) {
                // Handle exceptions if any
                e.printStackTrace();
            } finally {
                // Close the session to release database resources
                session2.close();
            }
        %>
    </table>

    <!-- Navigation button to go back to the home page -->
    <div class="container">
        <a href="index.jsp" class="btn">Home</a>
    </div>
</body>
</html>

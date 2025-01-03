<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="com.vignan.Event" %>
<%@ page import="com.helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Event</title>
    <style>
        /* Add your CSS styles here */
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        h1, h2 { color: #333; text-align: center; margin-top: 20px; }
        form { max-width: 400px; margin: 20px auto; background: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        label { display: block; margin-bottom: 5px; color: #333; }
        input[type="text"], input[type="date"], input[type="time"] { width: 100%; padding: 10px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box; }
        input[type="submit"] { background-color: #007bff; color: #fff; border: none; border-radius: 5px; padding: 10px 20px; cursor: pointer; width: 100%; transition: background-color 0.3s ease; }
        input[type="submit"]:hover { background-color: #0056b3; }
        table { width: 80%; margin: 20px auto; border-collapse: collapse; background-color: #fff; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Update Event</h1>
    
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
        Session session2 = null;
        Transaction tx = null;
        try {
            session2 = FactoryProvider.getFactory().openSession();
            tx = session2.beginTransaction();
            Query<Event> query = session2.createQuery("from Event", Event.class);
            List<Event> events = query.getResultList();
            
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
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            if (session2 != null) session2.close();
        }
        %>
    </table>
    
    <h2>Update Event</h2>
    <form action="updateEventServlet" method="post">
        <label for="id">Event ID:</label>
        <input type="text" name="id" placeholder="Enter Event ID" required>
        
        <label for="name">Event Name:</label>
        <input type="text" name="name" placeholder="Enter Event Name" required>
        
        <label for="date">Event Date:</label>
        <input type="date" name="date" required>
        
        <label for="time">Event Time:</label>
        <input type="time" name="time" required>
        
        <label for="venue">Venue:</label>
        <input type="text" name="venue" placeholder="Enter Venue" required>
        
        <label for="description">Description:</label>
        <input type="text" name="description" placeholder="Enter Description" required>
        
        <input type="submit" value="Update Event">
    </form>
</body>
</html>

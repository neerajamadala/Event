package com.servlet;

import com.helper.FactoryProvider;
import com.vignan.*;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// Annotation to map the servlet to the URL pattern
@WebServlet("/createEventServlet")
public class createEventServlet extends HttpServlet {

    // Handles the HTTP POST request for creating a new event
    @SuppressWarnings("deprecation")
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Reading form parameters from the request
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String venue = request.getParameter("venue");
        String description = request.getParameter("description");

        // Creating a new Event object and setting its properties
        Event event = new Event();
        event.setName(name);
        event.setDate(date);
        event.setTime(time);
        event.setVenue(venue);
        event.setDescription(description);

        // Hibernate session and transaction management
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = session.beginTransaction();

        try {
            // Saving the event to the database
            session.save(event);
            tx.commit(); // Committing the transaction
        } catch (Exception e) {
            // Rolling back in case of an error
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            // Closing the session
            session.close();
        }

        // Redirecting to the events listing page after creating the event
        response.sendRedirect("listEvents.jsp");
    }

    // Handles the HTTP GET request; typically redirects to the event creation form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("createEvent.jsp"); // Redirect to the event creation form
    }
}

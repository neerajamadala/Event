package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.FactoryProvider;
import com.vignan.Event;

@WebServlet("/updateEventServlet")
public class updateEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve data from the form
        int eventId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String venue = request.getParameter("venue");
        String description = request.getParameter("description");

        // Open Hibernate session
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            // Begin a transaction
            tx = session.beginTransaction();

            // Retrieve the event with the given ID from the database
            Event event = session.get(Event.class, eventId);

            // Update the event's information
            if (event != null) {
                event.setName(name);
                event.setDate(date);
                event.setTime(time);
                event.setVenue(venue);
                event.setDescription(description);

                // Save the updated event to the database
                session.merge(event);
                tx.commit();

                // Redirect to the list of events with a success message
                response.sendRedirect("listEvents.jsp");
            } else {
                // Event not found, display an error message
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<h1 style='text-align:center;'>Event Not Found</h1>");
                out.println("<h1 style='text-align:center;'><a href='listEvents.jsp'>View all Events</a></h1>");
            }
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}

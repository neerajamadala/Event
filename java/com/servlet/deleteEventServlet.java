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

@WebServlet("/deleteEventServlet")
public class deleteEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the ID of the event to delete from the form
        int eventId = Integer.parseInt(request.getParameter("id"));

        // Open Hibernate session
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;

        try {
            // Begin a transaction
            tx = session.beginTransaction();

            // Retrieve the event with the given ID from the database
            Event event = session.get(Event.class, eventId);

            // Delete the event if found
            if (event != null) {
                session.remove(event);
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

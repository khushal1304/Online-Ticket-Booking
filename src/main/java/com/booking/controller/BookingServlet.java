package com.booking.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.http.HttpSession;
import com.booking.model.User;
import com.booking.util.DBConnection;

@WebServlet("/bookTicket")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            User user = (User) session.getAttribute("user");
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            String movieTitle = request.getParameter("movieTitle");
            int numTickets = Integer.parseInt(request.getParameter("numTickets"));
            String showTime = request.getParameter("showTime");
            
            // Dummy price calculation
            double ticketPrice = 150.00;
            double totalPrice = numTickets * ticketPrice;

            String sql = "INSERT INTO bookings (user_id, movie_id, show_time, num_tickets, total_price) VALUES (?, ?, ?, ?, ?)";

            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, user.getId());
                stmt.setInt(2, movieId);
                stmt.setString(3, showTime);
                stmt.setInt(4, numTickets);
                stmt.setDouble(5, totalPrice);

                int rowsAffected = stmt.executeUpdate();

                if (rowsAffected > 0) {
                    // Set attributes for the confirmation page
                    request.setAttribute("movieTitle", movieTitle);
                    request.setAttribute("numTickets", numTickets);
                    request.setAttribute("showTime", showTime);
                    request.setAttribute("totalPrice", totalPrice);
                    request.getRequestDispatcher("confirmation.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Booking failed. Please try again.");
                    response.sendRedirect("dashboard.jsp"); // Redirect back with error
                }
            }

        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred during booking.");
            response.sendRedirect("dashboard.jsp");
        }
    }
}

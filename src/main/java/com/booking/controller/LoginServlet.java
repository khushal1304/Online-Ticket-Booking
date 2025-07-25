package com.booking.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.http.HttpSession;
import com.booking.model.User;
import com.booking.util.DBConnection;
import com.booking.util.PasswordUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String plainTextPassword = request.getParameter("password");

        // ** NEW: Secure login logic **
        String sql = "SELECT * FROM users WHERE email = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);

            ResultSet rs = stmt.executeQuery();

            // Step 1: Check if a user with that email exists
            if (rs.next()) {
                String hashedPasswordFromDB = rs.getString("password");
                
                // Step 2: Verify the submitted password against the stored hash
                if (PasswordUtil.checkPassword(plainTextPassword, hashedPasswordFromDB)) {
                    // Passwords match! Create session.
                    HttpSession session = request.getSession();
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    session.setAttribute("user", user);

                    response.sendRedirect("dashboard.jsp");
                } else {
                    // Passwords do not match
                    request.setAttribute("errorMessage", "Invalid email or password.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                // No user found with that email
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
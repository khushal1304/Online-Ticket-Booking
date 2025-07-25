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
import com.booking.util.DBConnection;
import com.booking.util.PasswordUtil;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // ** NEW: Hash the password before storing it **
        String hashedPassword = PasswordUtil.hashPassword(password);

        String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, hashedPassword); // <-- Store the HASHED password

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("login.jsp?status=regsuccess");
            } else {
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                 request.setAttribute("errorMessage", "Username or Email already exists.");
            } else {
                 request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            }
            e.printStackTrace();
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
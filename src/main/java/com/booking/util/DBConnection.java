package com.booking.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/ticketbooking_db";
    private static final String USER = "root"; 
    private static final String PASSWORD = "eit123"; 

    public static Connection getConnection() {
        Connection connection = null;
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the connection
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // In a real app, use a logging framework
        }
        return connection;
    }
}
package com.booking.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {
    // Method to hash a password
    public static String hashPassword(String plainTextPassword) {
        return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
    }

    // Method to check a password against a hashed one
    public static boolean checkPassword(String plainTextPassword, String hashedPassword) {
        return BCrypt.checkpw(plainTextPassword, hashedPassword);
    }
}
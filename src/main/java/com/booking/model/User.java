package com.booking.model;

public class User {
    private int id;
    private String username;
    private String email;
    private String password; // In a real app, this should be hashed

    // Constructors, Getters, and Setters
    public User() 
    {}

    public int getId()
    { 
    	return id; 
    }
    
    public void setId(int id) 
    { 
    	this.id = id; 
    }
    
    public String getUsername() 
    { 
    	return username;
    }
    
    public void setUsername(String username) 
    {
    	this.username = username; 
    }
    
    public String getEmail() 
    {
    	return email; 
    }
    
    public void setEmail(String email) 
    { 
    	this.email = email; 
    }
    
    public String getPassword() 
    { 
    	return password; 
    }
    
    public void setPassword(String password) 
    { 
    	this.password = password; 
    }
}
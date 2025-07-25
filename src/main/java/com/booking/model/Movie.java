package com.booking.model;

import java.util.Date;

public class Movie {
    private int id;
    private String title;
    private String genre;
    private String director;
    private String description;
    private String posterUrl;
    private Date releaseDate;

    // Constructors, Getters, and Setters
    public Movie() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }
    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getPosterUrl() { return posterUrl; }
    public void setPosterUrl(String posterUrl) { this.posterUrl = posterUrl; }
    public Date getReleaseDate() { return releaseDate; }
    public void setReleaseDate(Date releaseDate) { this.releaseDate = releaseDate; }
}
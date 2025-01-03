package com.vignan;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Events1")
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "eventname")
    private String eventname;

    @Column(name = "date")
    private String date;  // Consider using `java.time.LocalDate` for better date handling

    @Column(name = "eventtime")
    private String eventtime;  // Consider using `java.time.LocalTime` or `java.time.LocalDateTime`

    @Column(name = "venue")
    private String venue;

    @Column(name = "description")
    private String description;

    // Constructors
    public Event() {
        super();
    }

    public Event(int id, String eventname, String date, String eventtime, String venue, String description) {
        this.id = id;
        this.eventname = eventname;
        this.date = date;
        this.eventtime = eventtime;
        this.venue = venue;
        this.description = description;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return eventname;
    }

    public void setName(String name) {
        this.eventname = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return eventtime;
    }

    public void setTime(String eventtime) {
        this.eventtime = eventtime;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

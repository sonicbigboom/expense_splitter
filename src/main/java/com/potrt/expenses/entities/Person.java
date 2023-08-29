package com.potrt.expenses.entities;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "person")
public class Person {
    @Id
    private int id;
    
    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;
    
    /**
     * Gets the person id.
     * @return The id.
     */
    public int getId() {
        return id;
    }

    /**
     * Sets the person id.
     * @param id The new person id.
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Gets the person's first name.
     * @return The person's first name.
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * Sets the person's first name.
     * @param firstName The person's new first name.
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * Gets the person's last name.
     * @return The person's last name.
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * Sets the person's last name.
     * @param lastName The person's new last name.
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
}
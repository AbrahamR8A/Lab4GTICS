package com.pucp.lab4.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name="adoptions")
public class Adoption {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "adoption_id")
    private Integer adoptionId;

    @Column(name = "adopter_id")
    private Integer adopterId;

    @Column(name = "pet_id")
    private Integer petId;

    @Column(name = "adoption_date")
    private LocalDate adoptionDate;

    private String status;

    private String notes;

    public Integer getAdoptionId() {
        return adoptionId;
    }

    public void setAdoptionId(Integer adoptionId) {
        this.adoptionId = adoptionId;
    }

    public Integer getAdopterId() {
        return adopterId;
    }

    public void setAdopterId(Integer adopterId) {
        this.adopterId = adopterId;
    }

    public Integer getPetId() {
        return petId;
    }

    public void setPetId(Integer petId) {
        this.petId = petId;
    }

    public LocalDate getAdoptionDate() {
        return adoptionDate;
    }

    public void setAdoptionDate(LocalDate adoptionDate) {
        this.adoptionDate = adoptionDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}

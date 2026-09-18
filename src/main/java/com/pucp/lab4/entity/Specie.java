package com.pucp.lab4.entity;

import jakarta.persistence.*;

@Entity
@Table(name="species")
public class Specie {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "species_id")
    private Integer speciesId;

    @Column(name = "name")
    private String speciesName;

    private String description;

    public Integer getSpeciesId() {
        return speciesId;
    }

    public void setSpeciesId(Integer speciesId) {
        this.speciesId = speciesId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSpeciesName() {
        return speciesName;
    }

    public void setSpeciesName(String speciesName) {
        this.speciesName = speciesName;
    }
}

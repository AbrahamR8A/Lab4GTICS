package com.pucp.lab4.entity;


import jakarta.persistence.*;

@Entity
@Table(name="shelters")
public class Shelter {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "shellter_id")
    private Integer shellterId;

    @Column(name = "name")
    private String shelterName;

    private String address;

    private String city;

    private String phone;

    public Integer getShellterId() {
        return shellterId;
    }

    public void setShellterId(Integer shellterId) {
        this.shellterId = shellterId;
    }

    public String getShelterName() {
        return shelterName;
    }

    public void setShelterName(String shelterName) {
        this.shelterName = shelterName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}

package com.pucp.lab4.controller;

import com.pucp.lab4.entity.Pet;
import com.pucp.lab4.entity.Shelter;
import com.pucp.lab4.entity.Specie;
import com.pucp.lab4.repository.PetRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/pets")
public class PetController {
    private final PetRepository petRepository;

    public PetController(PetRepository petRepository) {
        this.petRepository = petRepository;
    }

    @GetMapping
    public String listarPets (Model model) {
        List<Pet> pets = petRepository.findAll();

        model.addAttribute("pets", pets);

        return "pets/list";
    }
}

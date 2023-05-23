package com.example.tungtt_ph27337_sof3021_assignment.controller;

import com.example.tungtt_ph27337_sof3021_assignment.entity.Staff;
import com.example.tungtt_ph27337_sof3021_assignment.repository.IStaffRepository;
import com.example.tungtt_ph27337_sof3021_assignment.request.UpdateRequest;
import com.example.tungtt_ph27337_sof3021_assignment.service.IStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping()
public class StaffController {

    @Autowired
    private IStaffService iStaffService;

    @Autowired
    private IStaffRepository iStaffRepository;

    @GetMapping("/listStaff")
    public String getAllStaff(Model model) {
        List<Staff> listStaff = iStaffRepository.findAll();
        model.addAttribute("listStaff", listStaff);
        return "staff";
    }

    @PostMapping("/add")
    public String addStaff(Model model, @ModelAttribute Staff request) {
        iStaffRepository.save(request);
        return "redirect:/listStaff";
    }

    @GetMapping("/delete/{id}")
    public String deleteStaff(@PathVariable(name = "id") Integer id) {
        iStaffRepository.deleteById(id);
        return "redirect:/listStaff";
    }

    @GetMapping("/detail/{id}")
    public String detailStaff(Model model ,@PathVariable(name = "id") Integer id) {
        Optional<Staff> staffOptional = iStaffRepository.findById(id);
        if (staffOptional.isEmpty()) {
            return "";
        }
        Staff staff = staffOptional.get();
        model.addAttribute("st", staff);
        List<Staff> listStaff = iStaffRepository.findAll();
        model.addAttribute("listStaff", listStaff);
        return "staff";
    }

    @PostMapping("/update/{id}")
    public String updateStaff(Model model, @PathVariable("id") Integer id,  @ModelAttribute UpdateRequest request) {
        request.setId(id);
        Staff staff = request.toEntity();
        iStaffRepository.save(staff);
        return "redirect:/listStaff";
    }
}

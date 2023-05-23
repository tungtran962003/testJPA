package com.example.tungtt_ph27337_sof3021_assignment.repository;

import com.example.tungtt_ph27337_sof3021_assignment.entity.Staff;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IStaffRepository extends JpaRepository<Staff, Integer> {

    List<Staff>findAll();

    //Staff save();
}

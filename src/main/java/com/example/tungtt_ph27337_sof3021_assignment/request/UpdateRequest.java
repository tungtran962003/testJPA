package com.example.tungtt_ph27337_sof3021_assignment.request;

import com.example.tungtt_ph27337_sof3021_assignment.entity.Staff;
import jakarta.persistence.Column;
import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;

@Data
@Builder
public class UpdateRequest {
    private Integer id;

    private String name;

    private Boolean gender;

    private String role;

    private String number;

    private BigDecimal wage;

    private String character;

    public Staff toEntity() {
        Staff staff = new Staff();
        staff.setId(id);
        staff.setName(name);
        staff.setGender(gender);
        staff.setRole(role);
        staff.setNumber(number);
        staff.setWage(wage);
        staff.setCharacter(character);
        return staff;
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class UserDetails extends User{
    private String email,phone,fullname,address;
    private Date dob;
    private boolean sex;
    private int roleId;

    public UserDetails() {
    }

    public UserDetails(String email, String phone, String fullname, String address, Date dob, boolean sex, int roleId) {
        this.email = email;
        this.phone = phone;
        this.fullname = fullname;
        this.address = address;
        this.dob = dob;
        this.sex = sex;
        this.roleId = roleId;
    }

    public UserDetails(String email, String phone, String fullname, String address, Date dob, boolean sex, int roleId, String username, String pass, int userId, boolean isAuthorized) {
        super(username, pass, userId, isAuthorized);
        this.email = email;
        this.phone = phone;
        this.fullname = fullname;
        this.address = address;
        this.dob = dob;
        this.sex = sex;
        this.roleId = roleId;
    }

    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
    
}

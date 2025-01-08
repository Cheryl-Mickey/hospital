package jmu.fxy.hospital.Entity;

import java.sql.Date;
import java.sql.Time;

public class Register {
    private int patient_id;
    private int doctor_id;
    private String doctor_name;
    private int department_id;
    private Date register_date;
    private Time register_time;
    private String register_status;

    public int getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(int patient_id) {
        this.patient_id = patient_id;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getDoctor_name() {
        return doctor_name;
    }

    public void setDoctor_name(String doctor_name) {
        this.doctor_name = doctor_name;
    }

    public int getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }

    public Date getRegister_date() {
        return register_date;
    }

    public void setRegister_date(Date register_date) {
        this.register_date = register_date;
    }

    public Time getRegister_time() {
        return register_time;
    }

    public void setRegister_time(Time register_time) {
        this.register_time = register_time;
    }

    public String getRegister_status() {
        return register_status;
    }

    public void setRegister_status(String register_status) {
        this.register_status = register_status;
    }
    public Register(){

    }
    public Register( int patient_id, int doctor_id, String doctor_name, int department_id,
                     Date register_date, Time register_time, String register_status){
        this.patient_id=patient_id;
        this.doctor_id=doctor_id;
        this.doctor_name=doctor_name;
        this.department_id=department_id;
        this.register_date=register_date;
        this.register_time=register_time;
        this.register_status=register_status;
    }
}

package jmu.fxy.hospital.Entity;

import java.sql.Timestamp;

public class Patient {
    private int patient_id;
    private String patient_name;
    private int patient_card;
    private Timestamp book_time;

    public int getPatient_id() {
        return patient_id;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public int getPatient_card() {
        return patient_card;
    }

    public Timestamp getBook_time() {
        return book_time;
    }

    public void setPatient_id(Integer patient_id) {
        this.patient_id = patient_id;
    }

    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
    }

    public void setPatient_card(Integer patient_card) {
        this.patient_card = patient_card;
    }

    public void setBook_time(Timestamp book_time) {
        this.book_time = book_time;
    }
    public Patient(){

    }
    public Patient(int patient_id, String patient_name, int patient_card, Timestamp book_time){
        this.patient_id=patient_id;
        this.patient_name=patient_name;
        this.patient_card=patient_card;
        this.book_time=book_time;
    }
}

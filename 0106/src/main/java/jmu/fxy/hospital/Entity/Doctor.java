package jmu.fxy.hospital.Entity;

public class Doctor {
    private int doctorId;
    private int departmentId;
    private String doctorName;
    private String doctorSex;
    private String doctorPicture;
    private String doctorSkill;

    // 生成对应的getter和setter方法
    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getDoctorSex() {
        return doctorSex;
    }

    public void setDoctorSex(String doctorSex) {
        this.doctorSex = doctorSex;
    }

    public String getDoctorPicture() {
        return doctorPicture;
    }

    public void setDoctorPicture(String doctorPicture) {
        this.doctorPicture = doctorPicture;
    }

    public String getDoctorSkill() {
        return doctorSkill;
    }

    public void setDoctorSkill(String doctorSkill) {
        this.doctorSkill = doctorSkill;
    }
    public Doctor(){

    }

    public Doctor(int doctorId,int departmentId,String doctorName, String doctorSex, String doctorPicture, String doctorSkill){
        this.doctorId=doctorId;
        this.departmentId=departmentId;
        this.doctorName=doctorName;
        this.doctorSex=doctorSex;
        this.doctorPicture=doctorPicture;
        this.doctorSkill=doctorSkill;
    }

}
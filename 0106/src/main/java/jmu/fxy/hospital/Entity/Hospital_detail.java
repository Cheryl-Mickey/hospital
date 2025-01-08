package jmu.fxy.hospital.Entity;

public class Hospital_detail {
    private int department_id;
    private String department;
    private String department_detail;

    public int getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getDepartment_detail() {
        return department_detail;
    }

    public void setDepartment_detail(String department_detail) {
        this.department_detail = department_detail;
    }
    public Hospital_detail(){

    }
    public Hospital_detail(int department_id, String department, String department_detail){
        this.department_id=department_id;
        this.department=department;
        this.department_detail=department_detail;
    }
}
package jmu.fxy.hospital.Service;

import jmu.fxy.hospital.Entity.Doctor;
import jmu.fxy.hospital.Entity.Hospital_detail;
import jmu.fxy.hospital.Entity.Register;

import java.util.List;

public interface UserService {
    //Doctor
    // 获取所有医生信息
    List<Doctor> getAllDoctors();
    // 根据医生ID获取医生信息
    Doctor getDoctorById(Integer doctorId);
    // 新增医生信息
    void addDoctor(Doctor doctor);
    // 修改医生信息
    void updateDoctor(Doctor doctor);
    // 删除医生信息
    void deleteDoctor(Integer doctorId);
    int getTotalDoctorCount();
    List<Doctor> getDoctorsByPage(int pageNum, int pageSize);


    //Register
    List<Register> getAllRegisters();
    Register getRegisterByPatientId(int patientId);
    void addRegister(Register register);
    void updateRegister(Register register);
    void updateRegisterStatus(Register register);
    void deleteRegister(int patientId,int doctorId);

    //Hospital_detail
    List<Hospital_detail> getAllHospitalDetails();
    Hospital_detail getHospitalDetailById(int departmentId);
    void addHospitalDetail(Hospital_detail hospitalDetail);
    void updateHospitalDetail(Hospital_detail hospitalDetail);
    void deleteHospitalDetail(int departmentId);
}

package jmu.fxy.hospital.Mapper;

import jmu.fxy.hospital.Entity.Doctor;
import jmu.fxy.hospital.Entity.Hospital_detail;
import jmu.fxy.hospital.Entity.Register;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    // 查询所有医生信息
    List<Doctor> findAllDoctors();
    // 根据医生ID查询医生信息
    Doctor findDoctorById(Integer doctorId);
    // 新增医生信息
    int insertDoctor(Doctor doctor);
    // 更新医生信息
    int updateDoctor(Doctor doctor);
    // 删除医生信息
    int deleteDoctorById(Integer doctorId);
    int countDoctors();
    List<Doctor> getDoctorsByPage(@Param("offset") int offset, @Param("limit") int limit);


    List<Register> findAllRegisters();
    Register findRegisterByPatientId(int patientId);
    void insertRegister(Register register);
    void updateRegister(Register register);
    void updateRegisterStatus(Register register);
    void deleteRegister(@Param("patient_id")int patientId,@Param("doctor_id")int doctorId);


    List<Hospital_detail> getAllHospitalDetails();
    Hospital_detail getHospitalDetailById(int departmentId);
    void addHospitalDetail(Hospital_detail hospitalDetail);
    void updateHospitalDetail(Hospital_detail hospitalDetail);
    void deleteHospitalDetail(int departmentId);

}

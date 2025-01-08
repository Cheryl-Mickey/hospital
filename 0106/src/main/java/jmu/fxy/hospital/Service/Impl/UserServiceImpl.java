package jmu.fxy.hospital.Service.Impl;
import com.github.pagehelper.Page;
import jmu.fxy.hospital.Entity.Doctor;
import jmu.fxy.hospital.Entity.Hospital_detail;
import jmu.fxy.hospital.Entity.Register;
import jmu.fxy.hospital.Mapper.UserMapper;
import jmu.fxy.hospital.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.awt.print.Pageable;
import java.util.List;

@Service("UserService")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<Doctor> getAllDoctors() {
        return userMapper.findAllDoctors();
    }

    @Override
    public Doctor getDoctorById(Integer doctorId) {
        return userMapper.findDoctorById(doctorId);
    }

    @Override
    public void addDoctor(Doctor doctor) {
        userMapper.insertDoctor(doctor);
    }

    @Override
    public void updateDoctor(Doctor doctor) {
        userMapper.updateDoctor(doctor);
    }

    @Override
    public void deleteDoctor(Integer doctorId) {
        userMapper.deleteDoctorById(doctorId);
    }

    @Override
    public int getTotalDoctorCount() {
        return userMapper.countDoctors();
    }

    @Override
    public List<Doctor> getDoctorsByPage(int pageNum, int pageSize) {
        int offset = (pageNum - 1) * pageSize;
        return userMapper.getDoctorsByPage(offset, pageSize);
    }

    @Override
    public List<Register> getAllRegisters() {
        return userMapper.findAllRegisters();
    }

    @Override
    public Register getRegisterByPatientId(int patientId) {
        return userMapper.findRegisterByPatientId(patientId);
    }

    @Override
    public void addRegister(Register register) {
        userMapper.insertRegister(register);
    }

    @Override
    public void updateRegister(Register register) {
        userMapper.updateRegister(register);
    }

    @Override
    public void updateRegisterStatus(Register register) {
        userMapper.updateRegisterStatus(register);
    }

    @Override
    public void deleteRegister(int patientId,int doctorId) {
        userMapper.deleteRegister(patientId,doctorId);
    }


    //Hospital_detail
    @Override
    public List<Hospital_detail> getAllHospitalDetails() {
        return userMapper.getAllHospitalDetails();
    }

    @Override
    public Hospital_detail getHospitalDetailById(int departmentId) {
        return userMapper.getHospitalDetailById(departmentId);
    }

    @Override
    public void addHospitalDetail(Hospital_detail hospitalDetail) {
        userMapper.addHospitalDetail(hospitalDetail);
    }

    @Override
    public void updateHospitalDetail(Hospital_detail hospitalDetail) {
        userMapper.updateHospitalDetail(hospitalDetail);
    }

    @Override
    public void deleteHospitalDetail(int departmentId) {
        userMapper.deleteHospitalDetail(departmentId);
    }

}

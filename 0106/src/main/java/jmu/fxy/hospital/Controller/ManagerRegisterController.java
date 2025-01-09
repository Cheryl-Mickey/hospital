package jmu.fxy.hospital.Controller;

import jmu.fxy.hospital.Entity.Register;
import jmu.fxy.hospital.Service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/edit-register")
public class ManagerRegisterController {
    private static final Logger logger = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private UserService userService;

    // 显示挂号信息列表
    @RequestMapping(value = {"", "/query"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String listRegisters(Model model) {
        try {
            List<Register> registers = userService.getAllRegisters();
            model.addAttribute("registers", registers);
        } catch (Exception e) {
            model.addAttribute("errorMessage", "获取挂号信息列表时出现错误，请稍后重试");
            return "error"; // 返回错误页面
        }
        return "edit-register";
    }

    // 处理新增挂号信息的请求
    @PostMapping("/add")
    public String addRegister(
            @RequestParam("patient_id") int patientId,
            @RequestParam("doctor_id") int doctorId,
            @RequestParam("doctor_name") String doctorName,
            @RequestParam("department_id") int departmentId,
            @RequestParam("register_date") String registerDate,
            @RequestParam("register_status") String registerStatus,
            Model model) {
        Register register = new Register();
        register.setPatient_id(patientId);
        register.setDoctor_id(doctorId);
        register.setDoctor_name(doctorName);
        register.setDepartment_id(departmentId);
        register.setRegister_date(java.sql.Date.valueOf(registerDate));
        register.setRegister_status(registerStatus);

        try {
            userService.addRegister(register);
            model.addAttribute("registers", userService.getAllRegisters());
        } catch (Exception e) {
            model.addAttribute("errorMessage", "新增挂号信息时出现错误，请稍后重试");
            return "error"; // 出现异常返回错误页面展示错误信息
        }
        return "edit-register";
    }

    // 处理编辑挂号信息的请求
    @PostMapping("/edit")
    public String editRegister(
            @RequestParam("patient_id") int patientId,
            @RequestParam("doctor_id") int doctorId,
            @RequestParam("doctor_name") String doctorName,
            @RequestParam("department_id") int departmentId,
            @RequestParam("register_date") String registerDate,
            @RequestParam("register_status") String registerStatus,
            Model model) {
        Register register = new Register();
        register.setPatient_id(patientId);
        register.setDoctor_id(doctorId);
        register.setDoctor_name(doctorName);
        register.setDepartment_id(departmentId);
        register.setRegister_date(java.sql.Date.valueOf(registerDate));
        register.setRegister_status(registerStatus);

        try {
            userService.updateRegister(register);
            model.addAttribute("registers", userService.getAllRegisters());
        } catch (Exception e) {
            model.addAttribute("errorMessage", "编辑挂号信息时出现错误，请稍后重试");
            return "error";
        }

        return "edit-register";
    }

    // 处理删除挂号信息的请求
    @PostMapping("/delete/{patient_id}/{doctor_id}")
    public String deleteRegister(@PathVariable("patient_id") int patientId, @PathVariable("doctor_id") int doctorId, Model model) {
        try {
            userService.deleteRegister(patientId, doctorId);
        } catch (Exception e) {
            model.addAttribute("errorMessage", "删除挂号信息时出现错误，请稍后重试");
            return "error";
        }
        return "edit-register";
    }

    @PostMapping("/update-status")
    public String updateRegisterStatus(
            @RequestParam("patientId") int patientId,
            @RequestParam("doctorId") int doctorId,
            @RequestParam("registerStatus") String registerStatus,
            Model model) {
        String[] validStatuses = {"已预约", "已就诊"};
        boolean isValidStatus = false;
        for (String validStatus : validStatuses) {
            if (validStatus.equals(registerStatus)) {
                isValidStatus = true;
                break;
            }
        }
        if (!isValidStatus) {
            model.addAttribute("errorMessage", "传入的挂号状态不合法，请选择正确的状态");
            return "error";
        }
        try {
            // 先查询出当前挂号记录的详情
            Register register = new Register();
            register.setPatient_id(patientId);
            register.setDoctor_id(doctorId);
            register.setRegister_status(registerStatus);
            userService.updateRegisterStatus(register);
            model.addAttribute("registers", userService.getAllRegisters());
        } catch (Exception e) {
            model.addAttribute("errorMessage", "更新挂号状态时出现错误，请稍后重试");
            return "error";
        }
        return "edit-register";
    }
}
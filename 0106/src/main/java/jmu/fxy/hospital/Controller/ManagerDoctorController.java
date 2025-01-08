package jmu.fxy.hospital.Controller;

import jmu.fxy.hospital.Entity.Doctor;
import jmu.fxy.hospital.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/edit-doctor")
public class ManagerDoctorController {
    @Autowired
    private UserService userService;

    // 显示医生信息列表
    @RequestMapping(value = {"","/query"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String listDoctors(@RequestParam(defaultValue = "1") int pageNum,Model model) {
        int pageSize = 3;  // 每页显示3条记录
        try {
            // 获取总记录数
            int totalCount = userService.getTotalDoctorCount();
            // 计算总页数
            int totalPages = (totalCount + pageSize - 1) / pageSize;
            // 根据页码和每页记录数获取当前页的医生信息列表
            List<Doctor> doctors = userService.getDoctorsByPage(pageNum, pageSize);
            model.addAttribute("doctors", doctors);
            model.addAttribute("pageNum", pageNum);
            model.addAttribute("pageSize", pageSize);
            model.addAttribute("totalPages", totalPages);
        } catch (Exception e) {
            model.addAttribute("errorMessage", "获取医生信息列表时出现错误，请稍后重试");
            return "error"; // 返回错误页面，假设名为error.jsp的错误提示页面，你可根据实际情况创建或调整
        }
        return "edit-doctor";
    }


    // 处理新增医生信息的请求
    @PostMapping("/add")
    public String addDoctor(
            @RequestParam("doctor_id") int doctorId,
            @RequestParam("department_id") int departmentId,
            @RequestParam("doctor_name") String doctorName,
            @RequestParam("doctor_sex") String doctorSex,
            @RequestParam("doctor_picture") String doctorPicture,
            @RequestParam("doctor_skill") String doctorSkill,
            Model model) {
        Doctor doctor = new Doctor();
        doctor.setDoctorId(doctorId);
        doctor.setDepartmentId(departmentId);
        doctor.setDoctorName(doctorName);
        doctor.setDoctorSex(doctorSex);
        doctor.setDoctorPicture(doctorPicture);
        doctor.setDoctorSkill(doctorSkill);

        try {
            userService.addDoctor(doctor);
        } catch (Exception e) {
            model.addAttribute("errorMessage", "新增医生信息时出现错误，请稍后重试");
            return "error"; // 出现异常返回错误页面展示错误信息
        }
        return "redirect:/edit-doctor";
    }


    // 处理编辑医生信息的请求
    @PostMapping("/edit")
    public String editDoctor(
            @RequestParam("doctor_id") int doctorId,
            @RequestParam("department_id") int departmentId,
            @RequestParam("doctor_name") String doctorName,
            @RequestParam("doctor_sex") String doctorSex,
            @RequestParam("doctor_picture") String doctorPicture,
            @RequestParam("doctor_skill") String doctorSkill,
            Model model) {
        try {
            Doctor originalDoctor =userService.getDoctorById(doctorId);
            if (originalDoctor!= null) {
                // 更新相应属性值，只更新表单中修改了的部分，保留其他原有属性值
                originalDoctor.setDepartmentId(departmentId);
                originalDoctor.setDoctorName(doctorName);
                originalDoctor.setDoctorSex(doctorSex);
                originalDoctor.setDoctorPicture(doctorPicture);
                originalDoctor.setDoctorSkill(doctorSkill);

                userService.updateDoctor(originalDoctor);
                model.addAttribute("doctors", userService.getAllDoctors());
            } else {
                model.addAttribute("errorMessage", "未找到对应医生ID的记录，无法进行编辑操作，请稍后重试");
                return "error";
            }
        } catch (Exception e) {
            model.addAttribute("errorMessage", "编辑医生信息时出现错误，请稍后重试");
            return "error";
        }

        return "redirect:/edit-doctor";
    }

    // 处理删除医生信息的请求
    @PostMapping("/delete/{doctorId}")
    public String deleteDoctor(@PathVariable("doctorId") int doctorId, Model model) {
        try {
            userService.deleteDoctor(doctorId);
            model.addAttribute("doctors", userService.getAllDoctors());
        } catch (Exception e) {
            model.addAttribute("errorMessage", "删除医生信息时出现错误，请稍后重试");
            return "error";
        }
        return "redirect:/edit-doctor";
    }

    // 处理编辑医生信息页面的请求，根据医生ID查询并展示信息到EditDoctorDetail.jsp页面
    @GetMapping("/edit-detail")
    public String editDoctorDetailPage(@RequestParam("doctorId") int doctorId, Model model) {
        try {
            Doctor doctor = userService.getDoctorById(doctorId);
            model.addAttribute("doctor", doctor);
        } catch (Exception e) {
            model.addAttribute("errorMessage", "获取医生信息用于编辑时出现错误，请稍后重试");
            return "error";
        }
        return "EditDoctorDetail";
    }
}
package jmu.fxy.hospital.Controller;

import jmu.fxy.hospital.Entity.Hospital_detail;
import jmu.fxy.hospital.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/edit-department")
public class ManagerDepartmentController {
    @Autowired
    private UserService userService;
    // 显示科室信息列表
    @RequestMapping(value = {"", "/query"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String listHospitalDetails(Model model) {
        try {
            List<Hospital_detail> hospitalDetails = userService.getAllHospitalDetails();
            model.addAttribute("hospitalDetails", hospitalDetails);
            return "edit-department";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "获取科室信息列表时出现错误，请稍后重试");
            return "error";
        }
    }
    // 处理新增科室信息的请求
    @PostMapping("/add")
    public String addHospitalDetail(
            @RequestParam("department_id") Integer departmentId,
            @RequestParam("department") String department,
            @RequestParam("department_detail") String departmentDetail,
            Model model) {
        Hospital_detail hospitalDetail = new Hospital_detail();
        hospitalDetail.setDepartment_id(departmentId);
        hospitalDetail.setDepartment(department);
        hospitalDetail.setDepartment_detail(departmentDetail);

        try {
            userService.addHospitalDetail(hospitalDetail);
            return "redirect:/edit-department";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "新增科室信息时出现错误，请稍后重试");
            return "error";
        }
    }

    // 处理编辑科室信息的请求
    @PostMapping("/edit")
    public String editHospitalDetail(
            @RequestParam("department_id") Integer departmentId,
            @RequestParam("department") String department,
            @RequestParam("department_detail") String departmentDetail,
            Model model) {
        try {
            Hospital_detail originalHospitalDetail = userService.getHospitalDetailById(departmentId);
            if (originalHospitalDetail!= null) {
                // 更新相应属性值
                originalHospitalDetail.setDepartment(department);
                originalHospitalDetail.setDepartment_detail(departmentDetail);

                userService.updateHospitalDetail(originalHospitalDetail);
                return "redirect:/edit-department";
            } else {
                model.addAttribute("errorMessage", "未找到对应科室ID的记录，无法进行编辑操作，请稍后重试");
                return "error";
            }
        } catch (Exception e) {
            model.addAttribute("errorMessage", "编辑科室信息时出现错误，请稍后重试");
            return "error";
        }
    }

    // 处理删除科室信息的请求
    @PostMapping("/delete/{department_id}")
    public String deleteHospitalDetail(@PathVariable("department_id") Integer departmentId, Model model) {
        try {
            userService.deleteHospitalDetail(departmentId);
            return "redirect:/edit-department";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "删除科室信息时出现错误，请稍后重试");
            return "error";
        }
    }

    // 处理编辑科室信息页面的请求，根据科室ID查询并展示信息到相应编辑页面（假设为EditHospitalDetail.jsp）
    @GetMapping("/edit-detail")
    public String editHospitalDetailPage(@RequestParam("department_id") Integer departmentId, Model model) {
        try {
            Hospital_detail hospitalDetail = userService.getHospitalDetailById(departmentId);
            model.addAttribute("hospitalDetail", hospitalDetail);
            return "EditHospitalDetail";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "获取科室信息用于编辑时出现错误，请稍后重试");
            return "error";
        }
    }
}

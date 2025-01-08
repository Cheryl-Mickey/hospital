package jmu.fxy.hospital.login;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/welcome")
public class LoginController {

    // 在类中定义日志记录器
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public String processLogin(@RequestParam("username") String username, @RequestParam("password") String password, Model model) {
        logger.info("收到登录请求，用户名：{}，密码：{}", username, password);
        // 预设的用户名和密码
        String username_hp = "root";
        String password_hp = "123456";

        if (username_hp.equals(username) && password_hp.equals(password)) {
            // 用户名和密码都匹配，重定向到admin.jsp对应的视图
            return "admin";
        } else {
            // 登录失败，设置错误消息
            model.addAttribute("errorMessage", "用户名或密码错误，请重新登录");
            // 返回登录页面视图,视图解析器能正确解析"login"为登录页面
            return "login";
        }
    }
}


package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.pojo.Userdb;
import com.example.servcie.UserService;


@Controller
@RequestMapping("/user")//请求路径前缀
public class UserController {
    //注入UserService
    @Autowired
    private UserService userService;

    @RequestMapping("/index.do")
    public String index() {
        return "user/index";
    }

    //查询所有用户（请求路径：/user/findAll.do）
    @RequestMapping("/findAll.do")
    public String findAll(Model model) {

        // 调试1: 检查Model里有没有message
        System.out.println("Model contains 'message': " + model.containsAttribute("message"));
        if (model.containsAttribute("message")) {
            System.out.println("Message content: " + model.asMap().get("message"));
        }

        //调用Service方法获取所有用户
        List<Userdb> userdbList = userService.findAll();
        //将用户列表放入Model<传递给JSP页面>
        model.addAttribute("userdbList",userdbList);
        //跳转到JSP页面</WEB-INF/views/user/list.jsp>
        return "user/list";
    }

    //根据ID查询用户<请求路径：/user/findById.do?id=1>
    @RequestMapping("/findById.do")
    public String fingById(Integer id, Model model) {
        //调用Service方法获取用户
        Userdb userdb = userService.findById(id);
        //将用户对象放入Model
        model.addAttribute("userdb", userdb);
        //跳转到JSp页面(/WBE-INF/views/user/detail.jsp)
        return "user/detail";
    }

    //根据用户ID更新用户信息
    @RequestMapping("/edit.do")
    public String updateById(Integer id, Model model) {
        Userdb userdb = userService.findById(id);
        model.addAttribute("userdb", userdb);
        return "user/edit";
    }
    @RequestMapping("/update.do")
    public String updateUser(Userdb userdb, RedirectAttributes redirectAttributes) {
        userService.updateById(userdb);
        redirectAttributes.addFlashAttribute("message", "更新成功！");
        return "redirect:/user/findAll.do";
    }

    //根据用户ID删除用户信息
    @RequestMapping("/delete.do")
    public String deleteById(Integer id, RedirectAttributes redirectAttributes) {
        userService.deleteById(id);
        // 添加一个临时性的提示信息，这个信息会在重定向后的页面显示一次
        redirectAttributes.addFlashAttribute("message", "用户删除成功！");
        return "redirect:/user/findAll.do";
    }

    //添加用户
    @RequestMapping("/add.do")
    public String add() {
        return "user/add";
    }


    @RequestMapping("/insert.do")
    public String adduser(Userdb userdb, RedirectAttributes redirectAttributes) {
        userService.add(userdb);
        redirectAttributes.addFlashAttribute("message", "添加成功！");
        return "redirect:/user/findAll.do";
    }

}

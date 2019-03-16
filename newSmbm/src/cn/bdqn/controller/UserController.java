package cn.bdqn.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.entity.User;
import cn.bdqn.service.UserService;
import cn.bdqn.util.UserParams;

@Controller
public class UserController {
	@Autowired
	@Qualifier("userService")
	private UserService userService;

	// 登录验证
	@RequestMapping("login.html")
	public String doLogin(String userCode, String userPassword, Model model,
			HttpSession session) {
		User user = userService.findUserbyId(userCode);
		if (user != null) {
			if (user.getUserPassword().equals(userPassword)) {
				session.setAttribute("user", user);
				return "jsp/frame";
			} else {
				model.addAttribute("msg", "密码错误");
				return "login";
			}
		} else {
			model.addAttribute("msg", "用户名错误");
			return "login";
		}

	}

	// 处理运行时的异常的页面跳转
	@ExceptionHandler(value = { RuntimeException.class })
	public String catchException() {
		return "error";
	}

	@RequestMapping("userlist.html")
	public String userList(UserParams params, Model model) {
		try {
			// 处理get请求的乱码问题
			if (params.getUserName() != null) {
				params.setUserName(new String(params.getUserName().getBytes(
						"ISO8859-1"), "utf-8"));
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 调用方法，初始化params;
		userService.findUserByPage(params);
		model.addAttribute("params", params);
		return "jsp/userlist";
	}

	@RequestMapping("loginOut.html")
	public String loginOut(HttpSession session) {
		session.removeAttribute("user");
		return "jsp/frame";
	}

	// 增加用户的页面
	@RequestMapping("useradd.html")
	public String adduser(Model model) {
		return "jsp/useradd";
	}

	// 提交增加用户的信息
	@RequestMapping("userLogin.html")
	public String userLogin(@Valid User user, BindingResult result,
			String ruserPassword, Model model) {
		if (result.hasErrors()) {
			List<FieldError> list = result.getFieldErrors();
			for (FieldError f : list) {
				model.addAttribute("error_" + f.getField(),
						f.getDefaultMessage());
			}

			return "jsp/useradd";
		}
		if (!(user.getUserPassword().equals(ruserPassword))) {
			model.addAttribute("msg", "两次输入的密码不一致！");
			return "jsp/useradd";
		}
		// 设置创建对象
		user.setCreatedBy(1);
		user.setCreationDate(new Date());
		userService.addUser(user);
		return "redirect:userlist.html";
	}

	@RequestMapping(value = "userview/{id}")
	public String userView(@PathVariable Integer id, Model model) {
		User user = userService.findUserById(id);
		model.addAttribute("user", user);
		return "jsp/userview";

	}

	@RequestMapping(value = "usermodify/{id}")
	public String userModify(@PathVariable Integer id, Model model) {
		User user = userService.findUserById(id);
		model.addAttribute("user", user);
		return "jsp/usermodify";
	}

	// 由于用户角色的显示，所以不能指定get和post的方法RequestMethod.GET
	@RequestMapping(value = "userUpdate.html")
	public String userUpdate(User user) {
		Date date = new Date();
		user.setModifyDate(date);
		userService.updateUser(user);
		return "redirect:userlist.html";
	}

	@RequestMapping("userDel.html")
	@ResponseBody
	public String userDel(Integer id) {
		int result = userService.delUser(id);
		if (result > 0) {
			return "success";
		}
		return "false";
	}

	@RequestMapping("exitSystem.html")
	public String exitSystem(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:login.html";

	}

	@RequestMapping("pwdmodify.html")
	public String pwdmodify() {
		return "jsp/pwdmodify";
	}

	@RequestMapping("pwdResult.html")
	public String pwdResult(String newpassword, HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		User temp = userService.findUserById(user.getId());
		temp.setUserPassword(newpassword);
		int result = userService.updatePassword(user);
		if (result > 0) {
			model.addAttribute("msg", "密码修改成功！");
			return "jsp/pwdmodify";
		} else {
			model.addAttribute("msg", "密码修改失败！");
			return "jsp/pwdmodify";
		}
	}

	@RequestMapping("checkold.html")
	@ResponseBody
	public Object checkold(String oldpassword, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user.getUserPassword().equals(oldpassword)) {
			return "1";
		} else {
			return "0";
		}

	}
}

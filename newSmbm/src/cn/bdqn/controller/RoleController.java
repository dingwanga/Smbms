package cn.bdqn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.service.RoleService;

@Controller
public class RoleController {
	@Autowired
	@Qualifier("roleService")
	private RoleService roleService;

	@RequestMapping(value = "roles", method = RequestMethod.GET)
	@ResponseBody
	// ajax处理需要的注解方式
	public Object findAll() {
		return roleService.findAll();
	}

}

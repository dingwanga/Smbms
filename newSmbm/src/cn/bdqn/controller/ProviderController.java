package cn.bdqn.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.entity.Provider;
import cn.bdqn.service.ProviderService;
import cn.bdqn.util.ProviderParams;

@Controller
public class ProviderController {

	@Autowired
	@Qualifier("providerService")
	private ProviderService providerService;

	@RequestMapping("providerlist.html")
	public String providerList(ProviderParams params, Model model) {
		try {
			if (params.getProCode() != null) {
				params.setProCode(new String(params.getProCode().getBytes(
						"ISO8859-1"), "utf-8"));
			}
			if (params.getProName() != null) {
				params.setProName(new String(params.getProName().getBytes(
						"ISO8859-1"), "utf-8"));
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		providerService.findProviderByPage(params);
		model.addAttribute("params", params);
		return "jsp/providerlist";
	}

	@RequestMapping("providerview/{id}")
	public String providerview(@PathVariable Integer id, Model model) {
		Provider provider = providerService.findProviderById(id);
		model.addAttribute("provider", provider);
		return "jsp/providerview";
	}

	@RequestMapping("providermodify/{id}")
	public String providermodify(@PathVariable Integer id, Model model) {
		Provider provider = providerService.findProviderById(id);
		model.addAttribute("provider", provider);
		return "jsp/providermodify";
	}

	// 跳转到增加页面
	@RequestMapping("provideradd.html")
	public String provideradd() {
		return "jsp/provideradd";
	}

	@RequestMapping("providerForm.html")
	public String providerForm(Provider provider) {
		provider.setCreationDate(new Date());
		int result = providerService.addProvider(provider);
		if (result > 0) {
			return "redirect:providerlist.html";
		} else {
			return "jsp/provideradd";
		}

	}

	@RequestMapping("check.html")
	@ResponseBody
	public Object check(String pro) {

		try {
			pro = new String(pro.getBytes("ISO8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Provider provider = providerService.findProviderbyCode(pro);
		System.out.println(provider);
		if (provider == null) {
			return "success";
		} else {
			return "false";
		}

	}

	@RequestMapping("proModify.html")
	public String proModify(Provider provider) {
		provider.setModifyDate(new Date());
		int result = providerService.updateProvider(provider);
		if (result > 0) {
			return "redirect:providerlist.html";
		} else {
			return "jsp/providermodify";
		}

	}

	@RequestMapping("providerDel.html")
	@ResponseBody
	public String providerDel(Integer id) {
		int result = providerService.delProvider(id);
		if (result > 0) {
			return "success";
		}
		return "false";
	}

	@RequestMapping("providers")
	@ResponseBody
	public Object findAll() {
		return providerService.findAll();
	}
}

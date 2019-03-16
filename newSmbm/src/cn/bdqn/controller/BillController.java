package cn.bdqn.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.bdqn.entity.Bill;
import cn.bdqn.entity.User;
import cn.bdqn.service.BillService;
import cn.bdqn.util.BillParams;

@Controller
public class BillController {
	@Autowired
	@Qualifier("billService")
	private BillService billService;

	@RequestMapping("billlist.html")
	public String billList(BillParams params, Model model) {
		try {
			// 处理get请求的乱码问题
			if (params.getProductName() != null) {
				params.setProductName(new String(params.getProductName()
						.getBytes("ISO8859-1"), "utf-8"));
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		billService.findBillByPage(params);
		model.addAttribute("params", params);
		return "jsp/billlist";

	}

	@RequestMapping("billadd.html")
	public String billAdd() {
		return "jsp/billadd";
	}

	// 提交添加信息表
	@RequestMapping("billForm.html")
	public String billForm(Bill bill, HttpSession session) {
		User user = (User) session.getAttribute("user");
		bill.setCreatedBy(user.getId());
		bill.setCreationDate(new Date());
		int result = billService.addBill(bill);
		if (result > 0) {
			return "redirect:billlist.html";
		} else {
			return "jsp/billadd";
		}
	}

	// 验证订单是否存在
	@RequestMapping("checkCode.html")
	@ResponseBody
	public Object check(String code) {
		try {
			code = new String(code.getBytes("ISO8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Bill bill = billService.findByCode(code);
		if (bill == null) {
			return "success";
		} else {
			return "false";
		}

	}

	@RequestMapping("billview.html")
	public String billview(Integer id, Model model) {
		Bill bill = billService.findById(id);
		model.addAttribute("bill", bill);
		return "jsp/billview";
	}
	
	@RequestMapping("billmodify.html")
	public String billmodify(Integer id,Model model){
		Bill bill = billService.findById(id);
		model.addAttribute("bill", bill);
		return "jsp/billmodify";
	}
	
	@RequestMapping("billUpdate.html")
	public String billUpdate(Bill bill, HttpSession session){
		User user = (User) session.getAttribute("user");
		bill.setModifyBy(user.getId());
		bill.setModifyDate(new Date());
		int result=billService.updateBill(bill);
		if(result>0){
			return "redirect:billlist.html";
		}else{
			return "jsp/billmodify";
		}
	}
	@RequestMapping("billDel.html")
	@ResponseBody
	public String userDel(Integer id) {
		int result=billService.delBill(id);
		if(result>0){
			return "success";
		}
		return "false";
	}
}

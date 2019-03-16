package cn.bdqn.service;

import cn.bdqn.entity.Bill;
import cn.bdqn.util.BillParams;



public interface BillService {

	void findBillByPage(BillParams params);
	
	int addBill(Bill bill);
	
	Bill findByCode(String billCode);
	
	Bill findById(Integer id);
	
	int updateBill(Bill bill);
	
	int delBill(Integer id);
	
}

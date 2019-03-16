package cn.bdqn.dao;

import java.util.List;

import cn.bdqn.entity.Bill;
import cn.bdqn.util.BillParams;

public interface BillDao {
	// 分页模糊查询
	List<Bill> findBillByPage(BillParams params);

	// 模糊查询总记录数
	int findTotalCont(BillParams params);

	// 增加订单表
	int addBill(Bill bill);

	// 根据编号查询订单
	Bill findByCode(String billCode);

	// 根据id查询
	Bill findById(Integer id);
	//修改订单内容
	int updateBill(Bill bill);
	
	int delBill(Integer id);
}

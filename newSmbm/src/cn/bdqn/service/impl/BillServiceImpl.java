package cn.bdqn.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import cn.bdqn.dao.BillDao;
import cn.bdqn.entity.Bill;
import cn.bdqn.service.BillService;
import cn.bdqn.util.BillParams;

@Service("billService")
public class BillServiceImpl implements BillService {
	@Autowired
	@Qualifier("billDao")
	private BillDao billdao;

	@Override
	public void findBillByPage(BillParams params) {
		// 查询总记录数
		int count = billdao.findTotalCont(params);
		// 设置总记录数
		params.setCount(count);
		// 设置总页数
		params.setPageCount((count % params.getPageSize() == 0) ? (count / params
				.getPageSize()) : (count / params.getPageSize() + 1));
		
		if (params.getPageNo() > params.getPageCount()) {
			params.setPageNo(params.getPageCount());
		}
		if (params.getPageNo() < 1) {
			params.setPageNo(1);
		}
		// 设置要显示的分页信息
		params.setList(billdao.findBillByPage(params));
	}

	@Override
	public int addBill(Bill bill) {
		
		return billdao.addBill(bill);
	}

	@Override
	public Bill findByCode(String billCode) {
		return billdao.findByCode(billCode);
	}

	@Override
	public Bill findById(Integer id) {
		return billdao.findById(id);
	}

	@Override
	public int updateBill(Bill bill) {
		return billdao.updateBill(bill);
	}

	@Override
	public int delBill(Integer id) {
		return billdao.delBill(id);
	}

}

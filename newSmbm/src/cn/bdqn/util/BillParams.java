package cn.bdqn.util;

import java.util.List;

import cn.bdqn.entity.Bill;



public class BillParams {

	private Integer pageNo = 1;// 显示当前页数
	private Integer pageSize = 3;// 每页显示的数目
	private String productName;// 模糊查询商品名称
	private Integer providerId=0;// 根据供应商进行查询
	private Integer isPayment=0;//根据是否付款进行查询
	private Integer from;// mysql第一个分页参数
	private Integer offset;// mysql第二个分页参数
	private Integer count;// 总记录数
	private Integer pageCount;// 总页数
	private List<Bill> list;
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getProviderId() {
		return providerId;
	}
	public void setProviderId(Integer providerId) {
		this.providerId = providerId;
	}
	public Integer getIsPayment() {
		return isPayment;
	}
	public void setIsPayment(Integer isPayment) {
		this.isPayment = isPayment;
	}
	public Integer getFrom() {
		from = (pageNo - 1) * pageSize;
		return from;
	}
	public void setFrom(Integer from) {
		this.from = from;
	}
	public Integer getOffset() {
		offset = pageSize;
		return offset;
	}
	public void setOffset(Integer offset) {
		this.offset = offset;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getPageCount() {
		return pageCount;
	}
	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
	public List<Bill> getList() {
		return list;
	}
	public void setList(List<Bill> list) {
		this.list = list;
	}
	
}

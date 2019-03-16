package cn.bdqn.util;

import java.util.List;

import cn.bdqn.entity.Provider;

public class ProviderParams {

	private Integer pageNo = 1;// 显示当前页数
	private Integer pageSize = 3;// 每页显示的数目
	private String proCode;// 模糊查询用户名
	private String proName;// 用户角色
	private Integer from;// mysql第一个分页参数
	private Integer offset;// mysql第二个分页参数
	private Integer count;// 总记录数
	private Integer pageCount;// 总页数
	private List<Provider> list;

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

	public String getProCode() {
		return proCode;
	}

	public void setProCode(String proCode) {
		this.proCode = proCode;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
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

	public List<Provider> getList() {
		return list;
	}

	public void setList(List<Provider> list) {
		this.list = list;
	}

}

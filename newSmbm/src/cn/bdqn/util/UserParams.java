package cn.bdqn.util;

import java.util.List;

import cn.bdqn.entity.User;

public class UserParams {

	private Integer pageNo = 1;// 显示当前页数
	private Integer pageSize = 5;// 每页显示的数目
	private String userName;// 模糊查询用户名
	private Integer userRole = 0;// 用户角色
	private Integer from;// mysql第一个分页参数
	private Integer offset;// mysql第二个分页参数
	private Integer count;// 总记录数
	private Integer pageCount;// 总页数
	private List<User> list;

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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getUserRole() {
		return userRole;
	}

	public void setUserRole(Integer userRole) {
		this.userRole = userRole;
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

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

}

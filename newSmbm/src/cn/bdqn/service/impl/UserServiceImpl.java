package cn.bdqn.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import cn.bdqn.dao.UserDao;
import cn.bdqn.entity.User;
import cn.bdqn.service.UserService;
import cn.bdqn.util.UserParams;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	@Qualifier("userDao")
	private UserDao userdao;

	@Override
	public User findUserbyId(String userCode) {
		return userdao.findUserbyId(userCode);
	}

	@Override
	public void findUserByPage(UserParams params) {
		int count = userdao.findTotalCount(params);
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
		// 设置分页所要查询的集合数
		params.setList(userdao.findUserByPage(params));
	}

	@Override
	public int addUser(User user) {

		return userdao.addUser(user);
	}

	@Override
	public User findUserById(Integer id) {

		return userdao.findUserById(id);
	}

	@Override
	public int updateUser(User user) {
		
		return userdao.updateUser(user);
	}

	@Override
	public int delUser(Integer id) {
		// TODO Auto-generated method stub
		return userdao.delUser(id);
	}

	@Override
	public int updatePassword(User user) {
		
		return userdao.updatePassword(user);
	}
}

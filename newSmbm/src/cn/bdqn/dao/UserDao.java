package cn.bdqn.dao;

import java.util.List;

import cn.bdqn.entity.User;
import cn.bdqn.util.UserParams;

public interface UserDao {
	// 根据编号查询用户信息
	User findUserbyId(String userCode);

	// 分页模糊查询
	List<User> findUserByPage(UserParams params);

	// 查询总记录数
	int findTotalCount(UserParams params);

	// 添加用户信息
	int addUser(User user);

	// 根据id查询用户信息
	User findUserById(Integer id);

	// 根据id修改用户信息
	int updateUser(User user);

	// 根据id删除用户信息
	int delUser(Integer id);

	// 修改用户密码
	int updatePassword(User user);
}

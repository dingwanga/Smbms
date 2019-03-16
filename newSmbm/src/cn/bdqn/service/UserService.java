package cn.bdqn.service;

import cn.bdqn.entity.User;
import cn.bdqn.util.UserParams;

public interface UserService {
	User findUserbyId(String userCode);

	void findUserByPage(UserParams params);

	int addUser(User user);
	
	User findUserById(Integer id);
	
	int updateUser(User user);
	
	int delUser(Integer id);
	
	int updatePassword(User user);
}

package cn.bdqn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import cn.bdqn.dao.RoleDao;
import cn.bdqn.entity.Role;
import cn.bdqn.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Autowired
	@Qualifier("roleDao")
	private RoleDao roleDao;

	@Override
	public List<Role> findAll() {

		return roleDao.findAll();
	}

}

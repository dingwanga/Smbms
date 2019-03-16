package cn.bdqn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import cn.bdqn.dao.ProviderDao;
import cn.bdqn.entity.Provider;
import cn.bdqn.service.ProviderService;
import cn.bdqn.util.ProviderParams;

@Service("providerService")
public class ProviderServiceImpl implements ProviderService {
	@Autowired
	@Qualifier("providerDao")
	private ProviderDao providerDao;

	@Override
	public void findProviderByPage(ProviderParams params) {
		// 查询总记录数
		int count = providerDao.findTotalCount(params);
		// 设置总记录数
		params.setCount(count);
		//设置总页数
		params.setPageCount((count % params.getPageSize() == 0) ? (count / params
				.getPageSize()) : (count / params.getPageSize() + 1));
		
		if (params.getPageNo() > params.getPageCount()) {
			params.setPageNo(params.getPageCount());
		}
		if (params.getPageNo() < 1) {
			params.setPageNo(1);
		}
		//设置要显示的分页信息
		params.setList(providerDao.findProviderBypage(params));
	}

	@Override
	public Provider findProviderById(Integer id) {
		
		return providerDao.findProviderById(id);
	}

	@Override
	public int addProvider(Provider provider) {
		
		return providerDao.addProvider(provider);
	}

	@Override
	public Provider findProviderbyCode(String proCode) {
		// TODO Auto-generated method stub
		return providerDao.findProviderbyCode(proCode);
	}

	@Override
	public int updateProvider(Provider provider) {
		// TODO Auto-generated method stub
		return providerDao.updateProvider(provider);
	}

	@Override
	public int delProvider(Integer id) {
		// TODO Auto-generated method stub
		return providerDao.delProvider(id);
	}

	@Override
	public List<Provider> findAll() {
		// TODO Auto-generated method stub
		return providerDao.findAll();
	}

	
}

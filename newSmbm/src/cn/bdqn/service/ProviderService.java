package cn.bdqn.service;

import java.util.List;

import cn.bdqn.entity.Provider;
import cn.bdqn.util.ProviderParams;



public interface ProviderService {

	void findProviderByPage (ProviderParams params);
	
	Provider findProviderById(Integer id);
	
	int addProvider(Provider provider);
	
	Provider findProviderbyCode(String proCode);
	
	int updateProvider(Provider provider);
	
	int delProvider(Integer id);
	
	List<Provider> findAll();
}

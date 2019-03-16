package cn.bdqn.dao;

import java.util.List;

import cn.bdqn.entity.Provider;
import cn.bdqn.util.ProviderParams;

public interface ProviderDao {

	List<Provider> findProviderBypage(ProviderParams params);

	int findTotalCount(ProviderParams params);

	// 根据id查询供应商信息
	Provider findProviderById(Integer id);

	// 更新供应商信息
	int updateProvider(Provider provider);

	// 增加供应商
	int addProvider(Provider provider);

	//根据编号查询供应商
	Provider findProviderbyCode(String proCode);
	
	//根据id删除商品信息
	int delProvider(Integer id);
	
	//查询所有
	List<Provider> findAll();
}

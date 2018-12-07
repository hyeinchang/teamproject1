package com.tumbler.manager.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tumbler.common.page.Criteria;
import com.tumbler.manager.product.dao.ManagerProductDAO;
import com.tumbler.manager.product.vo.ManagerProductVO;

@Service
public class ManagerProductServiceImpl implements ManagerProductService {
	@Autowired
	ManagerProductDAO productDao;

	@Override
	public List<ManagerProductVO> managerProductList(Criteria cri) {
		// TODO Auto-generated method stub
		List<ManagerProductVO> productList = null;
		productList = productDao.managerProductList(cri);
		return productList;
	}

	@Override
	public int mGetTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		int total = productDao.mGetTotalCount(cri);
		return total;
	}

	@Override
	public List<ManagerProductVO> mSearchProductList(Criteria cri) {
		// TODO Auto-generated method stub
		List<ManagerProductVO> searchedList = null;
		searchedList = productDao.mSearchProductList(cri);
		return searchedList;
	}

	@Override
	public int mGetSearchTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		int total = productDao.mGetSearchTotalCount(cri);
		return total;
	}

}

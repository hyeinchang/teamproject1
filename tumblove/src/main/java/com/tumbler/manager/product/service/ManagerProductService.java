package com.tumbler.manager.product.service;

import java.util.List;

import com.tumbler.common.page.Criteria;
import com.tumbler.manager.product.vo.ManagerProductVO;

public interface ManagerProductService {
	public List<ManagerProductVO> managerProductList(Criteria cri);
	public int mGetTotalCount(Criteria cri);
	public List<ManagerProductVO> mSearchProductList(Criteria cri);
	public int mGetSearchTotalCount(Criteria cri);
}

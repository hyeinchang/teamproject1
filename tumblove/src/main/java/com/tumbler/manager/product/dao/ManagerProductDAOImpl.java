package com.tumbler.manager.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.common.page.Criteria;
import com.tumbler.manager.product.vo.ManagerProductVO;

@Repository
public class ManagerProductDAOImpl implements ManagerProductDAO {
	@Autowired
	SqlSession session;

	@Override
	public List<ManagerProductVO> managerProductList(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("managerProductList", cri);
	}

	@Override
	public int mGetTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("mGetTotalCount", cri);
	}

	@Override
	public List<ManagerProductVO> mSearchProductList(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("mSearchProductList", cri);
	}

	@Override
	public int mGetSearchTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("mGetSearchTotalCount", cri);
	}
}

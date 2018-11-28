package com.spring.client.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.board.vo.BoardVO;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<BoardVO> boardList(BoardVO bvo) {
		// TODO Auto-generated method stub
		return session.selectList("boardList", bvo);
	}

	@Override
	public int boardInsert(BoardVO bvo) {
		// TODO Auto-generated method stub
		return session.insert("boardInsert", bvo);
	}

	@Override
	public BoardVO boardDetail(BoardVO bvo) {
		// TODO Auto-generated method stub
		return (BoardVO) session.selectOne("boardDetail", bvo);
	}

	@Override
	public int pwdConfirm(BoardVO bvo) {
		// TODO Auto-generated method stub
		return (Integer) session.selectOne("pwdConfirm", bvo);
	}

	@Override
	public int boardUpdate(BoardVO bvo) {
		// TODO Auto-generated method stub
		return session.update("boardUpdate",bvo);
	}

	@Override
	public int boardDelete(int b_num) {
		// TODO Auto-generated method stub
		return session.delete("boardDelete", b_num);
	}

	@Override
	public int boardListCnt(BoardVO bvo) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("boardListCnt");
	}

}

package com.spring.client.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.client.board.dao.BoardDao;
import com.spring.client.board.reply.dao.ReplyDao;
import com.spring.client.board.vo.BoardVO;
import com.spring.client.reply.vo.ReplyVO;

import lombok.extern.java.Log;

@Service
@Transactional
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private ReplyDao replyDao;

	@Override
	public List<BoardVO> boardList(BoardVO bvo) {
		// TODO Auto-generated method stub
		List<BoardVO> myList = null;
		if (bvo.getOrder_by() == null) bvo.setOrder_by("b_num");
		if (bvo.getOrder_sc() == null) bvo.setOrder_sc("DESC");
		myList = boardDao.boardList(bvo);
		return myList;
	}

	@Override
	public int boardInsert(BoardVO bvo) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = boardDao.boardInsert(bvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public BoardVO boardDetail(BoardVO bvo) {
		// TODO Auto-generated method stub
		BoardVO detail = null;
		detail = boardDao.boardDetail(bvo);
		return detail;
	}

	@Override
	public int pwdConfirm(BoardVO bvo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = boardDao.pwdConfirm(bvo);
		return result;
	}

	@Override
	public int boardUpdate(BoardVO bvo) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = boardDao.boardUpdate(bvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int boardDelete(int b_num) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			List<ReplyVO> list = replyDao.replyList(b_num);
			if(!list.isEmpty()) {
				result = replyDao.replyChoiceDelete(b_num);
			}
			result = boardDao.boardDelete(b_num);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int boardListCnt(BoardVO bvo) {
		// TODO Auto-generated method stub
		return boardDao.boardListCnt(bvo);
	}

	@Override
	public int replyCnt(int b_num) {
		// TODO Auto-generated method stub
		int result = 0;
		List<ReplyVO> list = replyDao.replyList(b_num);
		if(!list.isEmpty()) {
			result = list.size();
		} else {
			result = 0;
		}
		return result;
	}

}

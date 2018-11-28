package com.spring.client.board.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.client.reply.vo.ReplyVO;

@Transactional
@Repository
public class ReplyDaoImpl implements ReplyDao {
	@Autowired
	private SqlSession session;

	@Override
	public List<ReplyVO> replyList(Integer b_num) {
		// TODO Auto-generated method stub
		return session.selectList("replyList", b_num);
	}

	@Override
	public int replyInsert(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return session.insert("replyInsert", rvo);
	}

	@Override
	public int replyPwdConfirm(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("replyPwdConfirm", rvo);
	}

	@Override
	public int replyUpdate(ReplyVO rvo) {
		// TODO Auto-generated method stub
		return session.update("replyUpdate", rvo);
	}

	@Override
	public int replyDelete(int r_num) {
		// TODO Auto-generated method stub
		return session.delete("replyDelete", r_num);
	}

	@Override
	public int replyChoiceDelete(int b_num) {
		// TODO Auto-generated method stub
		return session.delete("replyChoiceDelete", b_num);
	}

}

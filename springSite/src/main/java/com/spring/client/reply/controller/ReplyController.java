package com.spring.client.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.client.reply.service.ReplyService;
import com.spring.client.reply.vo.ReplyVO;

import lombok.extern.java.Log;

@Log
@RestController
@RequestMapping(value="/replies")
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value="/all/{b_num}.do", method= RequestMethod.GET) 
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("b_num") Integer b_num) {
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<List<ReplyVO>>(replyService.replyList(b_num), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/replyInsert.do")
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO rvo) {
		log.info("replyInsert 호출 성공");
		ResponseEntity<String> entity = null;
		int result;
		try {
			result = replyService.replyInsert(rvo);
			if (result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String> (e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/replyPwdConfirm.do")
	public ResponseEntity<Integer> pwdConfirm(@ModelAttribute ReplyVO rvo) {
		log.info("replyPwdConfirm 호출 성공");
		ResponseEntity<Integer> entity = null;
		int result = 0;
		try {
			result = replyService.replyPwdConfirm(rvo);
			entity = new ResponseEntity<Integer>(result, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Integer> (result, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value ="/{r_num}.do", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> replyUpdate(@PathVariable("r_num") Integer r_num, 
			@RequestBody ReplyVO rvo) {
		log.info("replyUpdate 호출 성공");
		ResponseEntity<String> entity = null;
		try {
			rvo.setR_num(r_num);
			replyService.replyUpdate(rvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/{r_num}.do", method = RequestMethod.DELETE)
	public ResponseEntity<String> replyDelete(@PathVariable("r_num") Integer r_num) {
		log.info("replyDelete 호출 성공");
		ResponseEntity<String> entity = null;
		try {
			replyService.replyDelete(r_num);
			entity = new ResponseEntity<String> ("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String> (e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}

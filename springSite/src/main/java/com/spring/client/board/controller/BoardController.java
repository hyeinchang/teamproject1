package com.spring.client.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.board.service.BoardService;
import com.spring.client.board.vo.BoardVO;
import com.spring.common.file.FileUploadUtil;
import com.spring.common.page.Paging;
import com.spring.common.util.Util;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/boardList.do", method=RequestMethod.GET)
	public String BoardList(@ModelAttribute BoardVO bvo, Model model) {
		log.info("boardList 호출 성공");
		Paging.setPage(bvo);
		int total = boardService.boardListCnt(bvo);
		log.info("total = " + total);
		int count = total - (Util.nvl(bvo.getPage())-1) * Util.nvl(bvo.getPageSize());
		log.info("count = " + count);
		List<BoardVO> boardList = boardService.boardList(bvo);
		model.addAttribute("boardList", boardList);
		model.addAttribute("count", count);
		model.addAttribute("total", total);
		model.addAttribute("data", bvo);
		return "board/boardList";
	}
	
	@RequestMapping(value="/writeForm.do")
	public String writeForm() {
		log.info("writeForm 호출 성공");
		return "board/writeForm";
	}
	
	@RequestMapping(value="boardInsert.do", method=RequestMethod.POST)
	public String boardInsert(@ModelAttribute BoardVO bvo, Model model,
			HttpServletRequest request) throws IllegalStateException, IOException {
		log.info("boardInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		if (bvo.getFile() != null) {
			String b_file = FileUploadUtil.fileUpload(bvo.getFile(), request, "board");
			bvo.setB_file(b_file);
		}
		
		result = boardService.boardInsert(bvo);
		if (result == 1) {
			url = "/board/boardList.do";
		} else {
			model.addAttribute("code", 1);
			url = "/board/writeForm.do";
		}
		return "redirect:" + url;
	}
	
	@RequestMapping(value="/boardDetail.do", method=RequestMethod.GET)
	public String boardDetail(@ModelAttribute BoardVO bvo, Model model) {
		log.info("BoardDetail 호출 성공");
		log.info("b_num = " + bvo.getB_num());
		
		BoardVO detail = new BoardVO();
		detail = boardService.boardDetail(bvo);
		
		if (detail != null && (!detail.equals(""))) {
			detail.setB_content(detail.getB_content().toString().replaceAll("\n", "<br>"));
		}
		model.addAttribute("detail", detail);
		
		return "board/boardDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="/pwdConfirm.do", method=RequestMethod.POST,
	produces="text/plain; charset=utf-8")
	public String pwdConfirm(@ModelAttribute BoardVO bvo) {
		log.info("pwdConfirm 호출 성공");
		
		String value = "";
		
		int result = boardService.pwdConfirm(bvo);
		if(result == 1) {
			value = "성공";
		} else {
			value = "실패";
		}
		log.info("result = " + result);
		
		return value+"";
	}
	
	@RequestMapping(value="/updateForm.do")
	public String updateForm(@ModelAttribute BoardVO bvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("b_num = "+ bvo.getB_num());
		
		BoardVO updateData = new BoardVO();
		updateData = boardService.boardDetail(bvo);
		
		model.addAttribute("updateData", updateData);
		return "board/updateForm";
	}
	
	@RequestMapping(value="/boardUpdate.do", method=RequestMethod.POST)
	public String boardUpdate(@ModelAttribute BoardVO bvo, HttpServletRequest request)
	throws IllegalStateException, IOException{
		log.info("boardUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		String b_file = "";
		
		if(!bvo.getFile().isEmpty()) {
			log.info("========== file = " + bvo.getFile().getOriginalFilename());
			if (!bvo.getB_file().isEmpty()) {
				FileUploadUtil.fileDelete(bvo.getB_file(), request);
			}
			b_file = FileUploadUtil.fileUpload(bvo.getFile(), request, "board");
			bvo.setB_file(b_file);
		} else {
			log.info("첨부파일 없음");
			bvo.setB_file("");
		}
		
		result = boardService.boardUpdate(bvo);
		
		if (result == 1) {
			url = "/board/boardDetail.do?b_num="+bvo.getB_num();
		} else {
			url = "/board/updateForm.do?b_num="+bvo.getB_num();
		}
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/boardDelete.do")
	public String boardDelete(@ModelAttribute BoardVO bvo, HttpServletRequest request)
	throws IllegalStateException, IOException {
		log.info("boardDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		if (!bvo.getB_file().isEmpty()) {
			FileUploadUtil.fileDelete(bvo.getB_file(), request);
		}
		
		result = boardService.boardDelete(bvo.getB_num());
		
		if (result == 1) {
			url = "/board/boardList.do";
		} else {
			url = "/board/boardDetail.do?b_num="+bvo.getB_num();
		}
		return "redirect:"+url;
	}
	
	@ResponseBody
	@RequestMapping(value="/replyCnt.do")
	public String replyCnt(@RequestParam("b_num") int b_num) {
		log.info("replyCnt 호출 성공");
		int result = 0;
		result = boardService.replyCnt(b_num);
		return result+"";
	}
	
}

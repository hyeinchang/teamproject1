package com.spring.admin.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.admin.board.service.AdminBoardService;
import com.spring.client.board.vo.BoardVO;
import com.spring.client.common.excel.ListExcelView;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/admin")
public class AdminBoardController {
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	@RequestMapping(value="/board/boardList", method=RequestMethod.GET)
	public String boardList(@ModelAttribute BoardVO bvo, Model model) {
		log.info("admin boardList 호출 성공");
		
		int total = adminBoardService.boardListCnt(bvo);
		log.info("total = " + total);
		
		List<BoardVO> boardList = adminBoardService.boardList(bvo);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("total", total);
		model.addAttribute("data", bvo);
		
		return "admin/board/boardList";
	}
	
	@RequestMapping(value="/board/boardExcel", method=RequestMethod.GET)
	public ModelAndView boardExcel(@ModelAttribute BoardVO bvo) {
		log.info("boardExcel 호출 성공");
		List<BoardVO> boardList = adminBoardService.boardList(bvo);
		
		ModelAndView mv = new ModelAndView(new ListExcelView());
		mv.addObject("list", boardList);
		mv.addObject("template", "board.xlsx");
		mv.addObject("file_name", "board");
		
		return mv;
	}
}

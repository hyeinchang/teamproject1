package com.spring.admin.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.admin.member.service.AdminMemberService;
import com.spring.client.member.vo.MemberVO;
import com.spring.common.graph.ChartMake;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/admin")
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value="/member/memberList", method=RequestMethod.GET)
	public String memberList(@ModelAttribute MemberVO bvo, Model model, HttpServletRequest request) {
		log.info("memberList 호출 성공");
		
		List<MemberVO> memberList = adminMemberService.memberList(bvo);		
		Map<String, Integer> memberAgeList = adminMemberService.memberAgeList();
		ChartMake.pieChart(request, memberAgeList);
		Map<String, Integer> memberGenderList = adminMemberService.memberGenderList();
		ChartMake.barChart(request, memberGenderList);
		
		
		model.addAttribute("memberList", memberList);
		
		return "admin/member/memberList";
	}
}

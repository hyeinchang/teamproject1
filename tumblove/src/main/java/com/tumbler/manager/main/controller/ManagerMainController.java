package com.tumbler.manager.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/manager")
public class ManagerMainController {
	
	@RequestMapping(value="/main/mainList", method=RequestMethod.GET)
	public String managerMain(Model model) {
		
		String authority = "manager";
		model.addAttribute("authority", authority);
		
		return "index2";
	}
}

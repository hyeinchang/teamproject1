package com.tumbler.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tumbler.product.vo.ProductVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/product")
public class ProductController {

	
	@RequestMapping(value="/productList.do", method=RequestMethod.GET)
	public String ProductList(@ModelAttribute ProductVO pvo, Model model) {
		log.info("Product List 호출 성공");
		
		return "product/PoductList";
	}
	
}

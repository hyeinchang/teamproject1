package com.tumbler.manager.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tumbler.common.page.Criteria;
import com.tumbler.common.page.PageDTO;
import com.tumbler.manager.product.service.ManagerProductService;
import com.tumbler.manager.product.vo.ManagerProductVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/manager/product")
public class ManagerProductController {
	@Autowired
	ManagerProductService service;
	
	@RequestMapping(value="/productList")
	public String managerProductList(Criteria cri, Model model) {
		log.info("Manager ProductList 호출 성공");
		List<ManagerProductVO> productList = service.managerProductList(cri);
		model.addAttribute("productList", productList);
		
		int total = service.mGetTotalCount(cri);
		model.addAttribute("productList", productList);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		log.info("total: " + total);
		
		return "manager/product/managerProductList";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String managerSearchProductList(Criteria cri, Model model) {
		log.info("Manager searchProductList 호출 성공");

		
		List<ManagerProductVO> productList = service.mSearchProductList(cri);
		int total = service.mGetSearchTotalCount(cri);
		model.addAttribute("productList", productList);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		log.info("total: " + total);
		return "manager/product/managerProductList";
	}
	
	/*@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String managerProductDetail(Criteria cri, ManagerProductVO mpvo, Model model) {
		log.info("Manager productDatail 호출 성공");


		log.info(mpvo.getP_num()+"");
		return "manager/product/managerProductDetail";
	}*/
}

package com.spring.client.gallery.conroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.client.gallery.service.GalleryService;
import com.spring.client.gallery.vo.GalleryVO;
import com.spring.common.file.FileUploadUtil;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/gallery")
public class GalleryController {
	@Autowired
	private GalleryService galleryService;
	
	@RequestMapping(value="/galleryList")
	public String galleryList() {
		log.info("galleryList 호출 성공");
		
		return "gallery/galleryList";
	}
	
	@ResponseBody
	@RequestMapping(value="/galleryData")
	public String galleryData(ObjectMapper mapper) {
		log.info("galleryData 호출 성공");
		String listData = "";
		List<GalleryVO> galleryList = galleryService.galleryList();
		try {
			listData = mapper.writeValueAsString(galleryList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return listData;
	}
	
	@ResponseBody
	@RequestMapping(value="/galleryInsert", method=RequestMethod.POST,
	produces="text/plain; charset=UTF-8")
	public String galleryInsert(@ModelAttribute GalleryVO gvo, HttpServletRequest request)
	throws Exception {
		log.info("galleryInsert 호출 성공");
		
		log.info("file name : " + gvo.getFile().getOriginalFilename());
		String value = "";
		int result = 0;
		
		if(gvo.getFile()!=null) {
			String fileName = FileUploadUtil.fileUpload(gvo.getFile(), request, "gallery");
			gvo.setG_file(fileName);
			
			String thunbName = FileUploadUtil.makeThumnail(fileName, request);
			gvo.setG_thumb(thunbName);
		}
		
		result = galleryService.galleryInsert(gvo);
		
		if(result == 1) {
			value = "성공";
		} else {
			value = "실패";
		}
		
		return value;
	}
	
}

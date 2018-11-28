package com.spring.common.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		
		if (fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}
	
	public static String fileUpload(MultipartFile file, HttpServletRequest request, String fileName) 
	throws IOException {
		System.out.println("fileUpload 호출 성공");
		
		String real_name = null;
		String org_name = file.getOriginalFilename();
		
		System.out.println("org_name: "+ org_name );
		
		if(org_name != null && (!org_name.equals(""))) {
			real_name  = fileName + "_" + System.currentTimeMillis() + "_" + org_name;
			
			String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage/"+fileName);
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot+"/"+real_name);
			
			System.out.println("업로드할 파일(fileAdd) : " + fileAdd);
			
			file.transferTo(fileAdd);
		}
		return real_name;
	}
	
	public static void fileDelete(String fileName, HttpServletRequest request) throws IOException {
		System.out.println("fileDelete 호출 성공");
		boolean result = false;
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		String docRoot = request.getSession().getServletContext().getRealPath("/uploadStorage/" + dirName);
		
		File fileDelete = new File(docRoot + "/" + fileName);
		
		System.out.println("삭제할 파일(fileDelete) : " + fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		System.out.println("파일 삭제 여부(true/false) : " + result);
	}
	
	public static String makeThumnail(String fileName, HttpServletRequest request)
			throws Exception {
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		String imgPath = request.getServletContext().getRealPath("/uploadStorage/"+dirName);
		File fileAdd = new File(imgPath, fileName);
		System.out.println("원본 이미지 파일(fileAdd) : " + fileAdd);
		BufferedImage sourceImg = ImageIO.read(fileAdd);
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 133);
		// resize(대상(BuffereredImage 타입), 원본비율, 높이 또는 너비, 크기)
		
		String thumbnailName = "thumbnail_" + fileName;
		String docRoot = imgPath + "/thumbnail";
		makeDir(docRoot);
		
		File newFile = new File(docRoot, thumbnailName);
		System.out.println("업로드할 파일(newFile) : " + newFile);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		System.out.println("확장자(formatName) : " + formatName);
		
		ImageIO.write(destImg, formatName, newFile);
		return thumbnailName;
		
	}
}

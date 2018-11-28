package com.spring.client.gallery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.client.gallery.vo.GalleryVO;

@Repository
public class GalleryDaoImpl implements GalleryDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<GalleryVO> galleryList() {
		// TODO Auto-generated method stub
		return session.selectList("galleryList");
	}

	@Override
	public int galleryInsert(GalleryVO gvo) {
		// TODO Auto-generated method stub
		return session.insert("galleryInsert", gvo);
	}

}

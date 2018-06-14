package com.tgb.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tgb.mapper.DocumentMapper;
import com.tgb.model.DocCategory;
import com.tgb.model.DocumentObject;
import com.tgb.service.DocumentService;



@Service
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了
public class DocumentServiceImpl implements DocumentService {
	
	@Resource
	private DocumentMapper mapper;

	public boolean delete(int id) {
		
		return mapper.delete(id);
	}


	public DocumentObject findById(int id) {

		DocumentObject documentObject = mapper.findById(id);
		
		return documentObject;
	}

	public void save(DocumentObject documentObject) {

		mapper.save(documentObject);
	}

	public boolean update(DocumentObject documentObject) {

		return mapper.update(documentObject);
	}

	@Override
	public List<DocumentObject> findAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<DocumentObject> findAllList = mapper.findAll(map);
		return findAllList;
	}


	@Override
	public int countByName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.countByName(map);
	}


	@Override
	public List<DocumentObject> findLast() {
		// TODO Auto-generated method stub
		return mapper.findLast();
	}


	@Override
	public List<DocCategory> getCategory() {
		// TODO Auto-generated method stub
		return mapper.getCategory();
	}
	
	

}

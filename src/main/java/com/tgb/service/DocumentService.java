package com.tgb.service;

import java.util.List;
import java.util.Map;

import com.tgb.model.DocCategory;
import com.tgb.model.DocumentObject;

public interface DocumentService {

	void save(DocumentObject documentObject);
	boolean update(DocumentObject documentObject);
	boolean delete(int id);
	DocumentObject findById(int id);
	List<DocumentObject> findAll(Map<String,Object> map);
	int countByName(Map<String,Object> map);
	List<DocumentObject> findLast();
	List<DocCategory> getCategory();
}
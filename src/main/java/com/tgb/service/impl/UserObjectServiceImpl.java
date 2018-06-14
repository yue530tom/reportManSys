package com.tgb.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tgb.mapper.UserObjectMapper;
import com.tgb.model.UserObject;
import com.tgb.service.UserObjectService;


@Service
@Transactional //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了
public class UserObjectServiceImpl implements UserObjectService {
	
	@Resource
	private UserObjectMapper  userObjcetMapper ;

	
	public UserObject checkUserPasswd(UserObject userObject) {
		// TODO Auto-generated method stub
		return userObjcetMapper.checkUserPasswd(userObject);
	}

	
	public boolean addUser(UserObject userObject) {
		// TODO Auto-generated method stub
		return userObjcetMapper.addUser(userObject);
	}

	
	public boolean delUser(Long user_id) {
		// TODO Auto-generated method stub
		return userObjcetMapper.delUser(user_id);
	}

	
	public UserObject modInfo(UserObject userObject) {
		// TODO Auto-generated method stub
		return userObjcetMapper.modInfo(userObject);
	}

	
	public List<UserObject> getAllUsers() {
		// TODO Auto-generated method stub
		return userObjcetMapper.getAllUsers();
	}

}

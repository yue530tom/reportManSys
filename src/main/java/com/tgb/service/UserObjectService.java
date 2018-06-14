package com.tgb.service;

import java.util.List;
import com.tgb.model.UserObject;

public interface UserObjectService {
	UserObject checkUserPasswd(UserObject userObject);
	boolean addUser(UserObject userObject);
	boolean delUser(Long user_id);
	UserObject modInfo(UserObject userObject);
	List <UserObject> getAllUsers();
	
}

package com.tgb.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.tgb.model.UserObject;
import com.tgb.service.UserObjectService;


@Controller
//@SessionAttributes("userName")
public class LoginController {
	
	@Autowired
	private UserObjectService userObjectService;
 
	@RequestMapping(value = "/login")  
    public String login(Model model, HttpServletRequest request, HttpSession session) {  
		
		UserObject userObject = new UserObject();
		userObject.setuName(request.getParameter("userName"));
		userObject.setuPasswd(request.getParameter("userPasswd"));
		UserObject userResult = userObjectService.checkUserPasswd(userObject);
		
		if(userResult != null){
			session.setAttribute("userName", userObject.getuName());
			return "/about";
		}else{
			return "/login";
		}
    }
	
	@RequestMapping("/logout")
	public String logout(Model model, HttpServletRequest request, HttpSession session){
		
		if(session.getAttribute("userName")!=null){
			session.setAttribute("userName", null);
		}
		
		return "/about";
	}

}

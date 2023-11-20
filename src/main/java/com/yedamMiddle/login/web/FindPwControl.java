package com.yedamMiddle.login.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.service.Pwsha256;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;

public class FindPwControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String uid = req.getParameter("uid");
		String phone = req.getParameter("phone");
		
		LoginService svc = new LoginServiceImpl();
		UserVO vo = svc.findPw(uid, phone);
		req.setAttribute("pwd", vo);
		
		
		
		String path = "login/find2.tiles";
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

}

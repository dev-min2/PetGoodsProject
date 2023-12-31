package com.yedamMiddle.cart.web;

import java.io.IOException;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.cart.service.MyCartService;
import com.yedamMiddle.cart.service.MyCartVO;
import com.yedamMiddle.cart.serviceImpl.MyCartServiceImpl;
import com.yedamMiddle.common.Command;

public class AddCartControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		
		String uno = req.getParameter("uno");
		String pno = req.getParameter("pno");
		String cnt = req.getParameter("cnt");
		
		
		MyCartService svc = new MyCartServiceImpl();
		MyCartVO vo = new MyCartVO();
		
		vo.setMemberNo(Integer.parseInt(uno));
		vo.setProductNo(Integer.parseInt(pno));
		vo.setSelectCnt(Integer.parseInt(cnt));
		
		String result = "";
		if(svc.addCart(vo)) {
			result = "{\"retCode\":\"OK\"}";
		}else {
			result = "{\"retCode\":\"NG\"}";
		}
		
		try {
			resp.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

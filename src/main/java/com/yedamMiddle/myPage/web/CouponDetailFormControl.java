package com.yedamMiddle.myPage.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.PageDTO;
import com.yedamMiddle.coupon.service.CouponVO;
import com.yedamMiddle.myPage.service.MyPageService;
import com.yedamMiddle.myPage.serviceImpl.MyPageServiceImpl;

public class CouponDetailFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		Object userNoObj = req.getSession().getAttribute("uno");
		if (userNoObj == null) {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return;
		}

		int userNo = (Integer) userNoObj;
		MyPageService svc = new MyPageServiceImpl();
		String page = req.getParameter("page");
		if(page == null)
			page = "1";
		int pageNo = Integer.parseInt(page);
		
		List<CouponVO> list = svc.couponList(userNo);
		
		int startIdx = (pageNo - 1) * 10;
		int endIdx = (pageNo) * 10;
		
		List<CouponVO> showList = new ArrayList<>(10);
		for(int sIdx = startIdx; sIdx < endIdx; ++sIdx) {
			if(sIdx >= list.size())
				break;
			
			showList.add(list.get(sIdx));
		}
		
		PageDTO paging = new PageDTO(0,list.size(),pageNo, 10);
		
		req.setAttribute("pagination", paging);
		req.setAttribute("list", showList);
//		List<CouponVO> endList = svc.endCouponList(userNo);
//		req.setAttribute("endList", endList);
		
		
		try {
			req.getRequestDispatcher("myPage/couponDetail.tiles").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}

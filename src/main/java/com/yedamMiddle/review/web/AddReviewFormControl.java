package com.yedamMiddle.review.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.review.service.ReviewService;
import com.yedamMiddle.review.service.ReviewVO;
import com.yedamMiddle.review.serviceImpl.ReviewServiceImpl;

public class AddReviewFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		ReviewService svc = new ReviewServiceImpl();
		String path="review/addReviewForm.tiles";
		String merUid = req.getParameter("mUid");
		String productNo = req.getParameter("pNo");
		System.out.println("merUid =" + merUid);
		System.out.println("productNo =" + productNo);
		
		
		ReviewVO reviewVo = svc.selectDetailReviewByProductNo(Long.parseLong(merUid), Integer.parseInt(productNo));
		System.out.println("reviewVo =" + reviewVo);
		
		req.setAttribute("reviewVo", reviewVo);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}

package com.yedamMiddlle.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.product.service.ProductService;
import com.yedamMiddle.product.service.ProductVO;
import com.yedamMiddlle.product.serviceImpl.ProductServiceImpl;

public class ProductSearchControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String query = req.getParameter("q");
		String petType = req.getParameter("type");
		
		ProductService svc = new ProductServiceImpl();
		List<ProductVO> list = svc.searchProductList(query, petType);
		
		req.setAttribute("searchList", list);
		
	}

}

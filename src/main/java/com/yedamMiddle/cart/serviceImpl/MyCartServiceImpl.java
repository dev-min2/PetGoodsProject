package com.yedamMiddle.cart.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.cart.mapper.MyCartMapper;
import com.yedamMiddle.cart.service.MyCartService;
import com.yedamMiddle.cart.service.MyCartVO;
import com.yedamMiddle.common.Mybatis;
import com.yedamMiddle.common.service.CartJoinVO;


public class MyCartServiceImpl implements MyCartService {
	
	private SqlSession sql = Mybatis.getInstance().openSession(true);
	MyCartMapper mapper =  sql.getMapper(MyCartMapper.class);
	
	@Override
	public boolean addCart(MyCartVO vo) {
		return mapper.insert(vo)==1;
	}
	
	@Override
	public List<CartJoinVO> getCart(int memberNo) {
		return  mapper.getCart(memberNo);
	}
}

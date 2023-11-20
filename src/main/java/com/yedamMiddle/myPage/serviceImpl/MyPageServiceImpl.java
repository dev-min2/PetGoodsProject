package com.yedamMiddle.myPage.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.common.Mybatis;
import com.yedamMiddle.coupon.service.CouponVO;
import com.yedamMiddle.myPage.mapper.MyPageMapper;
import com.yedamMiddle.myPage.service.MyPageService;

public class MyPageServiceImpl implements MyPageService{
	SqlSession sql = Mybatis.getInstance().openSession(true);
	MyPageMapper mapper = sql.getMapper(MyPageMapper.class);
	
	
	@Override
	public List<CouponVO> endCouponList(int userNo) {
		return mapper.endCouponList(userNo);
	}

	@Override
	public List<CouponVO> couponList(int userNo) {
		return mapper.couponList(userNo);
	}

}
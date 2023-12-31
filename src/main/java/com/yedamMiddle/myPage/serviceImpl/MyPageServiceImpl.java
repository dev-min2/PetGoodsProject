package com.yedamMiddle.myPage.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedamMiddle.common.Mybatis;
import com.yedamMiddle.common.service.PetVO;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.coupon.service.CouponVO;
import com.yedamMiddle.myPage.mapper.MyPageMapper;
import com.yedamMiddle.myPage.service.MyPageService;
import com.yedamMiddle.product.service.ProductOrderJoinVO;
import com.yedamMiddle.review.service.ReviewVO;
import com.yedamMiddle.userQna.service.UserQnaVO;

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

	@Override
	public List<UserQnaVO> recentQnaList(int userNo) {
		return mapper.recentQnaList(userNo);
	}

	@Override
	public List<UserQnaVO> qnaList(int userNo) {
		return mapper.qnaList(userNo);
	}
	@Override
	public boolean updateUser(UserVO vo) {
		return mapper.updateUser(vo)==1;
	}

	@Override
	public List<ProductOrderJoinVO> orderList(int userNo) {
		return mapper.orderList(userNo);
	}

	@Override
	public List<ReviewVO> recentReviewList(int userNo) {
		return mapper.recentReviewList(userNo);
	}

	@Override
	public List<ReviewVO> reviewList(int userNo) {
		return mapper.reviewList(userNo);
	}

	@Override
	public List<PetVO> petInfo(int userNo) {
		return mapper.myPetInfo(userNo);
	}

	@Override
	public boolean addMyPet(PetVO vo) {
		return mapper.insertMyPet(vo) == 1;
	}
	@Override
	public boolean updatePw(String newPw, String userId, String userPw) {
		return mapper.updatePw(newPw, userId, userPw)==1;
	}

}

package com.yedamMiddle.login.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedamMiddle.common.Command;
import com.yedamMiddle.common.service.PetVO;
import com.yedamMiddle.common.service.UserVO;
import com.yedamMiddle.coupon.service.CouponService;
import com.yedamMiddle.coupon.service.CouponVO;
import com.yedamMiddle.coupon.serviceImpl.CouponServiceImpl;
import com.yedamMiddle.login.service.LoginService;
import com.yedamMiddle.login.service.Pwsha256;
import com.yedamMiddle.login.serviceImpl.LoginServiceImpl;

public class LoginControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String uid = req.getParameter("userId");
		String upw = req.getParameter("userPw");
		String encryPassword = Pwsha256.encrypt(upw);
		System.out.println(encryPassword);

		LoginService svc = new LoginServiceImpl();
		UserVO vo = svc.loginUser(uid, encryPassword);

		// 로그인정보가 없으면 loginForm으로 이동.
		if (vo == null) {
			try {
				resp.sendRedirect("loginForm.do");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		HttpSession session = req.getSession();
		session.setAttribute("uno", vo.getUserNo()); // 로그인한 회원번호 기억 후 사용
		session.setAttribute("uid", vo.getUserId());
		session.setAttribute("permission", vo.getUserPermission()); // 사용자 계정으로 로그인했는지 구분하기 위함
		session.setAttribute("nickName", vo.getNickName()); // 현재 사용자가 누구인지 구문

		CouponService csv = new CouponServiceImpl();
		csv.userExpireCouponUpdate();

		// 유저번호로 펫 정보 찾기
		PetVO petVo = csv.selectPetByUserNo(vo.getUserNo());
		// 유저번호로 생일쿠폰인 쿠폰 정보 찾기
		CouponVO couponVo = csv.selectCouponByUserNo(vo.getUserNo());
		

		if (petVo != null && couponVo == null) {

			// 로그인 시 날짜가 지난 쿠폰 만료적용
			Date now = new Date();// 오늘날짜
			SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일");// 날짜형식

			System.out.println("petVo =" + petVo);
			System.out.println("couponVo =" + couponVo);

			String petBirthDay = format.format(petVo.getPetBirth());
			String date = format.format(now);
			System.out.println("petVo.getPetBirth()=" + petBirthDay);
			System.out.println("now=" + date);

			resp.setContentType("text/html; charset=UTF-8");
			// 오늘이 펫 생일이면
			if (petBirthDay.equals(date)) {
				int birthCoupon = csv.userBirthCouponInsert(vo.getUserNo());// 쿠폰발급
				if (birthCoupon == 1) { // 발급됨
					// alert창
					System.out.println("1쿠폰발급");
					session.setAttribute("petBirthDay", "Y");
				}
			}
			// 이미 받은 생일쿠폰이 있으면

		}

		try {
			resp.sendRedirect("main.do");
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}

package com.yedamMiddle.review.service;

import java.util.Date;

public class ReviewVO {
	private int reviewNo;
	private int merUid;
	private String content;
	private int starCnt;
	private Date reviewDate;
	private int reviewLikeCnt;
	private int productNo;
	private int UserNo;
	private String reviewImage;
	private String nickName;
	private String productName;
	
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getMerUid() {
		return merUid;
	}
	public void setMerUid(int merUid) {
		this.merUid = merUid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStarCnt() {
		return starCnt;
	}
	public void setStarCnt(int starCnt) {
		this.starCnt = starCnt;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getReviewLikeCnt() {
		return reviewLikeCnt;
	}
	public void setReviewLikeCnt(int reviewLikeCnt) {
		this.reviewLikeCnt = reviewLikeCnt;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getUserNo() {
		return UserNo;
	}
	public void setUserNo(int userNo) {
		UserNo = userNo;
	}
	public String getReviewImage() {
		return reviewImage;
	}
	public void setReviewImage(String reviewImage) {
		this.reviewImage = reviewImage;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}

	
	
	
}
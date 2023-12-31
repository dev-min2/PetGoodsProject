package com.yedamMiddle.login.service;

import java.util.List;

import com.yedamMiddle.common.service.UserVO;

public interface LoginService {
	public boolean addUser(UserVO vo);
	public boolean deleteUser(String userId,String userPW);
	public UserVO loginUser(String userId,String userPw);
	public List<UserVO> list();
	public UserVO getUserInfo(int userNo);
	public UserVO idCheck(String userId);
	public UserVO findId(String nickName,String userPhone);
	public UserVO findPw(String userId,String userPhone);
	public boolean updatePw(String userPw, String userId);
	public UserVO userInfo(String userId);
}
	

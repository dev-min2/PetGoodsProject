package com.yedamMiddle.userQna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedamMiddle.userQna.service.UserQnaVO;


public interface UserQnaMapper {
	public List<UserQnaVO> userQnaAllList();
	public UserQnaVO userQnaSelect(@Param("qnaNo") int qnaNo , @Param("password")int password);
	
	//게시글 등록, 수정, 삭제
	public int userQnaInsert(UserQnaVO vo);
	public int userQnaUpdate(@Param("qnaNo") int qnaNo , @Param("password")int password);
	public int userQnaDelete(UserQnaVO vo);
	
	//관리자 게시글 수정(답변 및 답변상태)
	public int adminQnaUpdate(UserQnaVO vo);
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %> 

<style>
#list span {
	margin: 8px;
}

.pagination {
	/* 		display: inline-block; */
	
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>

<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="container-fluid">
		
			<form encType = "multipart/form-data" action="addReview.do" name="addReviewForm" method="post" style=text-align:center; >
				<input type="hidden" name="productName" value="${productVo.productName}">
				<input type="hidden" name="nickName" value="${userVo.nickName }">
				<input type="hidden" name="merUid" value="${merUid }">
				<input type="hidden" name="userNo" value="${userVo.userNo }">
				<input type="hidden" name="productNo" value="${productVo.productNo }">
				<h3>리뷰 등록</h3>
				<br><hr>
				<table class = "table" style= text-align:center>
<!--                     <table id="datatablesSimple" style=text-align:center> -->
                    	<thead >
                    		<tr style=text-align:center>
                    			<th colspan="2">상품이름</th>
                    			<th colspan="2">별점</th>
                    			<th colspan="2">작성자</th>
                    		</tr>
                    	</thead>
                    	<tbody>
							<tr>
                    			<td colspan="2">${productVo.productName }</td>
                    			<td colspan="2">
                    				<select name="score">
                    					<option value=1>1점</option>
                    					<option value=2>2점</option>
                    					<option value=3 selected>3점</option>
                    					<option value=4>4점</option>
                    					<option value=5>5점</option>
                    				</select>
                    			</td>
                    			<td colspan="2">${userVo.nickName }</td>
                    			
                    		</tr>
                    		
                    		<tr><th colspan="3">사진첨부</th>
                    		<th colspan="3">내용</th>
                    		</tr>
                    			<tr>
                    				<td colspan="3">
                    					<input type ="file" name="img" class = "form-control">
                    				</td>
                    				<td colspan="3"><textarea cols="40" rows="5" name="content" class = "form-control"></textarea></td>
                    			</tr>
                    			<tr><td colspan="6">
										<input type="submit" value="등록하기">
										<input type="reset" value="초기화">
								</td></tr>
					</tbody>
				</table>
			</form>
			
			
		
						
			<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			
				
			
			
		</div>
	</div>
</section>



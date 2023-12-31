<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<section class="pt-2 pb-4">
	<div class="container px-4 px-lg-5 mt-3">
		<div class="container-fluid px-4">
			<div id="layoutSidenav">
				<!-- menu attribute-->
				<div id="layoutSidenav_nav" style="z-index: 0">
					<nav class="sb-sidenav accordion sb-sidenav-light"
						id="sidenavAccordion">
						<div class="sb-sidenav-menu">
							<div class="nav">
								<div class="sb-sidenav-menu-heading">${nickName }님 환영합니다</div>
								<a class="nav-link" href="myInfo.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-person"></i>
									</div> 내정보관리
								</a><a class="nav-link" href="orderDetailForm.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-basket3-fill"></i>
									</div> 주문내역
								</a> <a class="nav-link" href="couponDetailForm.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-upc-scan"></i>
									</div> 내 쿠폰
								</a> <a class="nav-link" href="myProdQnaDetailForm.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-box-seam"></i>
									</div> 상품문의
								</a> <a class="nav-link" href="myReviewDetailForm.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-chat-left-text"></i>
									</div> 내 리뷰보기
								</a><a class="nav-link" href="myPetInfo.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-reddit"></i>
									</div> 내반려동물정보
								</a><a class="nav-link" href="delUserForm.do">
									<div class="sb-nav-link-icon">
										<i class="bi bi-person"></i>
									</div> 회원 탈퇴
								</a>
							</div>
						</div>
					</nav>
				</div>
				<div id="layoutSidenav_content">
					<main>
						<div class="container-fluid px-4">
						<h3 class="mt-4" style= text-align:center>문의사항</h3>
	                    <br>
	                    <hr>
							<div class="d-flex justify-content-center">
					<table class="table w-85" style=text-align:center>
						<thead >
                    		<tr style=text-align:center>
                    			<th>공개여부</th>
	                    		<th>글번호</th>
	                    		<th>문의정보</th>
	                    		<th>제목</th>
	                    		<th>작성자</th>
	                    		<th>작성일</th>
	                    		<th>문의상태</th>
                    		</tr>
                    	</thead>
                    	<tbody>
                    	<c:choose>
                    		<c:when test="${empty list }">
                    			<tr ><td colspan="7" style="color:gray;">아직 작성된 문의가 없습니다.</td><tr>
                    		</c:when>
                    		<c:otherwise>
	                    		<c:forEach items="${list }" var="vo">
	                    		<tr>
	                    			<td> 
	                    				<c:choose>
		                    				<c:when test="${empty vo.password }">
		                    					전체공개
		                    				</c:when>
		                    				<c:otherwise>
		                    					비밀글
		                    				</c:otherwise>
	                    				</c:choose>
	                    			</td>
	                    					
	                    			<td class="qnaNocheck">${vo.qnaNo}</td>
	                    			<td>${vo.qnaType }</td>
	                    			
	                    			<td class="passcheck" onclick="passCheck('${vo.password}', '${vo.qnaNo }')">
	                    				<a href=#>${vo.title }</a>
	                    			</td>
	                    			<!-- 클릭이벤트 : 제목을 클릭하면 비밀번호를 비교하고 만약 맞다면 getUserQnaList.do?이 주소로 넘겨줌 -->
	                    			
	                    			
	                    			<td>${vo.nickName }</td>
	                    			<td><fmt:formatDate value ="${vo.registDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
	                    			<td>
	                    			<c:if test="${not empty vo.qnaNo}">
		                    				<c:choose>
		                    					<c:when test="${vo.qnaState==1 }" >
		                    						<p style="color: blue;"><b>답변완료</b></p>
		                    					</c:when>
		                    					<c:otherwise>
		                    						<p style="color: red;"><b>문의대기중</b></p>
		                    					</c:otherwise>
		                    				</c:choose>
	                    				</c:if>
	                    			</td>
	                    		</tr>
	                    		</c:forEach>
	                    	</c:otherwise>
                    	</c:choose>	
                    	</tbody>
                    	
                    </table>
                    
                    </div>
                     <div style= text-ailgn:left>
                    <hr>
                     	 <p><a href="addUserQnaForm.do">문의글 작성</a></p>
							</div>
							<c:set var="curPage" value="${pagination.currentPage }" />
							<c:set var="start" value="${pagination.startPage }" />
							<c:set var="end" value="${pagination.endPage }" />

							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:if test="${pagination.prev }">
										<li class="page-item"><a class="page-link"
											href="myProdQnaDetailForm.do?page=${curPage - 1}"
											aria-label="Next"> <span aria-hidden="true">&laquo;</span>
												<span class="sr-only">Previous</span>
										</a></li>
									</c:if>
									<c:forEach var="idx" begin="${start }" end="${end }" step="1">
										<c:choose>
											<c:when test="${idx == curPage}">
												<li class="page-item active"><a class="page-link"
													href="myProdQnaDetailForm.do?page=${idx}">${idx}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="myProdQnaDetailForm.do?page=${idx}">${idx}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pagination.next}">
										<li class="page-item"><a class="page-link"
											href="myProdQnaDetailForm.do?page=${curPage + 1}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												<span class="sr-only">Next</span>
										</a></li>
									</c:if>
								</ul>
							</nav>

						</div>

					</main>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	function passCheck(password,qnaNo){
		window.location.href="getUserQnaList.do?qnaNo="+qnaNo+"&password="+password;
		return;
	}
</script>

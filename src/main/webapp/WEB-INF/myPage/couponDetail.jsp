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
						<h3 class="mt-4" style= text-align:center>나의쿠폰</h3>
	                    <br>
	                    <hr>
							<div class="d-flex justify-content-center">
								<table class="table w-85" style=text-align:center> 
									<thead >
                    		<tr style=text-align:center>
                    			<th>쿠폰이름</th>
	                    		<th>할인률</th>
	                    		<th>쿠폰만료일</th>
	                    		<th>쿠폰상태</th>
                    		</tr>
                    	</thead>
                    	<tbody>
                    		<c:if test="${empty list}">
                    			<td colspan="4" style=" color:gray;">아직 발급받은 쿠폰이 없습니다.</td>
                    		</c:if>
                    		<c:forEach items="${list }" var="vo">
                    		<c:choose>
                    			<c:when test="${vo.couponState eq '사용완료'|| vo.couponState eq '기간만료'}">
                    				<tr style="background-color: lightgray;">
		                    			<td style=" color:gray;">${vo.couponName }</td>
		                    			<td style=" color:gray;">${vo.discountPct }%</td>
		                    			<td style=" color:gray;"><fmt:formatDate value="${vo.endDate }" pattern="yyyy년 MM월 dd일까지"></fmt:formatDate></td>
		                    			<td style=" color:gray;">${vo.couponState }</td>
                    				</tr>
                    			</c:when>
                    			<c:otherwise>
	                    			<tr>
		                    			<td>${vo.couponName }</td>
		                    			<td>${vo.discountPct }%</td>
		                    			<td><fmt:formatDate value="${vo.endDate }" pattern="yyyy년 MM월 dd일까지"></fmt:formatDate></td>
		                    			<td style="color:blue">${vo.couponState }</td>
	                    			</tr>
                    			</c:otherwise>
                    		</c:choose>
                    		</c:forEach>
                    	</tbody>
                    </table>
							</div>
							<c:set var="curPage" value="${pagination.currentPage }" />
							<c:set var="start" value="${pagination.startPage }" />
							<c:set var="end" value="${pagination.endPage }" />

							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:if test="${pagination.prev }">
										<li class="page-item"><a class="page-link"
											href="couponDetailForm.do?page=${curPage - 1}"
											aria-label="Next"> <span aria-hidden="true">&laquo;</span>
												<span class="sr-only">Previous</span>
										</a></li>
									</c:if>
									<c:forEach var="idx" begin="${start }" end="${end }" step="1">
										<c:choose>
											<c:when test="${idx == curPage}">
												<li class="page-item active"><a class="page-link"
													href="couponDetailForm.do?page=${idx}">${idx}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="couponDetailForm.do?page=${idx}">${idx}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pagination.next}">
										<li class="page-item"><a class="page-link"
											href="couponDetailForm.do?page=${curPage + 1}"
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

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
						<div class="row">
							<div class="col-xl-6">
								<div class="card mb-4">
									<div class="card-header" style="font-size: 1.5em;">
										<i class="bi bi-basket3-fill"></i> 주문내역
										<button type="button" class="btn btn-outline-secondary"
											style="float: right;">
											<a href="orderDetailForm.do" style="color: black;">더보기</a>
										</button>
									</div>
									<div class="card-body" style="height: 170px;">
										<div class="d-flex justify-content-center">
											<table class="table w-85" style="table-layout:fixed;">
												<c:choose>
													<c:when test="${!empty orderList}">
														<c:forEach items="${orderList }" var="order">
															<fmt:formatDate value="${order.orderDate}"
																pattern="yy/MM/dd" var="formattedDate" />
															<tr>
																<td style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${order.merUid }</td>
																<td style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${order.productName }</td>
																<td>${order.productPrice }원</td>
																<td>${order.buyCnt }개</td>
																<td>${formattedDate}</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<td>주문하신 상품이 없습니다</td>
														</tr>
													</c:otherwise>
												</c:choose>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6">
								<div class="card mb-4">
									<div class="card-header" style="font-size: 1.5em;">
										<i class="bi bi-upc-scan"></i> 보유중인쿠폰
										<button type="button" class="btn btn-outline-secondary"
											style="float: right;">
											<a href="couponDetailForm.do" style="color: black;">더보기</a>
										</button>
									</div>
									<div class="card-body" style="height: 170px;">
										<div class="d-flex justify-content-center">
											<table class="table w-85">
												<c:choose>
													<c:when test="${!empty endList}">
														<c:forEach items="${endList }" var="end">
															<tr>
																<td>${end.couponName }</td>
																<td>${end.discountPct }%할인</td>
																<td style="text-align: center;"><fmt:formatDate
																		value="${end.endDate}" pattern="yy/MM/dd  "></fmt:formatDate></td>
																<td
																	style="text-align: center; color: red; font-weight: bold;">만료예정</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<td>만료예정인 쿠폰이 없습니다.</td>
														</tr>
														<tr>
															<td>더보기를 눌러 보유쿠폰을 확인해주세요</td>
														</tr>
													</c:otherwise>
												</c:choose>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6">
								<div class="card mb-4">
									<div class="card-header" style="font-size: 1.5em;">
										<i class="bi bi-box-seam"></i> 상품문의
										<button type="button" class="btn btn-outline-secondary"
											style="float: right;">
											<a href="myProdQnaDetailForm.do" style="color: black;">더보기</a>
										</button>
									</div>
									<div class="card-body" style="height: 170px;">
										<div class="d-flex justify-content-center">
											<table class="table w-85" style="table-layout:fixed;">
												<c:choose>
													<c:when test="${!empty qnaList}">
														<tr>
															<c:forEach items="${qnaList }" var="qnaList">
																<tr>
																	<td style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${qnaList.qnaType }</td>
																	<td style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${qnaList.title }</td>
																	<td><fmt:formatDate value="${qnaList.registDate}"
																			pattern="yy/MM/dd"></fmt:formatDate></td>
																	<c:choose>
																		<c:when test="${qnaList.qnaState == 0 }">
																			<td style="color:gray; font-weight:bold;">답변대기</td>
																		</c:when>
																		<c:otherwise>
																			<td style="color:blue; font-weight:bold;">답변완료</td>
																		</c:otherwise>
																	</c:choose>
																</tr>
															</c:forEach>
														</tr>
													</c:when>
													<c:otherwise>
														<tr>
															<th>작성한 문의글이 없습니다.</th>
														</tr>
													</c:otherwise>
												</c:choose>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xl-6">
								<div class="card mb-4">
									<div class="card-header" style="font-size: 1.5em;">
										<i class="bi bi-chat-left-text"></i> 최근작성리뷰
										<button type="button" class="btn btn-outline-secondary"
											style="float: right;">
											<a href="myReviewDetailForm.do" style="color: black;">더보기</a>
										</button>
									</div>
									<div class="card-body" style="height: 170px;">
										<div class="d-flex justify-content-center">
											<table class="table w-85" style="table-layout:fixed;">
												<c:choose>
													<c:when test="${!empty recentReviewList}">
														<tr>
															<c:forEach items="${recentReviewList }" var="rereList">
																<tr>
																	<td style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${rereList.productName }</td>
																	<td style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${rereList.content }</td>
																	<td><fmt:formatDate value="${rereList.reviewDate}"
																			pattern="yy/MM/dd"></fmt:formatDate></td>

																</tr>
															</c:forEach>
														</tr>
													</c:when>
													<c:otherwise>
														<tr>
															<th>작성한 리뷰가 없습니다.</th>
														</tr>
													</c:otherwise>
												</c:choose>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
				</div>

			</div>
		</div>
</section>


<script src="adminResource/assets/demo/chart-area-demo.js"></script>
<script src="adminResource/assets/demo/chart-bar-demo.js"></script>
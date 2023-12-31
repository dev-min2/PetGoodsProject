<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<style>
	#arrow{
		position:relative;
		top:10px;
		width: 10px;
		height: 10px;
		border-top: 2px solid black;
		border-left: 2px solid black;
		transform:rotate(45deg);
		}
	#text1{
		position: relative;
		left: 20px;
		bottom: 10px;
		}
		
	#btn-back-to-top {
		  display: none;
		  position: fixed;
		  bottom: 20px;
		  right: 30px;
		  z-index: 9999;
		  border: none;
		  outline: none;
		  background-color: #555;
		  color: white;
		  cursor: pointer;
		  padding: 15px;
		  border-radius: 40%;
	}
	
	#btn-back-to-top:hover {
	  background-color: #333;
	}
	#detail{
		overflow:scroll;
		height:1000px;
	}
	
	#more{
		border:none;
		width:45%;
		height:50px;
		background: #f4f4f4;
		color:grey;
	}
	#close{
		display:none;
		border:none;
		width:45%;
		height:50px;
		background: #f4f4f4;
		color:grey;
	}
	
	.reviewNoneToggle{
		display: none;
	}

	.off-screen {
   display: none;
}

#pagebtn {
   width: 500px;
   text-align: center;
   margin: 0 auto;
   height: 50px;
   line-height: 60px;
}

#pagebtn a {
   all: initial;
   display: inline-block;
   margin-right: 10px;
   border-radius: 3px;
   border: none;
   font-family: Tahoma;
   background: #f9fafe;
   color: #000;
   text-decoration: none;
   height: 40px;
   width: 40px;
   text-align: center;
   line-height: 40px;
   transition: all .5s;
}

#pagebtn a:hover {
   background-color: #6553C1;
}

#pagebtn a.active {
   background: #6553C1;
   color: #fff;
}
   
</style>
</head>
<section class="py-5" id="top">

	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
			<c:choose>
				<c:when test="${type eq 0}">
					<c:set var="petType" value="dog" />
				</c:when>
				<c:otherwise>
					<c:set var="petType" value="cat" />
				</c:otherwise>
			</c:choose>
				<img class="card-img-top mb-5 mb-md-0" src="productImage/${petType }/${pno.productImage }" alt="..."/>
			</div>
			<div class="col-md-6">
				<h1 class="display-5 fw-bolder">${pno.productName }</h1>
				<c:set var="sum" value="0.0"/>				
				<c:forEach items="${Rlist }" var="clist" varStatus="status">
					<c:set var="sum" value="${sum + clist.starCnt}"></c:set>
				</c:forEach>
				<c:out value="★${Math.floor(sum/RlistSize*10)/10}"/>
				<div class="fs-5 mb-5">
					<span style="font-size: 30px">₩ ${pno.productPrice }</span><br>
				</div>
				<div>
					<img src="commonResource/image/mainIcon/${petType }Icon.png" alt="dog" style="width:30px;height:30px;">빠른디어배송
					<p style="margin-left:20px;margin-bottom:0;color:black">무료배송 (30,000원 이상 구매 시)</p>
					<p id="today" style="margin-left:20px;margin-bottom:0;color:black">오늘 주문 시 ${day }출발</p>
					<br>
				</div>
				<script>
					date = new Date();
					day = date.getDate();
					month = date.getMonth();
					document.getElementById('today').innerHTML= '오늘 주문시 '+(month+1)+'월 ' + (day+1)+'일에 출발';
					
					window.addEventListener('scroll', () => {
						  // 스크롤 위치가 100px 이상일 때 위로 가기 버튼을 보이게 함
						  if (
						    document.body.scrollTop > 100 ||
						    document.documentElement.scrollTop > 20
						  ) {
						    document.getElementById('btn-back-to-top').style.display = 'block';
						  } else {
						    document.getElementById('btn-back-to-top').style.display = 'none';
						  }
						});


				</script>
				<p class="lead">${pno.productDesc }</p>
				<br>
				<div class="d-flex">
					<c:choose>
						<c:when test="${pno.productStock==0 }">
							<p style="color:red">품절되었습니다</p>
						</c:when>
						<c:otherwise>
							<input id="inputQuantity" type="number" pattern="[0-9]*"
								style="margin: 5px; padding: 5px; border-radius: 5px;"
								data-hook="number-input-spinner-input" aria-label="Quantity"
								max="99" min="1" value="1" name="cnt">
							<c:choose>
								<c:when test="${empty uno }">
									<button class="btn btn-outline-dark flex-shrink-0" type="button" onclick="location.href='loginForm.do'">
									<i class="bi-cart-fill me-1"></i> Add to cart</button>
								</c:when>
								<c:otherwise>
									<button class="btn btn-outline-dark flex-shrink-0" onclick="functionCart()">
									<i class="bi-cart-fill me-1"></i> Add to cart</button>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</div>
				<script>
				function functionCart() {
					let pno = ${pno.productNo};
					let stock = ${pno.productStock};
					let count = document.getElementById('inputQuantity').value;
					let cnt = ${mvo.selectCnt};
					
					if(stock<(parseInt(count)+cnt)){
						alert('장바구니에 담아놓은 갯수는 '+cnt+'개이며 현재 남은 재고량은 '+stock+'개입니다!')
					}else{
						fetch('cartCheck.do?pno='+pno+'&uno='+${uno})
						.then(resolve=>resolve.json())
						.then(result=>{
							if(result.retCode=='OK'){
									fetch('updateCart.do?pno='+pno+'&uno='+${uno}+'&cnt='+count)
									.then(resolve=>resolve.json())
									.then(result=>{
										console.log(result)
										if(result.retCode=='OK'){
											alert("장바구니에 추가되었습니다");
											window.location.href = "detailProduct.do?pno="+${pno.productNo }+"&cno="+${pno.categoryNo}+"&type="+${pno.petType};
										}else{
											alert("추가 실패");
										}
									})
							}else{
									fetch('addCart.do?pno='+pno+'&uno='+${uno}+'&cnt='+count)
									.then(resolve=>resolve.json())
									.then(result=>{
										console.log(result)
										if(result.retCode=='OK'){
											alert("장바구니에 추가되었습니다");
											window.location.href = "detailProduct.do?pno="+${pno.productNo }+"&cno="+${pno.categoryNo}+"&type="+${pno.petType};
										}else{
											alert("추가 실패");
										}
									})
							}
						})
					}
				}
				</script>
				<c:if test="${pno.productStock <= 5}">
					<p>(현재 재고량 : ${pno.productStock}개)</p>
				</c:if>
			</div>
		</div>
		<div class="container px-4 px-lg-5 my-5" style="text-align:center;">
			<a
				style="border: none; padding: 10px 50px; color: black; font-size: 18px"
				href="#detail">상품 정보</a> <a
				style="border: none; padding: 10px 50px; color: black; font-size: 18px"
				href="#review">구매 후기(${RlistSize })</a> <a
				style="border: none; padding: 10px 50px; color: black; font-size: 18px"
				href="#qna">문의 게시판</a> <a
				style="border: none; padding: 10px 50px; color: black; font-size: 18px"
				href="#order">취소/교환/반품 안내</a>
			<hr>
		</div>
			<div class="container px-4 px-lg-5 my-5" style="text-align:center;" id="detail">
				<h2 style="font: bolder; font-size: 30px; text-align: left">상품 정보</h2>
				<img id="inlineimg" style="width: 50%;" src="productDetailImage/${petType }/${pno.productImage }" alt=""/>
			</div>
		<hr>

		 <!--리뷰게시판 건드린 부분 -->
      <div id="review" class="reviewTable">
         <h2 style="font: bolder; font-size: 30px; text-align: left">구매 후기</h2>
         <table class = "table" style= text-align:center>
                       <thead >
                          <tr style=text-align:center>
                             <th>리뷰번호</th>
                             <th>상품이름</th>
                             <th>별점</th>
                             <th>작성자</th>
                             <th>등록날짜</th>
                             <th>좋아요</th>
                          </tr>
                       </thead>
                       <tbody>
                       <c:choose>
		                    <c:when test="${not empty Rlist }">
		                          <c:forEach items="${Rlist }" var="review">
		                             <c:set var="i" value="${i+1 }"/>
		                             <tr class="reviewTr">
		                                <td>${i }</td>
		                                <td onclick="reviewDetailShow('${i}')">${review.productName }</td>
		                                
		                                <td>
		                                	<c:forEach begin="1" end="${review.starCnt }"  var="l">
		                                			⭐
		                                	</c:forEach>
		                                </td>
		                                <td>${review.nickName }</td>
		                                <td><fmt:formatDate value ="${review.reviewDate}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
		                                <td>
		                                	<c:choose>
		                                		<c:when test="${not empty uno }">
				                                	<input class="heart"type="button" data-reviewNo="${review.reviewNo }" 
				                                	data-userNo="${review.userNo }" value="${review.reviewLikeCnt}">❤
			                                	</c:when>
			                                	<c:otherwise>
			                                		<input class="needLogin"type="button" data-reviewNo="${review.reviewNo }" 
				                                	data-userNo="${review.userNo }" value="${review.reviewLikeCnt}">❤
			                                	</c:otherwise>
		                                	</c:choose>
		                                </td>
		                             </tr>
		                             <tr class="reviewDetail${i } reviewNoneToggle"><th colspan="3">사진첨부</th>
			                    		<th colspan="3">내용</th>
			                    		</tr>
			                    			<tr class="reviewDetail${i } reviewNoneToggle">
			                    				<td colspan="3">
			                    				<c:choose>
			                    					<c:when test="${review.reviewImage eq null }"><p style="color:gray;">사진을 첨부하지 않았습니다<p></c:when>
			                    					<c:otherwise><img style="width:50%" src="reviewImage/${review.reviewImage }"></c:otherwise>
			                    				</c:choose>
			                    				<br><br>
			                    				</td>
			                    				<td colspan="3">${review.content}</td>
			                    			</tr>
		                          </c:forEach>
	                          </c:when>
	                    		<c:otherwise>
	                    			<tr><td style=color:gray; colspan="6">아직 작성된 리뷰가 없습니다.</td></tr>
	                    		</c:otherwise>
	                    </c:choose>
                       </tbody>
                    </table>
      <!--여기까지 -->

		</div>
		<hr>
		
		<!-- 문의게시판 건드린 부분 -->
		<form action=addUserQnaForm.do name=productDetail method="post">
		<div id="qna" class="qnaTable">
			<h2 style="font: bolder; font-size: 30px; text-align: left">문의
				게시판</h2>
			<table class="table" style="text-align: center">
				<thead>
					<tr>
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
		          <c:when test="${not empty qlist }">
					<c:forEach items="${qlist }" var="qvo">
						<tr class="qnaTr">
							<td>
							<c:choose>
                  				<c:when test="${empty qvo.password }">
                  					전체공개
                  				</c:when>
                  				<c:otherwise>
                  					비밀글
                  				</c:otherwise>
                 			</c:choose>
							</td>
							
							<td class="qnaNocheck">${qvo.qnaNo}</td>
							<td>${qvo.qnaType }</td>
							
							<td class="passcheck" onclick="passCheck('${qvo.password}', '${qvo.qnaNo }')">
                    				<a href=#>${qvo.title }</a> pw:${qvo.password }
                    		</td>
                    		
							<td>${qvo.nickName }</td>
                    		<td><fmt:formatDate value ="${qvo.registDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    			
							<td>
                    			<c:if test="${not empty qvo.qnaNo}">
	                    				<c:choose>
	                    					<c:when test="${qvo.qnaState==1 }" >
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
				</c:when>
				<c:otherwise>
					<tr><td style=color:gray; colspan="7">아직 작성된 문의가 없습니다.</td></tr>
				</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			 <p><input type="submit" value="문의글 작성" >
				<input type="hidden" name=pName value="${pno.productName }" >
				<input type="hidden" name=pNo value="${pno.productNo }">
			</p>
		</div>
		<hr>
		</form>
		<!-- 여기까지 -->
		
		
		<div id="order">
			<div id="arrow"></div>
			<h2 id="text1" onclick="openDiv()" style="font: bolder; font-size: 30px; text-align: left">취소/교환/반품안내</h2>
			<ul>
				<li>주문취소는 '입금대기, 입금완료' 단계에서만 가능합니다.</li>
				<li>주문 내 일부 상품의 부분 취소는 불가능합니다.</li>
				<li>주문취소는 '마이페이지 > 주문 · 배송 > 주문취소 > 주문 상세 보기' 를 통해 직접 취소하실 수 있습니다.</li>
				<li>교환 및 반품은 배송 완료일 기준으로 7일 이내 신청 가능합니다.</li>
				<li>단순변심으로 인한 교환/반품은 고객님께서 배송비를 부담하셔야 합니다.</li>
			</ul>
			<ul id="list" style="display:none">
				<li>제주, 도서산간 지역은 추가 배송비가 발생할 수 있습니다.</li>
				<li>브랜드배송 상품은 판매자 및 상품에 따라 교환/반품 배송비가 다를 수 있으므로 강아지대통령 고객센터로 문의해 주시기 바랍니다.</li>
				<li>교환/반품하려는 상품은 처음 배송한 택배사에서 수거하므로 다른 택배사 이용은 불가능합니다.</li>
				<li>'발송준비중, 발송처리완료' 단계에서는 상품 수령 후 교환 또는 반품만 가능합니다.</li>
				<li>교환/반품 요청 기간이 지난 경우, 주문제작 상품으로 재판매가 불가능한 경우 교환/반품이 불가능합니다</li>
			</ul>
		</div>
		<script>
		function openDiv() {
			if(document.getElementById('list').style.display==='none'){
				document.getElementById('list').style.display='block'
				document.getElementById('arrow').style.transform='rotate(-135deg)'
			}else{
				document.getElementById('list').style.display='none'
				document.getElementById('arrow').style.transform='rotate(45deg)'
			}
		}
		</script>
		<button onclick="location.href='#'" id="btn-back-to-top" title="위로 가기">top</button>

	</div>
</section>
<!-- Related items section-->
<section class="py-5 bg-light">
	<div class="container px-4 px-lg-5 mt-5">
		<h2 class="fw-bolder mb-4">Related products</h2>
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<!-- 상품목록 -->
			<c:choose>
				<c:when test="${empty clist }">
					관련된 상품이 없습니다
				</c:when>
				<c:otherwise>
					<c:forEach items="${clist }" var="cvo" end="3">
						<div class="col mb-5">
							<div class="card h-100">
								<!-- Product image-->
								<c:choose>
									<c:when test="${cvo.productStock==0 }">
										<c:choose>
											<c:when test="${cvo.petType==0 }">
												<img style="opacity:0.5;" class="card-img-top" src="productImage/dog/${cvo.productImage }" alt="..." />
												<h3 style="color:red;position:absolute;top:30%;left:50%;transform: translate(-50%, -50%);">품절</h3>
											</c:when>
											<c:otherwise>
												<img class="card-img-top" src="productImage/cat/${cvo.productImage }" alt="..." />
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${cvo.petType==0 }">
												<img class="card-img-top" src="productImage/dog/${cvo.productImage }" alt="..." />
											</c:when>
											<c:otherwise>
												<img class="card-img-top" src="productImage/cat/${cvo.productImage }" alt="..." />
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">
										<!-- Product name-->
										<h5 class="fw-bolder">${cvo.productName }</h5>
										<!-- Product reviews-->
										<div
											class="d-flex justify-content-center small text-warning mb-2">
										</div>
										<!-- Product price-->
										<span>₩ ${cvo.productPrice }</span>
									</div>
								</div>
								<!-- Product actions-->
								<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto"
											href="detailProduct.do?pno=${cvo.productNo }&cno=${cvo.categoryNo}&type=${cvo.petType}">자세히 보기</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</section>
<input type="hidden" value="${uno }" id="userSessionNo">
<input type="hidden" value="${permission }" id="permission">
<script>

//상품상세페이지에 있는 문의게시판 비밀글
function passCheck(password, qnaNo){
	let userSessionNo = document.querySelector("#userSessionNo").value;
	let permission = document.querySelector("#permission").value;
	if(userSessionNo == ""){//console.log(typeof userSessionNo); 타입확인
		alert("로그인을 먼저 해주시기 바랍니다.")
		window.location.href="loginForm.do";
		return;
	}		

	console.log("password :", password,"   qnaNo: ", qnaNo)
    if(password == "" || permission == "0"){//패스워드가 없거나 관리자일때
    	
    	window.location.href="getUserQnaList.do?qnaNo="+qnaNo;
    	return;
    	
    }else{
    	let inputPassword = prompt('비밀번호를 입력하세요', '0000');
    	if(password == inputPassword){
    		
    		window.location.href="getUserQnaList.do?qnaNo="+qnaNo+"&password="+password;
    		return;
    	}else{
    		alert("비밀번호가 다릅니다.");
    	}
    }
}

//리뷰
//클래스가 heart인 애들을 다 찾아서 각 클릭이벤트를 넣어주겠다.
document.querySelectorAll(".heart").forEach(item => {
	item.addEventListener("click", function(e){
// 		console.log("this : ", this.value);
// 		console.log("this : ", this.dataset['reviewno'], this.dataset['userno'])
		fetch("modifyreviewLikeCnt.do?reviewNo="+this.dataset['reviewno']+"&userNo="+this.dataset['userno']+"&reviewLikeCnt="+this.value)
		   .then(resolve => resolve.json())
		   .then(result =>{
			   console.log(result);
			   if(result==1){
				   this.value= Number(this.value) +1;
			   }
		   })
	})
})

//로그인 안하고 좋아요 누를 시 로그인하라고 뜨는 창
document.querySelectorAll(".needLogin").forEach(item => {
	item.addEventListener("click", function(e){
		alert("로그인이 필요한 기능입니다.")
		window.location.href="loginForm.do";
		return;
	})
})

		//내용과 사진을 숨기고 클릭 시 보여주게 만든다
	function reviewDetailShow(i){
		console.log(document.querySelectorAll(".reviewDetail"+i))
		document.querySelectorAll(".reviewDetail"+i).forEach(item =>{
			console.log("item", item);
			item.classList.toggle("reviewNoneToggle");
		})
	console.log(i);
}

//페이징----------------------------------------------------------------------------------------------
var pageNumber = 5;   
var pageCount = 5;
var currentPage = 1;
//문의 페이징
var qnaTable = document.querySelector('.qnaTable');
var qnaTr = document.querySelectorAll('.qnaTr')

//리뷰 페이징
var reviewTable = document.querySelector(".reviewTable")
var reviewTr = document.querySelectorAll(".reviewTr");

page(pageNumber, pageCount, currentPage, qnaTr, qnaTable);
page(pageNumber, pageCount, currentPage, reviewTr, reviewTable);


function page(pageNumber, pageCount, currentPage, pagingTr, pagingTable) {
 
 var table = pagingTable
 var tr = pagingTr;
 var trTotal = tr.length;   
 if (trTotal == 0)
    return;

 var pageTotal = Math.ceil(trTotal / pageNumber);
 var pageGroup = Math.ceil(currentPage / pageCount);
 var last = pageGroup * pageCount;
 if (last > pageTotal) {
    last = pageTotal;
 }
 var first;
 if (last % pageCount == 0) {
    first = last - (pageCount - 1);
 } else {
    first = last + 1 - last % pageCount
 }

 var next = last + 1;
 var prev = first - 1;

 let prevPagebtn = pagingTable.querySelector('#pagebtn')
 if (prevPagebtn) {
    prevPagebtn.remove();
 }

 var pageBtn = document.createElement("div");

 pageBtn.setAttribute("id", "pagebtn");
 table.append(pageBtn);
 

 if (prev > 0) {
    let aTage = document.createElement("a")
    aTage.setAttribute("href", "#")
    aTage.dataset.value = "prev";
    aTage.innerHTML = "<"
    pageBtn.append(aTage)
 }

 for (let i = first; i <= last; i++) {
    let aTage = document.createElement("a")
    aTage.setAttribute("href", "#")
    aTage.dataset.value = i;
    aTage.innerHTML = i;
    pageBtn.append(aTage)
 }
 if (last < pageTotal) {
    let aTage = document.createElement("a")
    aTage.setAttribute("href", "#")
    aTage.dataset.value = "next"
    aTage.innerHTML = ">"
    pageBtn.append(aTage)
 }
 var paginglink = pageBtn.querySelectorAll('a')
 paginglink.forEach(link => {
  // 각 <a> 태그의 class 리스트에서 'active' 클래스를 제거
     link.classList.remove('active');
 });
 

 var element = pagingTable.querySelector('[data-value="' + currentPage + '"]');
 
 if (element) {
    element.classList.add("active");
 }
 var startval = (currentPage - 1) * pageNumber;
 var endval = startval + pageNumber;




 for (var i = 0; i < tr.length; i++) {
    
    if (i >= startval && i < endval) {
       // opacity와 클래스 설정
       // off-screen 클래스를 제거하고
       tr[i].classList.remove('off-screen');
       tr[i].style.opacity = '1';
    }else{
       tr[i].style.opacity = '0.0';
       tr[i].classList.add('off-screen');
       
    }
 }

 for (let i = 0; i < paginglink.length; i++) {
    paginglink[i].addEventListener('click', function(e) {
       e.preventDefault();
       var thisVal = this;
       var data = thisVal.dataset.value;
       var selectedPage = thisVal.innerText;

       if (data === "next") {
          selectedPage = next;
       }

       if (data === "prev") {
          selectedPage = prev;
       }
       page(pageNumber, pageCount, selectedPage, tr, table)
    });
 }
}
//---------------------------------------------------------------------------------------------------


 
</script>






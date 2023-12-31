<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
    		<!-- jQuery -->
    	
    	
    	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
		
		<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    	 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
		
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
    	<style>
    	    select option[value=""][disabled] {
				display: none;
			}
    		.custom-padding {
    			padding-top: 0.8rem;
    		}
    		.far:hover {
    			color:8B00FF;
    		}
        	.dropdown-submenu {
            	position: relative;
        	}

        	.dropdown-submenu .dropdown-menu {
            	top: 0;
            	left: 100%;
            	margin-top: -6px;
            	margin-left: -1px;
        	}
        	
        	.hoverImg img {
        		transition: all 0.2s linear;
        	}
        	
			.hoverImg:hover img {
				transform: scale(1.2);
			}
			.hoverImg {
				overflow:hidden;
			}
			
    	</style>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>마이디어 펫</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../commonResource/assets/favicon.ico" />
        
        <!-- Core theme JS-->
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="commonResource/css/styles.css" rel="stylesheet" />
        <link href="adminResource/css/styles.css" rel="stylesheet" />
        <link href="commonResource/css/menubar.css" rel="stylesheet" />
        <link href="commonResource/css/owl.carousel.min.css" rel="stylesheet" />  
        <script src="commonResource/js/main.js"></script>
    </head>
    <body>
        <!-- header -->
        <tiles:insertAttribute name="commonHeader"></tiles:insertAttribute>
        <!-- banner-->
        <c:choose>
        	<c:when test="${!empty main }"> <!-- 배너이미지는 메인페이지에서만 등장 -->
   				<tiles:insertAttribute name="commonBanner"></tiles:insertAttribute>
   			</c:when>
   			<c:otherwise>
   				<hr>
   			</c:otherwise>
   		</c:choose>
   		<c:if test="${!empty searchPage }">
   			 <tiles:insertAttribute name="commonMenu"></tiles:insertAttribute>
   		</c:if>
   		<!-- body -->
   		<tiles:insertAttribute name="commonGridBody"></tiles:insertAttribute>
        <!-- Footer-->
        <tiles:insertAttribute name="commonFooter"></tiles:insertAttribute>
    </body>
</html>

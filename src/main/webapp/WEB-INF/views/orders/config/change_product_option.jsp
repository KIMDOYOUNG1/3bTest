<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="kr">
<head>
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title> 주문서 상품 변경 </title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/vendor/fonts/circular-std/style.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/libs/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fonts/fontawesome/css/fontawesome-all.css">
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script type="text/javascript">
    
    	$(function(){
    		$("#productName").focus();
    	});
    </script>
<style>
html, body {
	
}

body {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
}
</style>
</head>
<body>
	<div class="container-fluid  dashboard-content">
		<form id="changeProductAndOptionForm" style="display: none;">
		
		</form>
		<form class="row" name="changeProductOptionListSearchForm" action="<c:url value='/order/matching/product_list_result.do'/>" method="get">
			<input type="hidden" value="${ordersVO.orPk }" id="orPk" name="orFk">
			<input type="hidden" value="${ordersVO.orProduct }" name="orProductName">
			<input type="hidden" value="${ordersVO.orProductOption }" name="orProductOption">
			<input type="hidden" value="${ordersVO.pmFk }" name="pmFk">
			<div class="col-lg-3">
				<select class="form-control" name=cfFk>
					<option value="0">전체 선택</option>
					<c:forEach var="cclist" items="${ccList }">
						<option value="${cclist.cfPk }">${cclist.cfCodeType }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-lg-9">
				<div class="email-search">
					<div class="input-group input-search">
						<input class="form-control" type="text" placeholder="상품 검색" id="productName" name="productName">
						<span class="input-group-btn">
							<button class="btn btn-secondary" id="productSearchButton" type="submit">
								<i class="fas fa-search"></i>
							</button>
						</span>
					</div>
				</div>
			</div>
		</form>
		<hr>
		<div class="row">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" id="productOptionSearchList">
						
					</div>
				</div>
			</div>
		</div>
</body>
<script src="${pageContext.request.contextPath}/resources/libs/js/renewal_matching_manage.js"></script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="inc/top.jsp" %>
    <%@ include file="inc/top_nav.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script src="${pageContext.request.contextPath}/resources/vendor/inputmask/js/jquery.inputmask.bundle.js"></script>
</head>
<body>

<form action= "/doyoungupdateform.do" method="get" id="updateform">
<div style="margin-top:50px;"></div>
<div style="margin:auto; text-align:center;">
<input type="hidden" id="spName" name="spName">
<c:forEach var="spsalOne" items="${spsalOne }">
<div style="background:white; height:50px; padding-top:15px;">${spsalOne.spName } <span style="color:blue">선수</span>의 <span style="color:orange">주급</span>은  <fmt:formatNumber value="${spsalOne.spSal}" pattern="#,###"/> 만원입니다.</div>
</c:forEach>
</div>
<div style="text-align:center; height:300px; background:white;">
<table style="text-align:center; margin:auto; width:300px;">
<c:if test="${empty spsalOne }">
<tr>
<td colspan="4" style="text-align: center;"> <span style="color:blue; font-size:20px;">${spName }</span> 선수는 존재하지 않습니다.</td>
</tr>
<tr>
<td colspan="4" style="text-align: center;"><button style="width:300px; height:50px; border:1px solid green; border-radius:20px; margin-bottom:5px; margin-top:5px;" type="button" onclick="spadd()" >선수 추가</button><br></td>
</tr>
</c:if>

<c:if test="${!empty spsalOne }">
<c:forEach var="spsalOne" items="${spsalOne }">

<tr>
<th>선수 정보</th>
<th>국가</th>
<th>이름</th>
<th>나이</th>
</tr>


<tr>
<td></td>
<td>${spsalOne.spNation }</td>
<td id="t_spName">${spsalOne.spName }</td>
<td>${spsalOne.spAge }</td>
</tr>
</c:forEach>

</c:if>
</table>
<c:forEach var="spsalOne" items="${spsalOne }">
<c:if test="${empty spsalOne }">
</c:if>
<c:if test="${!empty spsalOne }">
<button style="width:300px; height:50px; border:1px solid green; border-radius:20px; margin-bottom:5px; margin-top:5px;" type="submit" >선수 정보 업데이트</button><br>
</c:if>
</c:forEach>
</form>
<!-- <form action="/doyoungview.do" method="get"> -->
<button style="width:300px; height:50px; border:1px solid green; border-radius:20px;" type="button" onclick="winview()" >선수 명단 보기</button><br>
<button style="width:300px; height:50px; border:1px solid green; border-radius:20px; margin-top:5px;" type="button" onClick="history.go(-1)">뒤로가기</button><br>




</div> 
<!-- </form> -->

<%-- <c:set var = "test" value="호날두"/> --%>

<%-- <c:if test = "${fn:contains(test, '두')}"> --%>
<!--          <p>포함합니다.<p> -->
<%--       </c:if> --%>

<%--       <c:if test = "${fn:contains(test, 'ㅋ')}"> --%>
<!--          <p>포함하지 않아요<p> -->
<%--       </c:if> --%>
<!-- </div> -->





</body>
<script type="text/javascript">
$("#updateform").submit(function(){
	var spName = $("#t_spName").text();
	
	$("#spName").val(spName);

});

function spadd(){
	location.href = "/doyoungview.do?spName=${spName }";
}

function winview(){
	window.open("/doyoungview2.do","팝업","width=500,height=600,scrollbars=no");
}

function namu(){
	location.href = "https://namu.wiki/w/%EC%9B%A8%EC%9D%B8%20%EB%A3%A8%EB%8B%88";
}
</script>
</html>
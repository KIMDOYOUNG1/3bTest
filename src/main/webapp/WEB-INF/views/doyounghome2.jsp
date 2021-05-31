<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>인서트 하자</h1>
${ss }
<br>
<c:forEach var="seMM" items="${seMM }">
<div>
${seMM.testname } ${seMM.testpw } ${seMM.testbd } ${seMM.testct }<br>
</div>
</c:forEach>

<c:forEach var="boardview" items="${boardview }">
<div>
${boardview.tbname } ${boardview.tbtitle} ${boardview.tbcomment} ${boardview.tbct} ${boardview.tbregdate}<br>
</div>
</c:forEach>

<br><br>

<c:forEach var="boardview" items="${boardview }">
<div>
<a href="<c:url value = '/doyoungselect2.do?tbnumber=${boardview.tbnumber}'/>">${boardview.tbtitle} ${boardview.tbregdate}</a>
</div>
<hr>
</c:forEach>



<%-- <c:forEach var="boardview" items="${boardview }"> --%>
<!-- <div> -->
<%-- ${boardview.tbname } --%>
<%-- ${boardview.tbtitle } --%>
<%-- ${boardview.tbcomment } --%>
<%-- ${boardview.tbct } --%>
<%-- ${boardview.tdregdate } --%>
<!-- <br> -->
<!-- </div> -->
<%-- </c:forEach> --%>


</body>
<script>
	function zzz(obj){
		console.log(obj);
	}
</script>
</html>
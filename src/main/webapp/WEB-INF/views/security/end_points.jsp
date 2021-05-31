<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>

<title>Endpoint list</title>

</head>

<body>

	<table>
		<thead>
			<tr>
				<th>order</th>
				<th>path</th>
				<th>methods</th>
				<th>consumes</th>
			</tr>
		</thead>
		<tbody>
			<c:set var="i" value="1"/>
			<c:forEach items="${map}" var="obj">
				<tr>
					<th>${i }</th>
					<td>${obj}</td>
					<td>${obj.key.patternsCondition}</td>
					<td>${obj.value}</td>
				</tr>
				<c:set var="i" value="${i + 1 }"/>
				
			</c:forEach>

		</tbody>
	</table>

</body>

</html>
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
<style>
.dc input{
	width:300px;
	height:50px;
}

.dc button{
	width:300px;
	height:50px;
	cursor:pointer;
}
#text {display:none;color:red}
</style>
<script type="text/javascript">
$(function(){
	
	$('form[name=login]').submit(function(){
		var acname = $("#i_acname").val();
		var testname = $("#i_testname").val();
		var testpw = $("#i_testpw").val();
		
		$('#acname').val(acname);
		$('#testname').val(acname);
		$('#testpw').val(testpw);


	});
});
</script>
</head>
<body>
<form method="get" action="/doyounglogin.do" name="login">
<div style="text-align:center; class="dc">

<input type="hidden" name="acname" id="acname">
<input type="hidden" name="testname" id="testname">
<input type="hidden" name="testpw" id="testpw">

<h1>로그인</h1>
<input type="text" name="i_acname" id="i_acname" placeholder="이름" autofocus><br>
<input type="hidden" name="i_testname" id="i_testname">
<input type="password" name="i_testpw" id="i_testpw" placeholder="비밀번호"><br>
<input type="hidden" name="actype" value="1"><br>
<button type="submit">로그인</button>

</div>
</form>
<p id="text">Caps Lock 이 켜져있습니다.</p>
<script>
	


		var input = document.getElementById("testpw");
		var text = document.getElementById("text");
		input.addEventListener("keyup", function(event) {

		if (event.getModifierState("CapsLock")) {
		    text.style.display = "block";
		  } else {
		    text.style.display = "none"
		  }
		});
	
	function zxc(){
opener.parent.location = "/doyounghome.do?acname="
// 		window.close();
		
	}

	function zzz() {
		
		var testpw = document.getElementsByName("testpw")[0];
		var acname = document.getElementsByName("acname")[0];
		var actype = document.getElementsByName("actype")[0];
		
		$('#testname').val(acname.value);
		
		var testname = document.getElementsByName("testname")[0];
				
		
		
		var form = document.createElement("form");
		form.action = "/doyounglogin.do";
		form.post = "get";
		
		form.appendChild(testname);
		form.appendChild(testpw);
		form.appendChild(acname);
		form.appendChild(actype);
				
		document.body.appendChild(form);
		
		form.submit();
		
	}
	
	
   

	
</script>
</html>
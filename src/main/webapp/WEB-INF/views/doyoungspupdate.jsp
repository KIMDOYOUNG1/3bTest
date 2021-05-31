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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
.ip input{
	width:300px;
	height: 50px;
	margin-bottom: 5px;
	border-radius: 30px;
	border:none;
}
.ip input:focus{
outline:none;
}
.ip button{
	width: 300px;
	height:50px;
	border-radius: 30px;
	border:none;
	background:white;
	
	margin-bottom:5px;
	cursor:pointer;
}
</style>
</head>
<body>
<br>
<div class="dashboard-wrapper">
<div class="container-fluid dashboard-content ">
   <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title"> 선수 정보 업데이트 </h2>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link"> 선수 정보 업데이트 </a></li>
                                            <li class="breadcrumb-item active" aria-current="page"> 선수 정보 업데이트 </li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
<div style="text-align:center;" class="ip">
<div><span style="font-size:30px;">${spName }</span> 선수의 정보를 변경해주세요!</div><br>
<input type="hidden" id="spName" name="spName">
<input type="text" name="spName2" id="spName2" value="${spName }" placeholder="이름을 입력해주세요" autofocus><br>
<input type="text" name="spAge" id="spAge" placeholder="나이를 입력해주세요" autofocus><br>
<input type="text" name="spSal" id="spSal" placeholder="주급을 입력해주세요" autofocus><br>

<button type="button" onclick = "sp()">정보 변경</button><br>
<button type="button" onclick = "re()">돌아가기</button>
</div>
</div>
</div>
</body>
<script>
	
	var a = "${spName}";
	
	$('#spName').val(a);
	
	
	function re(){
		
		location.href = "/doyoungspsal.do?spName=${spName}"
		
	}
	
	function sp(){
			
			var spName2 = document.getElementsByName("spName2")[0];
			var spAge = document.getElementsByName("spAge")[0];
			var spSal = document.getElementsByName("spSal")[0];
			
			if(spName2.value == ""){
				alert("빈 칸이 존재합니다.");
			}else if(spAge.value == ""){
				alert("빈 칸이 존재합니다.");
			}else if(spSal.value == ""){
				alert("빈 칸이 존재합니다.");
			}else{	
			var a = confirm("${spName} 선수의 정보를 변경하시겠습니까?");
			
			
			if(a == true){
							
			var spName = document.getElementsByName("spName")[0];
			var spName2 = document.getElementsByName("spName2")[0];
			var spAge = document.getElementsByName("spAge")[0];
			var spSal = document.getElementsByName("spSal")[0];		
			
			var form = document.createElement("form");
			form.action = "/doyoungupdate.do";
			form.post = "get";
			
			
			form.appendChild(spName);
			form.appendChild(spName2);
			form.appendChild(spAge);
			form.appendChild(spSal);			
			
			document.body.appendChild(form);
			
			form.submit();
		}else{
		return false;
		}
	}
}

</script>
</html>
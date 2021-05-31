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
	background:skyblue;
}
.ip input:focus{
outline:none;
}
.ip button{
	width: 300px;
	height:50px;
	border-radius: 30px;
	border:none;
	background:green;
	margin-bottom:5px;
	cursor:pointer;
}
#text {display:none;color:red}
</style>

</head>
<body>
<div class="dashboard-wrapper">
<div class="container-fluid dashboard-content ">
   <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title"> 회원 가입 및 선수 목록 </h2>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link"> 회원가입 </a></li>
                                            <li class="breadcrumb-item active" aria-current="page"> 회원가입 </li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
<div style="text-align:center; height:300px;">
<table style="text-align:center; margin:auto; width:300px; border-collapse:collapse;" border="1px solid black">
<tr>
<th style="width:80px;">선수 정보/순번</th>
<th style="width:80px;">국가</th>
<th style="width:100px;">이름</th>
<th>나이</th>
</tr>
<c:forEach var="spsal" items="${spsal }" varStatus="status">
<tr>
<td>${status.index+1 }</td>
<td><a href="<c:url value='/doyoungspsal.do?spName=${spsal.spName }'/>" onclick="return confirm('${spsal.spName } 선수의 프로필로 이동하시겠습니까?')" style="text-decoration:none; color:black;">${spsal.spNation }</a></td>
<td><a href="<c:url value='/doyoungspsal.do?spName=${spsal.spName }'/>" onclick="return confirm('${spsal.spName } 선수의 프로필로 이동하시겠습니까?')" style="text-decoration:none; color:black;">${spsal.spName }</a></td>
<td><a href="<c:url value='/doyoungspsal.do?spName=${spsal.spName }'/>" onclick="return confirm('${spsal.spName } 선수의 프로필로 이동하시겠습니까?')" style="text-decoration:none; color:black;">${spsal.spAge }</a></td>
</tr>
</c:forEach>

</table>
    <div>
    <h1> 정보를 확인하고 싶은 선수를 검색하세요! </h1>
    <input type="text" list="disneyCharacterList" id="sh" style="width:300px;">
    <datalist id="disneyCharacterList" >
    </datalist>
    
    <button type="button" onclick="sh()" style="border:1px solid black;">검색</button>
    </div>
<hr>
</div>
<br><br><br>
<div style="text-align:center; margin-top:70px;" class="ip">
<input type="text" name="testname" placeholder="이름을 입력해주세요"><br>
<input type="password" name="testpw" id="testpw" placeholder="비밀번호를 입력해주세요"><br>
<input type="text" name="testbd" placeholder="ex)980304"><br>
<input type="text" name="testct" placeholder="국가를 입력해주세요"><br>
<button type="button" onclick = "aaa()">회원가입</button>
<form action="/doyoungloginform.do" method="get">
<span>이미 회원이시라면?</span><br>
<button type="button" onclick="login()">로그인</button>
<p id="text">Caps Lock 이 켜져있습니다.</p>
</form>
</div>
</div>
</div>
<br>


<!-- <input type="hidden" id="ddd" name = "ddd"> -->
<!-- 제목 : <input type="text" name="tbtitle"><br> -->
<!-- 내용 : <input type="text" name="tbcomment"><br> -->
<!-- <button type="button" onclick = "ccc()">클릭</button> -->

<%-- <c:forEach var="seMM" items="${seMM }" varStatus="status"> --%>
    
<%--     <input type="hidden" name="tbname" value="${ss}"> --%>
<!--     <input type="hidden" name="tbct" value="한국"> -->
<%-- </c:forEach> --%>
<!-- <hr> -->

</body>
<script>

function login(){
	window.open("/doyoungloginform.do","로그인","width=300,height=200,left=10%");
}
var input = document.getElementById("testpw");
var text = document.getElementById("text");
input.addEventListener("keyup", function(event) {

if (event.getModifierState("CapsLock")) {
    text.style.display = "block";
  } else {
    text.style.display = "none"
  }
});
	function sp(){
		
			var spName = document.getElementsByName("spName")[0];
			var spSal = document.getElementsByName("spSal")[0];
			
			
			
			var form = document.createElement("form");
			form.action = "/doyoungspsalinsert.do";
			form.post = "get";
			
			
			form.appendChild(spName);
			form.appendChild(spSal);			
			
			document.body.appendChild(form);
			
			form.submit();
	}
	
	
	

	function zzz() {
		
		var test_name = document.getElementsByName("testname")[0];
		var test_pw = document.getElementsByName("testpw")[0];
		var test_bd = document.getElementsByName("testbd")[0];
		var test_ct = document.getElementsByName("testct")[0];
		
		if(test_name.value == ""){
			alert("입력이 안 된 칸이 있습니다.")
		}else if(test_pw.value ==""){
			alert("입력이 안 된 칸이 있습니다.")
		}else if(test_bd.value == ""){
			alert("입력이 안 된 칸이 있습니다.")
		}else{
		var form = document.createElement("form");
		form.action = "/doyoung.do";
		form.post = "get";
		
		form.appendChild(test_name);
		form.appendChild(test_pw);
		form.appendChild(test_bd);
		form.appendChild(test_ct);
		
		document.body.appendChild(form);
		
		form.submit();
		}
	}
	
function ccc() {
	var a = document.getElementsByName("tbname")[0];
	var b = document.getElementsByName("tbct")[0];
		var tbtitle = document.getElementsByName("tbtitle")[0];
		var tbcomment = document.getElementsByName("tbcomment")[0];
		
		
		
		var form = document.createElement("form");
		form.action = "/doyoungboardinsert.do";
		form.post = "get";
		
		
		form.appendChild(a);
		form.appendChild(b);
		form.appendChild(tbtitle);
		form.appendChild(tbcomment);
		
		document.body.appendChild(form);
		
		form.submit();
		}
	function aaa(){
		
		Swal.fire({
			  title: '회원가입 하시겠습니까?',
			  text: "회원가입 동시에 개인정보는 저장되며 회원탈퇴 및 1년간 접속이 없으면 자동 파기됩니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '예',
			  cancelButtonText : "아니오",
				  footer: '<div onclick="login()" style="cursor:pointer;">이미 회원이세요?</div>'
			}).then((result) => {
			  if (result.isConfirmed) {
		
				  var test_name = document.getElementsByName("testname")[0];
					var test_pw = document.getElementsByName("testpw")[0];
					var test_bd = document.getElementsByName("testbd")[0];
					var test_ct = document.getElementsByName("testct")[0];
					let a = test_name.value;
					let b = test_pw.value;
					let c = test_bd.value;
					let d = test_ct.value;
					if(a == ""){
						alert("빈 칸이 존재합니다.");
					}else if(b == ""){
						alert("빈 칸이 존재합니다.");
					}else if(c == ""){
						alert("빈 칸이 존재합니다.");
					}else if(d == ""){
						alert("빈 칸이 존재합니다.");
					}else{
						var form = document.createElement("form");
						form.action = "/doyoung.do";
						form.post = "get";
						
						form.appendChild(test_name);
						form.appendChild(test_pw);
						form.appendChild(test_bd);
						form.appendChild(test_ct);
						
						document.body.appendChild(form);
						
						form.submit();
			
					}
							  }else{
				  Swal.fire({
					  icon: 'error',
					  title: 'Oops...',
					  text: '다음엔 꼭 만나요!',
					})
			  }
			})
	}
	
	function sh(){
		
		let a = document.getElementById('sh');
		location.href = "/doyoungspsal.do?spName="+a.value;
	}
</script>
</html>
<!-- /page content -->
        <%@ include file="inc/bottom.jsp" %>
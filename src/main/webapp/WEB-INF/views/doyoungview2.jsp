<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="inc/top.jsp" %>
    <%@ include file="inc/top_nav.jsp" %>
    <style type="text/css">
    	.renewal-store-list{
    		cursor: pointer;
    	}
    </style>
    <script type="text/javascript">
    $(function(){
		
		$('form[name=insspsal]').submit(function(){
			var spName = $("#i_spName").val();
			var spSal = $("#i_spSal").val();
			var spNation = $("#i_spNation").val();
			var spAge = $("#i_spAge").val();
			
			
			if(spName == ''){
				alert("선수명이 입력되지 않았습니다.");
				$("#i_spName").focus();
				
				return false;
				
			}else if(spSal == ''){
				alert("주급이 입력되지 않았습니다.");
				$("#i_spSal").focus();
					return false;
				}
		
			$("#spName").val(spName);
			$("#spSal").val(spSal);
			$("#spNation").val(spNation);
			$("#spAge").val(spAge);

		});
	});

    </script>
    
        <!-- page content -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- pageheader  -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title"> 선수 목록 및 추가 </h2>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link"> 설정 </a></li>
                                            <li class="breadcrumb-item active" aria-current="page"> 판매처 설정 </li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end pageheader  -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="row">
                            	<div class="offset-md-2 col-md-4 mb-4">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="d-flex justify-content-between align-items-center mb-0">
                                                        <span class="text-muted">등록된 선수</span>
                                          <span class="badge badge-secondary badge-pill">${sp } 명</span>
                                                 </h4>
                                        </div>
                                        <div class="card-body">
                                            <ul class="list-group mb-3">
                                            	<c:if test="${!empty spsal  }">
                                            		<c:forEach var="spsal" items="${spsal }" begin="0" end="10">
                                            			<li class="list-group-item d-flex justify-content-between">
		                                                    <div>
		                                                        <a class="my-0 renewal-store-list" href="<c:url value='/doyoungspsal.do?spName=${spsal.spName }'/>">${spsal.spName }</a>
		                                                    </div>
		                                                    <span class="text-muted"> <fmt:formatNumber value="${spsal.spSal}" pattern="#,###"/> </span>		                                                    
		                                                </li>
                                            		</c:forEach>
                                            	</c:if>
                                            	<c:if test="${empty spsal }">
                                            		<li class="list-group-item d-flex justify-content-between">
		                                                    <div>
		                                                        <h6 class="my-0"> 등록된 선수가 없습니다. </h6>
		                                                    </div>
		                                                </li>
                                            	</c:if>
                                            </ul>
                                        </div>
                                    </div>
                                    <button type="button" onclick="cl()" style="margin-left:15px; width:420px; height:50px; background:white; font-size:30px; border-radius:20px;">닫기</button>
                                </div>
                                
                <script>
                
                function cl(){
                	window.close();
                }
                function del(){
                	
                	let spName = prompt("삭제 하실 선수의 이름을 입력해주세요.");
                		
                	if(spName == null){
                		return;
                	}else if(spName == ""){
                	     alert("선수명을 입력해주세요.")	
                	}else{
                		location.href = "/doyoungspdelete.do?spName="+spName
                	}
                			
                }
                </script>
        <!-- /page content -->
        <%@ include file="inc/bottom.jsp" %>
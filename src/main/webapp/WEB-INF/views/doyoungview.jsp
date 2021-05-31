<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="inc/top.jsp" %>
    <%@ include file="inc/top_nav.jsp" %>
    <style type="text/css">
    	.renewal-store-list{
    		cursor: pointer;
    	}
a.tip {
    position: relative;
}

a.tip span {
    display: none;
    position: absolute;
    top: 20px;
    left: -10px;
    width: 125px;
    padding: 5px;
    z-index: 100;
    background: #000;
    color: #fff;
    -moz-border-radius: 5px; /* 파폭 박스 둥근 정도 */
    -webkit-border-radius: 5px; /* 사파리 박스 둥근 정도 */
}

a:hover.tip span {
    display: block;
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
                                            		<c:forEach var="spsal" items="${spsal }">
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
                                </div>
                                <div class="col-md-4">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="mb-0"> 선수 추가하기  </h4>
                                        </div>
                                        <div class="card-body">
                                            <form class="needs-validation" id="insspsal" name="insspsal" action="<c:url value='/doyoungspsalinsert.do'/>" method="get">
                                            	<input type="hidden" name="spName" id="spName">
												<input type="hidden" name="spSal" id="spSal">
												<input type="hidden" name="spNation" id="spNation">
												<input type="hidden" name="spAge" id="spAge">
                                            	<div class="row">
                                                    <div class="col-md-12 mb-3">
                                                        <label for="firstName"> 선수명 </label>
                                                        <input type="text" class="form-control" name="i_spName" id="i_spName" placeholder="선수 이름을 적어주세요" value="${spName }" required>
                                                        <div class="invalid-feedback">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 mb-3">
                                                        <label for="firstName"> 국가 </label>
                                                        <input type="text" class="form-control" name="i_spNation" id="i_spNation" placeholder="국가를 적어주세요" value="" required>
                                                        <div class="invalid-feedback">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 mb-3">
                                                        <label for="firstName"> 나이 </label>
                                                        <input type="text" class="form-control" name="i_spAge" id="i_spAge" placeholder="나이를 적어주세요" value="" required>
                                                        <div class="invalid-feedback">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 mb-3">
                                                        <label for="firstName"> 주급 </label>
                                                        <input type="text" class="form-control" name="i_spSal" id="i_spSal" placeholder="주급을 적어주세요" value="" required>
                                                        <div class="invalid-feedback">

                                                        </div>
                                                    </div>
                                                </div>
                                                <hr class="mb-4">
                                                <button class="btn btn-primary btn-lg btn-block" type="submit" style="margin-bottom:5px;"> 선수 추가하기 </button>
                                            </form>
                                                <button class="btn btn-primary btn-lg btn-block" onclick="del()"> 입력한 선수 삭제하기 </button>
                                                <button class="btn btn-primary btn-lg btn-block" onclick="nap()"> 국가 추가하기 </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
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
                
                function nap(){
                	
                	location.href="/doyoungnationList.do";
                	
                }
                </script>
        <!-- /page content -->
        <%@ include file="inc/bottom.jsp" %>
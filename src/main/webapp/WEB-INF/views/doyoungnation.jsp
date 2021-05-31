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
                                <h2 class="pageheader-title"> 국가 리스트 </h2>
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
                                                        <span class="text-muted">등록된 국가</span>
<%--                                           <span class="badge badge-secondary badge-pill">${sp } 명</span> --%>
                                                 </h4>
                                        </div>
                                        <div class="card-body">
                                            <ul class="list-group mb-3">
                                            	<c:if test="${!empty nationList  }">
                                            		<c:forEach var="nationList" items="${nationList}" varStatus="status">
                                            			<li class="list-group-item d-flex justify-content-between">
		                                                    <div>
		                                                        <a class="my-0 renewal-store-list">${status.index+1}</a>
		                                                    </div>
		                                                    <span class="text-muted"> ${nationList.ntName} </span>		                                                    
		                                                </li>
                                            		</c:forEach>
                                            	</c:if>
                                            	<c:if test="${empty nationList }">
                                            		<li class="list-group-item d-flex justify-content-between">
		                                                    <div>
		                                                        <h6 class="my-0"> 등록된 국가가 없습니다. </h6>
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
                                            <form class="needs-validation" id="insspsal" name="insspsal" action="<c:url value='/doyounginsnation.do'/>" method="get">
                                        
                                            	<div class="row">
                                                    <div class="col-md-12 mb-3">
                                                        <label for="firstName"> 국가명 </label>
                                                        <input type="text" class="form-control" name="ntName" id="ntName" placeholder="국가 이름을 적어주세요" required>
                                                        <div class="invalid-feedback">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 mb-3">
                                                        <label for="firstName"> 국가코드 </label>
                                                        <input type="text" class="form-control" name="ntCode" id="ntCode" placeholder="국가코드를 적어주세요" required>
                                                        <div class="invalid-feedback">

                                                        </div>
                                                    </div>
                                                </div>
                                                <hr class="mb-4">
                                                <button class="btn btn-primary btn-lg btn-block" type="submit" style="margin-bottom:5px;"> 국가 추가하기 </button>
                                                <button class="btn btn-primary btn-lg btn-block" type="button" style="margin-bottom:5px;" onClick="history.go(-1)" > 뒤로 가기  </button>
                                            </form>
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
                </script>
        <!-- /page content -->
        <%@ include file="inc/bottom.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="inc/top.jsp" %>
    <%@ include file="inc/top_nav.jsp" %>
<script>
</script>	
<div class="row">
                            	<div class="offset-md-2 col-md-4 mb-4">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="d-flex justify-content-between align-items-center mb-0">
                                                        <span class="text-muted">등록된 판매처</span>
                                          <span class="badge badge-secondary badge-pill"></span>
                                                 </h4>
                                        </div>
                                        
                                        <div class="card-body">
                                            <ul class="list-group mb-3">
                                            			
                                            		<c:forEach var="boardview" items="${boardview}">
                                            			<li class="list-group-item d-flex justify-content-between">
		                                                    <div>
		                                                        <a class="my-0 renewal-store-list" e>${boardview.tbtitle}</a>
		                                                    </div>
		                                                    <span class="text-muted"> ${boardview.tbregdate } </span>
		                                                </li>
		                                                </c:forEach>
                                            	
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="mb-0"> 판매처 추가하기  </h4>
                                        </div>
                                        <div class="card-body">
                                            <form class="needs-validation" id="addStores" name="addStores" action="/config/store/add_store.do" method="post">
                                            	<input type="hidden" name="ssName" id="ssName">
                                            	<input type="hidden" name="ssStoreNickname" id="ssStoreNickname">
                                            	<input type="hidden" name="ssStoreId" id="ssStoreId">
                                            	<input type="hidden" name="ssStorePassword" id="ssStorePassword">
                                            	<input type="hidden" name="ssAuthKey" id="ssAuthKey">
                                            	<input type="hidden" name="ssCommission" id="ssCommission">
                                            	<input type="hidden" name="ssStoreUrl" id="ssStoreUrl">
                                            	<div class="row">
                                                    <div class="col-md-12 mb-3">
                                                        <label for="firstName"> 판매처명 </label>
                                                        <input type="text" class="form-control" name="v_ssName" id="v_ssName" placeholder="" value="" required="">
                                                        <div class="invalid-feedback">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 mb-3">
                                                        <label for="firstName"> 판매처별칭 </label>
                                                        <input type="text" class="form-control" name="v_ssStoreNickname" id="v_ssStoreNickname" placeholder="" value="" required="">
                                                        <div class="invalid-feedback">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 mb-3">
                                                        <label for="firstName"> 판매처 아이디</label>
                                                        <input type="text" class="form-control" name="v_ssStoreId" id="v_ssStoreId" placeholder="" value="">
                                                        <div class="invalid-feedback">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 mb-3">
                                                        <label for="firstName"> 판매처 비밀번호 </label>
                                                        <input type="password" class="form-control" name="v_ssStorePassword" id="v_ssStorePassword" placeholder="">
                                                        <div class="invalid-feedback">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 mb-3">
                                                        <label for="firstName"> 판매처 비밀번호 확인 </label>
                                                        <input type="password" class="form-control" name="v_ssStorePasswordDupl" id="v_ssStorePasswordDupl" placeholder="">
                                                        <div class="invalid-feedback">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 mb-3">
                                                        <label for="firstName"> 인증키 ( Auth-key )</label>
                                                        <input type="text" class="form-control" name="v_ssAuthKey" id="v_ssAuthKey" placeholder="">
                                                        <div class="invalid-feedback">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 mb-3">
                                                        <label for="firstName"> 판매처 기본 수수료 </label>
                                                        <input type="text" class="form-control" name="v_ssCommission" id="v_ssCommission" placeholder="" value="0">
                                                        <div class="invalid-feedback">

                                                        </div>
                                                    </div>
                                                </div>
                                                <h4 class="mb-3"> 데이터 자동화 여부 </h4>
                                                <div class="d-block my-3">
                                                    <div class="custom-control custom-radio">
                                                        <input id="credit" name="ssAutoInsert" type="radio" class="custom-control-input" value="1" checked="checked">
                                                        <label class="custom-control-label" for="credit"> 자동 </label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input id="debit" name="ssAutoInsert" type="radio" class="custom-control-input" value="0" required="">
                                                        <label class="custom-control-label" for="debit"> 수동 </label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 mb-3">
                                                        <label for="firstName"> 판매처 주소 ( http:// https:// 까지 다 적어야함)</label>
                                                        <input type="text" class="form-control" name="v_ssStoreUrl" id="v_ssStoreUrl" placeholder="">
                                                        <div class="invalid-feedback">

                                                        </div>
                                                    </div>
                                                </div>
                                                <hr class="mb-4">
                                                <button class="btn btn-primary btn-lg btn-block" type="submit"> 판매처 추가하기 </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /page content -->
        <%@ include file="inc/bottom.jsp" %>
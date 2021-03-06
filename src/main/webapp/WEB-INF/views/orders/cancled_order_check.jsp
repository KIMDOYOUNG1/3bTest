<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../inc/top.jsp" %>
    <%@ include file="../inc/top_nav.jsp" %>
    <script type="text/javascript">
    	$(function(){
    		
    		$("#orPkAllSelect").click(function(){
    			
    			if($(this).is(":checked")){
    				$("input[name=orPk]").prop("checked","checked");
    				
    			}else{
    				$("input[name=orPk]").prop("checked","");
    				
    			}
    			
    		});
    		
    		$("#ssPk").change(function(){
    			if($(this).val() == 14){
    				$("#smartstore").hide();
    				$("#autoStore").show();
    				
    				
    			}else{
    				$("#smartstore").show();
    				$("#autoStore").hide();

    			}
    			
    		});
    		
    		$("input[name=orPk]").click(function(){
    			
    			if($(this).is(":checked")){
    				
    				
    			}else{
    				
    				if($("#orPkAllSelect").is(":checked")){
    					$("#orPkAllSelect").prop("checked","");
    					
    				}
    			}
    			
    			/*		if($("#orSeiralSpecialNumberAllSelect").is(":checked")){
    				$("input[name=orSerialSpecialNumberList]").prop("checked","checked");
    			}else{
    				$("input[name=orSerialSpecialNumberList]").prop("checked","");
    			}
    			*/
    			
    		});
    		
    	});
    </script>
    
        <!-- page content -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="container-fluid  dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title"> ?????? ?????? ????????? </h2>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="javascript:void(0);" class="breadcrumb-link"> ?????? ?????? ?????? </a></li>
                                        <li class="breadcrumb-item  active" aria-current="page"><a href="javascript:void(0);" class="breadcrumb-link"> ?????? ?????? ?????? </a></li>
                                        
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                	<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="card" style="background-color: #efeff6;">
								<div class="card-body">
									<h4> ????????? ?????? ?????? </h4>
									<a href="<c:url value='/orders/order_page.do'/>" class="btn btn-success"> ????????? ??????</a>
									<a href="<c:url value='/order/config/search_except_addr_order.do'/>" class="btn btn-success"> ?????? ?????? ??????  </a>
									<a href="<c:url value="/order/matching/products_matching.do"/>" class="btn btn-success"> ?????? ?????? </a> 
									<a href="<c:url value="/order/matching/option_matching.do"/>" class="btn btn-success"> ?????? ?????? </a>
									<a href="<c:url value='/config/freebie/apply.do'/>" class="btn btn-success"> ????????? ??????  </a>    
									<a href="<c:url value='/orders/delivery_msg_check.do'/>" class="btn btn-success"> ???????????? ?????? </a>
									<a href="<c:url value='/stock/stk_check.do'/>" class="btn btn-success"> ?????? ?????? </a> 
									<a href="<c:url value='/orders/cancled_order_check.do'/>" class="btn btn-success blinking"> ?????? ??????  </a>
									<a href="<c:url value='/security/epost.do'/>" class="btn"> ?????? ??????  </a> 
								</div>
							</div>
						</div>
					</div>
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="card">
                                <h5 class="card-header"> ?????? ????????? ?????? ( ???????????? ?????? ????????? ???????????? ) </h5>
                                <div class="card-body">
                                    <form id="form" method="post" action="<c:url value='/orders/cancled_order_check.do'/>" enctype="multipart/form-data">
                                        <div class="form-group row">
                                            <div class="col-3 col-lg-2 col-form-label text-right">
                                            	<select class="custom-select d-block w-100" id="ssPk" name="ssPk">
													<c:if test="${!empty storeList }">
														<c:forEach var="storelist" items="${storeList }">
															<option value="${storelist.ssPk }">${storelist.ssName }</option>
														</c:forEach>
													</c:if>
													<c:if test="${empty storeList }">
														<option value="0">?????? ????????? ???????????? ?????? ?????? ????????????.</option>
													</c:if>
												</select> 
                                            </div>
                                            
                                            <div class="col-9 col-lg-10 col-form-label">
                                                <input id="smartstore" type="file" name="excelfile" class="form-control">
                                                <input id="autoStore" type="text" name="" class="form-control" style="display: none;" value="????????? ????????? ???????????????" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="row pt-2 pt-sm-5 mt-1">
                                            <div class="col-sm-6 offset-6">
                                                <p class="text-right">
                                                    <button type="submit" class="btn btn-space btn-danger"> ?????? ?????? </button>
                                                </p>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
					</div>				
					
						<div class="row">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	                            <div class="card">
	                                <h5 class="card-header">  ?????? ????????? ?????? </h5>
	                                <div class="card-body">
	                                	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb-2">
	                                		<button class="btn btn-success btn-xs  mb-2" type="button" id="deleteCancledOrder"> ?????? ?????? ???????????? </button>
	                                	</div>
	                                    <table class="table table-hover">
	                                        <thead>
	                                            <tr>
	                                                <th scope="col">
	                                                	<label class="custom-control custom-checkbox be-select-all">
								                        	<input class="custom-control-input chk_all" type="checkbox" name="chk_all" id="orPkAllSelect"><span class="custom-control-label"></span>
								                        </label>
	                                                </th>
	                                                <th scope="col">?????????</th>
	                                                <th scope="col">?????????</th>
	                                                <th scope="col">??????</th>
	                                                <th scope="col">??????</th>
	                                                <th scope="col">??????</th>
	                                                <th scope="col">????????????</th>
	                                            </tr>
	                                        </thead>
	                                        
	                                        <tbody>
	                                        	<c:if test="${empty cancleCheckFlag and empty cancledOrderList }">
	                                        		 <tr>
	                                        		 	<td colspan="7" style="text-align: center;"> ??????????????? ??????????????????</td>
	                                        		 </tr>
	                                        		 
	                                        	</c:if>
	                                        	
	                                        	
	                                        	
	                                        	<c:if test="${cancleCheckFlag == true and empty cancledOrderList }">
	                                        		 <tr>
	                                        		 	<td colspan="7" style="text-align: center;"> ?????????????????? ???????????? ????????????</td>
	                                        		 </tr>
	                                        	</c:if>
	                                        	
	                                        	
	                                        	<c:if test="${cancleCheckFlag == true and !empty cancledOrderList }">	     
	                                        		<tr>
			                                        	<td colspan="7" style="text-align: center;"> ?????? ???????????? ?????? ????????? ??????????????? ??? ?????????????????? ???????????? ???????????? ???????????? </td>
			                                        </tr>                                   	
		                                        	<c:forEach var="cancleList" items="${cancledOrderList }">
		                                        		<tr>
			                                                <th scope="row">
			                                                	<label class="custom-control custom-checkbox be-select-all">
			                                                		<input class="custom-control-input chk_all" type="checkbox" name="orPk" value="${cancleList.orPk }">
			                                                		<span class="custom-control-label"></span>
			                                                	</label>
			                                                </th>
			                                                <td>
			                                                	${cancleList.orBuyerName } <br>
			                                                	${cancleList.orBuyerContractNumber1 }
			                                                </td>
			                                                <td>
			                                                	${cancleList.orReceiverName } <br>
			                                                	${cancleList.orReceiverContractNumber1 }
			                                                </td>
			                                                <td>
			                                                	${cancleList.orShippingAddress } ${cancleList.orShippingAddressDetail }
			                                                </td>
			                                                <td>
			                                                	${cancleList.orProduct } <br>
			                                                	${cancleList.orProductOption }
			                                                </td>
			                                                <td>
			                                                	${cancleList.orAmount }
			                                                </td>
			                                                <td>
			                                                	<button class="btn btn-outline btn-success" value="${cancleList.orSerialSpecialNumber }"> ?????? </button>
			                                                </td>
			                                            </tr>
		                                        	</c:forEach>
	                                        	</c:if>
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                        </div>
						</div>
	            </div>
	             <iframe id="cancledOrderIframe" width="0" height="0" style="display: none;">
                    	
                    	
				</iframe>
        <!-- /page content -->
        <%@ include file="../inc/bottom.jsp" %>
<script type="text/javascript">
	$(function(){
			
		$(document).on('click', '#deleteCancledOrder', function(){

			
			var orPkSize = $("input[name=orPk]:checked").length;
			
			if(orPkSize > 0){
				
				if(confirm("?????? ???????????? ???????????????????????????????")){
					var counting = 0;
					
					var divForm = document.createElement("form");
					divForm.id="deleteCancledOrderForm";
					
					$("#cancledOrderIframe").html(divForm);
					
					for(var i=0; i<orPkSize; i++){
						
						var orPk = document.createElement("input");
						orPk.name="orVoList["+counting+"].orPk";
						orPk.type="hidden";
						orPk.value=$("input[name=orPk]:checked")[i].value;
						$("#deleteCancledOrderForm").append(orPk);	
						counting++;
					}
					
					var deleteCancledOrderFormParams = jQuery("#deleteCancledOrderForm").serialize();
					
					console.log(deleteCancledOrderFormParams);
					$.ajax({
					    type       : 'POST',
					    url        : '/orders/update_cancled_order.do',
					    data       : deleteCancledOrderFormParams,
					    success    : function(data){
					    	alert(data+" ??? ?????? ?????? ??????");
					    	location.reload();
					    }
					});
				}
			}
			
		});
		
	});

</script>
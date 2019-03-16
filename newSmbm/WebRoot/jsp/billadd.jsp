<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "providers",
			type : "GET",
			dataType : "json",
			success : function(result) {
				var role = $("#providerId");
				var str = "<option value='0'>--请选择--</option>";
				for ( var i = 0; i < result.length; i++) {
					str += "<option value="+result[i].id+">"
							+ result[i].proName + "</option>";
				}
				role.html(str);
			}
		});
		
		$("#billCode").blur(function() {
			$.ajax({
				url :"checkCode.html?code="+($("#billCode").val()),
				type : "GET",
				dataType : "json",
				success : function(result){
					if(result=="false"){
						$("#num2").css("color","red");
						$("#num2").html("订单编号已存在！");
					}else{
						$("#num2").css("color","green");
						$("#num2").html("订单编号可用！");
					}
				}
			});
		});
	});
</script>
<div class="right">
     <div class="location">
         <strong>你现在所在的位置是:</strong>
         <span>订单管理页面 >> 订单添加页面</span>
     </div>
     <div class="providerAdd">
         <form id="billForm" name="billForm" method="post" action="billForm.html">
             <!--div的class 为error是验证错误，ok是验证成功-->
             <input type="hidden" name="method" value="add">
             <div class="">
                 <label for="billCode">订单编码：</label>
                 <input type="text" name="billCode" class="text" id="billCode" value=""> 
				 <!-- 放置提示信息 -->
				 <font color="red" id="num2"></font>
             </div>
             <div>
                 <label for="productName">商品名称：</label>
                 <input type="text" name="productName" id="productName" value=""> 
				 <font color="red"></font>
             </div>
             <div>
                 <label for="productUnit">商品单位：</label>
                 <input type="text" name="productUnit" id="productUnit" value=""> 
				 <font color="red"></font>
             </div>
             <div>
                 <label for="productCount">商品数量：</label>
                 <input type="text" name="productCount" id="productCount" value=""> 
				 <font color="red"></font>
             </div>
             <div>
                 <label for="totalPrice">总金额：</label>
                 <input type="text" name="totalPrice" id="totalPrice" value=""> 
				 <font color="red"></font>
             </div>
             <div>
                 <label >供应商：</label>
                 <select name="providerId" id="providerId">
		         </select>
				 <font color="red"></font>
             </div>
             <div>
                 <label >是否付款：</label>
                 <input type="radio" name="isPayment" value="1" checked="checked">未付款
				 <input type="radio" name="isPayment" value="2" >已付款
             </div>
             <div class="providerAddBtn">
                  <input type="submit" name="add" id="add" value="保存"/>
				  <input type="button" id="back" name="back" value="返回" onclick="javascript:history.go(-1);"/>
             </div>
         </form>
     </div>
 </div>
</section>
<%@include file="/jsp/common/foot.jsp" %>
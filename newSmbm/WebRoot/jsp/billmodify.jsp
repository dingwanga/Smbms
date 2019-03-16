<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
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
	});
</script>
<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>订单管理页面 >> 订单添加页面</span>
        </div>
        <div class="providerAdd">
          <form id="billForm" name="billForm" method="post" action="billUpdate.html">
				<input type="hidden" name="method" value="modifysave">
				<input type="hidden" name="id" value="${bill.id}"/>
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="billCode">订单编码：</label>
                    <input type="text" name="billCode" id="billCode" value="${bill.billCode}" readonly="readonly"> 
                </div>
                <div>
                    <label for="productName">商品名称：</label>
                    <input type="text" name="productName" id="productName" value="${bill.productName}"> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="productUnit">商品单位：</label>
                    <input type="text" name="productUnit" id="productUnit" value="${bill.productUnit}"> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="productCount">商品数量：</label>
                    <input type="text" name="productCount" id="productCount" value="${bill.productCount}"> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="totalPrice">总金额：</label>
                    <input type="text" name="totalPrice" id="totalPrice" value="${bill.totalPrice}"> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="providerId">供应商：</label>
					<select name="providerId" id="providerId">
					  <!-- <option value="0">--请选择--</option>
					<option value="0">供应商1</option>
					 <option value="0">供应商2</option>
					 <option value="0">供应商3</option>
					 <option value="0">供应商4</option>
					 <option value="0">供应商5</option> -->
		        	</select>
					<font color="red"></font>
                </div>
                <div>
                    <label >是否付款：</label>
                    
						<input type="radio" name="isPayment" value="1" <c:if test="${bill.isPayment==1}">checked="checked"</c:if>/>未付款
						<input type="radio" name="isPayment" value="2" <c:if test="${bill.isPayment==2}">checked="checked"</c:if>/>已付款
					
                </div>
                <div class="providerAddBtn">
                  <input type="submit" name="save" id="save" value="保存"/>
				  <input type="button" id="back" name="back" value="返回" onclick="javascript:history.go(-1);"/>
              	</div>
            </form>
        </div>

    </div>
</section>

<%@include file="/jsp/common/foot.jsp" %>

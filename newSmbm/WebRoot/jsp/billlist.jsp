<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function() {
		var form = document.getElementById("form");
		form.onsubmit = function() {
			var input = document.getElementById("inputPage").value;
			var reg = /^[1-9]+/;
			if (reg.test(input) == false) {
				alert("输入的数字不合法，请重新输入！");
				return false;
			}
			;
		};
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
	function delBill(id){
		if (confirm("是否要删除用户信息？")) {
			$.ajax({
				url : "billDel.html?id="+id,
				type : "GET",
				dataType : "json",
				success : function(result) {
					if(result=="success"){
						alert("删除成功！");
						location.href="billlist.html";
					}else{
						alert("删除失败！");
					}
				}
			});	
		};
	};
</script>
<div class="right">
	<div class="location">
		<strong>你现在所在的位置是:</strong> <span>订单管理页面</span>
	</div>
	<div class="search">
		<form method="get" action="billlist.html">
			<input name="method" value="query" class="input-text" type="hidden">
			<span>商品名称：</span> <input name="productName" type="text" value="">
			<span>供应商：</span> <select name="providerId" id="providerId">
			</select> <span>是否付款：</span> <select name="isPayment">
				<option value="0">--请选择--</option>
				<option value="1">未付款</option>
				<option value="2">已付款</option>
			</select> <input value="查 询" type="submit" id="searchbutton"> <a
				href="billadd.html">添加订单</a>
		</form>
	</div>
	<!--账单表格 样式和供应商公用-->
	<table class="providerTable" cellpadding="0" cellspacing="0">
		<tr class="firstTr">
			<th width="10%">订单编码</th>
			<th width="20%">商品名称</th>
			<th width="10%">供应商</th>
			<th width="10%">订单金额</th>
			<th width="10%">是否付款</th>
			<th width="10%">创建时间</th>
			<th width="30%">操作</th>
		</tr>
		<c:forEach items="${params.list}" var="bill">
			<tr>
				<td><span>${bill.billCode}</span></td>
				<td><span>${bill.productName}</span></td>
				<td><span>${bill.proName}</span></td>
				<td><span>${bill.totalPrice}</span></td>
				<td><span> <c:if test="${bill.isPayment==1}">未付款</c:if>
						<c:if test="${bill.isPayment==2}">已付款</c:if> </span></td>
				<td><span> <fmt:formatDate value="${bill.creationDate}"
							pattern="yyyy-MM-dd hh:mm:ss" /> </span></td>
				<td><span><a class="viewBill" href="billview.html?id=${bill.id}"><img
							src="${pageContext.request.contextPath }/images/read.png"
							alt="查看" title="查看" />
					</a>
				</span> <span><a class="modifyBill" href="billmodify.html?id=${bill.id}"><img
							src="${pageContext.request.contextPath }/images/xiugai.png"
							alt="修改" title="修改" />
					</a>
				</span> <span><a class="deleteBill" href="#" onclick="javascript:delBill(${bill.id});"><img
							src="${pageContext.request.contextPath }/images/schu.png"
							alt="删除" title="删除" />
					</a>
				</span></td>
			</tr>
		</c:forEach>
	</table>
	<div class="page-bar">
		<ul class="page-num-ul clearfix">
			<li>共${params.count}条记录&nbsp;&nbsp;${params.pageNo}/${params.pageCount}页
				<c:if test="${params.pageNo>1}">
					<a
						href="billlist.html?pageNo=1&productName=${params.productName}&providerId=${params.providerId}&isPayment=${params.isPayment}">首页</a>
					<a
						href="billlist.html?pageNo=${params.pageNo-1}&productName=${params.productName}&providerId=${params.providerId}&isPayment=${params.isPayment}">上一页</a>
				</c:if> <c:if test="${params.pageNo<params.pageCount}">
					<a
						href="billlist.html?pageNo=${params.pageNo+1}&productName=${params.productName}&providerId=${params.providerId}&isPayment=${params.isPayment}">下一页</a>
					<a
						href="billlist.html?pageNo=${params.pageCount}&productName=${params.productName}&providerId=${params.providerId}&isPayment=${params.isPayment}">最后一页</a>
				</c:if> &nbsp;&nbsp;</li>
		</ul>
		<form method="get" action="billlist.html" id="form">
			<span class="page-go-form"><label>跳转至</label> <input
				type="text" name="pageNo" id="inputPage" class="page-key"
				value="${params.pageNo}" />页 <input type="hidden" type="text"
				name="productName" value="${params.productName}"> <input
				type="hidden" type="text" name="providerId"
				value="${params.providerId}"> <input type="hidden"
				name="isPayment" value="${params.isPayment}"> <input
				type="submit" value="GO" /> </span>
		</form>
	</div>
</div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
	<div class="removerChid">
		<h2>提示</h2>
		<div class="removeMain">
			<p>你确定要删除该订单吗？</p>
			<a href="#" id="yes">确定</a> <a href="#" id="no">取消</a>
		</div>
	</div>
</div>

<%@include file="/jsp/common/foot.jsp"%>

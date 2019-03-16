<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/jsp/common/head.jsp"%>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "roles",
			type : "GET",
			dataType : "json",
			success : function(result) {
				var role = $("#userRole");
				var str = "<option value='0'>--请选择--</option>";
				for ( var i = 0; i < result.length; i++) {
					str += "<option value="+result[i].id+">"
							+ result[i].roleName + "</option>";
				}
				role.html(str);
			}
		});
		
		var form = document.getElementById("form");
		form.onsubmit = function() {
		var input = document.getElementById("inputPage").value;
		var reg = /^[1-9]+/;
		if (reg.test(input) == false) {
			alert("输入的数字不合法，请重新输入！");
			return false;
		};
	};	
	});
	function delUser(id){
		if (confirm("是否要删除用户信息？")) {
			$.ajax({
				url : "userDel.html?id="+id,
				type : "GET",
				dataType : "json",
				success : function(result) {
					if(result=="success"){
						alert("删除成功！");
						location.href="userlist.html";
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
		<strong>你现在所在的位置是:</strong> <span>用户管理页面</span>
	</div>
	<div class="search">
		<form method="get" action="userlist.html">
			<input name="method" value="query" class="input-text" type="hidden">
			<span>用户名：</span> <input name="userName" class="input-text"
				type="text" value="${params.userName}"> <span>用户角色：</span> <select
				name="userRole" id="userRole">
			</select> <input type="hidden" name="pageIndex" value="1" /> <input
				value="查 询" type="submit" id="searchbutton"> <a
				href="useradd.html">添加用户</a>
		</form>
	</div>
	<!--用户-->
	<table class="providerTable" cellpadding="0" cellspacing="0">
		<tr class="firstTr">
			<th width="10%">用户编码</th>
			<th width="20%">用户名称</th>
			<th width="10%">性别</th>
			<th width="10%">年龄</th>
			<th width="10%">电话</th>
			<th width="10%">用户角色</th>
			<th width="30%">操作</th>
		</tr>
		<c:forEach items="${params.list}" var="user">
			<tr>
				<td><span>${user.id}</span>
				</td>
				<td><span>${user.userName}</span>
				</td>
				<td><c:if test="${user.gender==1}">
						<span>男</span>
					</c:if> <c:if test="${user.gender==2}">
						<span>女</span>
					</c:if>
				</td>
				<td><span>${user.age}</span>
				</td>
				<td><span>${user.phone}</span>
				</td>
				<td><span>${user.roleName}</span>
				</td>
				<td><span><a class="viewUser" href="userview/${user.id}"><img
							src="${pageContext.request.contextPath }/images/read.png"
							alt="查看" title="查看" /> </a> </span> <span><a class="modifyUser"
						href="usermodify/${user.id}"><img
							src="${pageContext.request.contextPath }/images/xiugai.png"
							alt="修改" title="修改" /> </a> </span> <span><a class="deleteUser"
						href="#" onclick="javascript:delUser(${user.id});"><img
							src="${pageContext.request.contextPath }/images/schu.png"
							alt="删除" title="删除" /> </a> </span>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div class="page-bar">
		<ul class="page-num-ul clearfix">
			<li>共${params.count}条记录&nbsp;&nbsp;${params.pageNo}/${params.pageCount}页
				<c:if test="${params.pageNo>1}">
					<a
						href="userlist.html?pageNo=1&userName=${params.userName}&userRole=${params.userRole}">首页</a>
					<a
						href="userlist.html?pageNo=${params.pageNo-1}&userName=${params.userName}&userRole=${params.userRole}">上一页</a>
				</c:if> <c:if test="${params.pageNo<params.pageCount}">
					<a
						href="userlist.html?pageNo=${params.pageNo+1}&userName=${params.userName}&userRole=${params.userRole}">下一页</a>
					<a
						href="userlist.html?pageNo=${params.pageCount}&userName=${params.userName}&userRole=${params.userRole}">最后一页</a>
				</c:if> &nbsp;&nbsp;</li>
		</ul>
		<form method="get" action="userlist.html" id="form">
			<span class="page-go-form"><label>跳转至</label> <input
				type="text" name="pageNo" id="inputPage" class="page-key"
				value="${params.pageNo}" />页 <input type="hidden" type="text"
				name="userName" value="${params.userName}"> <input
				type="hidden" type="text" name="userRole" value="${params.userRole}">
				<input type="submit" value="GO" /> </span>
		</form>
	</div>
</div>
</section>
<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
	<div class="removerChid">
		<h2>提示</h2>
		<div class="removeMain">
			<p>你确定要删除该用户吗？</p>
			<a href="#" id="yes">确定</a> <a href="#" id="no">取消</a>
		</div>
	</div>
</div>

<%@include file="/jsp/common/foot.jsp"%>


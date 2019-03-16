<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	$(function(){
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
	function delProvider(id){
		if (confirm("是否要删除供应商信息？")) {
			$.ajax({
				url : "providerDel.html?id="+id,
				type : "GET",
				dataType : "json",
				success : function(result) {
					if(result=="success"){
						alert("删除成功！");
						location.href="providerlist.html";
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
            <strong>你现在所在的位置是:</strong>
            <span>供应商管理页面</span>
        </div>
        <div class="search">
        	<form method="get" action="providerlist.html">
				<input name="method" value="query" type="hidden">
				<span>供应商编码：</span>
				<input name="proCode" type="text" value="${params.proCode}">
				
				<span>供应商名称：</span>
				<input name="proName" type="text" value="${params.proName}">
				
				<input value="查 询" type="submit" id="searchbutton">
				<a href="provideradd.html">添加供应商</a>
			</form>
        </div>
        <!--供应商操作表格-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">供应商编码</th>
                <th width="20%">供应商名称</th>
                <th width="10%">联系人</th>
                <th width="10%">联系电话</th>
                <th width="10%">传真</th>
                <th width="10%">创建时间</th>
                <th width="30%">操作</th>
            </tr>
  				<c:forEach items="${params.list}" var="provider">
				<tr>
					<td>
					<span>${provider.proCode}</span>
					</td>
					<td>
					<span>${provider.proName}</span>
					</td>
					<td>
					<span>${provider.proContact}</span>
					</td>
					<td>
					<span>${provider.proPhone}</span>
					</td>
					<td>
					<span>${provider.proFax}</span>
					</td>
					<td>
					<span>
					<fmt:formatDate value="${provider.creationDate}" pattern="yyyy-MM-dd hh:mm:ss"/>	
					</span>
					</td>
					<td>
					<span><a class="viewProvider" href="providerview/${provider.id}" ><img src="${pageContext.request.contextPath }/images/read.png" alt="查看" title="查看"/></a></span>
					<span><a class="modifyProvider" href="providermodify/${provider.id}" ><img src="${pageContext.request.contextPath }/images/xiugai.png" alt="修改" title="修改"/></a></span>
					<span><a class="deleteProvider" href="#" onclick="javascript:delProvider(${provider.id});"><img src="${pageContext.request.contextPath }/images/schu.png" alt="删除" title="删除"/></a></span>
					</td>
				</tr>
			</c:forEach>
        </table>
<div class="page-bar">
		<ul class="page-num-ul clearfix">
			<li>共${params.count}条记录&nbsp;&nbsp;${params.pageNo}/${params.pageCount}页
				<c:if test="${params.pageNo>1}">
					<a
						href="providerlist.html?pageNo=1&proCode=${params.proCode}&proName=${params.proName}">首页</a>
					<a
						href="providerlist.html?pageNo=${params.pageNo-1}&proCode=${params.proCode}&proName=${params.proName}">上一页</a>
				</c:if> <c:if test="${params.pageNo<params.pageCount}">
					<a
						href="providerlist.html?pageNo=${params.pageNo+1}&proCode=${params.proCode}&proName=${params.proName}">下一页</a>
					<a
						href="providerlist.html?pageNo=${params.pageCount}&proCode=${params.proCode}&proName=${params.proName}">最后一页</a>
				</c:if> &nbsp;&nbsp;</li>
		</ul>
		<form method="get" action="providerlist.html" id="form">
			<span class="page-go-form"><label>跳转至</label> <input
				type="text" name="pageNo" id="inputPage" class="page-key"
				value="${params.pageNo}" />页 <input type="hidden" type="text"
				name="proCode" value="${params.proCode}"> <input
				type="hidden" type="text" name="proName" value="${params.proName}">
				<input type="submit" value="GO" /> </span>
		</form>
	</div>
    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeProv">
   <div class="removerChid">
       <h2>提示</h2>
       <div class="removeMain" >
           <p>你确定要删除该供应商吗？</p>
           <a href="#" id="yes">确定</a>
           <a href="#" id="no">取消</a>
       </div>
   </div>
</div>

<%@include file="/jsp/common/foot.jsp" %>


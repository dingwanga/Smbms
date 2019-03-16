<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
 		<div class="page-bar">
			<ul class="page-num-ul clearfix">
				<li>共100条记录&nbsp;&nbsp;1/10页
					<a href="userlist.html?pageNo=1&userName=${userParams.userName}&userRole=${userParams.userRole}">首页</a>
					<a href="userlist.html?pageNo=${userParams.pageNo-1}&userName=${userParams.userName}&userRole=${userParams.userRole}">上一页</a>		
					<a href="userlist.html?pageNo=${userParams.pageNo+1}&userName=${userParams.userName}&userRole=${userParams.userRole}">下一页</a>
					<a href="userlist.html?pageNo=1&userName=${userParams.userName}&userRole=${userParams.userRole}">最后一页</a>				
				&nbsp;&nbsp;
				</li>
			</ul>
		 <span class="page-go-form"><label>跳转至</label>
	     <input type="text" name="inputPage" id="inputPage" class="page-key" />页
	     <button type="button" class="page-btn" >GO</button>
		</span>
		</div> 
</body>

</html>
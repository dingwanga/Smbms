<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>超市订单管理系统</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/css/style.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/css/public.css" />
<script type="text/javascript">
	function realSysTime() {
		var info=document.getElementById("info");
		var today = document.getElementById("time");
		var now = new Date(); //创建Date对象
		var year = now.getFullYear();//获取年份
		var month = now.getMonth(); //获取月份
		var date = now.getDate(); //获取日期
		if (date < 10) {
			date = "0" + date;
		}
		var day = now.getDay(); //获取星期
		var hour = now.getHours(); //获取小时
		if (hour < 10) {
			hour = "0" + hour;
		}
		if(hour>=0&&hour<=12){
			info.innerHTML="上午好！";
		}else if(hour>=12&&hour<=18){
			info.innerHTML="下午好！";
		}else{
			info.innerHTML="晚上好！";
		}
		var minu = now.getMinutes(); //获取分钟
		if (minu < 10) {
			minu = "0" + minu;
		}
		var sec = now.getSeconds(); //获取秒钟
		if (sec < 10) {
			sec = "0" + sec;
		}
		month = month + 1;
		if (month < 10) {
			month = "0" + month;
		}
		var arr_week = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五",
				"星期六");
		var week = arr_week[day]; //获取中文的星期
		var time = year + "年" + month + "月" + date + "日 " + hour + ":" + minu
				+ ":" + sec + " " + week; //组合系统时间
		today.innerHTML = time; //显示系统时间
	}
	window.onload = function() {
		window.setInterval("realSysTime()", 1000); //实时获取并显示系统时间
	};
</script>
</head>
<body>
	<!--头部-->
	<header class="publicHeader">
		<h1>超市订单管理系统</h1>
		<div class="publicHeaderR">
			<p>
				<span id="info"></span><span style="color: #fff21b">
					${user.userName}</span> , 欢迎你！
			</p>
			<a href="loginOut.html">退出</a>
		</div>
	</header>
	<!--时间-->
	<section class="publicTime">
		<span id="time"></span> <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
	</section>
	<!--主体内容-->
	<section class="publicMian ">
		<div class="left">
			<h2 class="leftH2">
				<span class="span1"></span>功能列表 <span></span>
			</h2>
			<nav>
				<ul class="list">
					<li><a href="billlist.html">订单管理</a>
					</li>
					<li><a href="providerlist.html">供应商管理</a>
					</li>
					<li><a href="userlist.html">用户管理</a>
					</li>
					<li><a href="pwdmodify.html">密码修改</a>
					</li>
					<li><a href="exitSystem.html">退出系统</a>
					</li>
				</ul>
			</nav>
		</div>
		<input type="hidden" id="path" name="path"
			value="${pageContext.request.contextPath }" /> <input type="hidden"
			id="referer" name="referer" value="<%=request.getHeader("Referer")%>" />
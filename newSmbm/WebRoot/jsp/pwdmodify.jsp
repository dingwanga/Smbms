<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/jsp/common/head.jsp"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function() {
		/* $("#userForm").submit(function(){
			alert("a");
			if($("#oldpassword").val().trim()==null||$("#oldpassword").val().trim()==""){
				$("#num1").html("密码不能为空");
				return false;
			}
			if($("#newPassword").val().trim()==null||$("#newPassword").val().trim()==""){
				$("#num2").html("新密码不能为空");
				return false;
			}
			if($("#reNewPassword").val().trim()==null||$("#reNewPassword").val().trim()==""){
				$("#num3").html("确认密码不能为空");
				return false;
			}
			if($("#newPassword").val().trim()!=$("#reNewPassword").val().trim()==""){
				$("#num3").html("两次密码不一致");
				return false;
			}	
		}); */
		$("#oldpassword").blur(function() {
			var param = $("#oldpassword").val();
			$.ajax({
				url : "checkold.html",
				type : "POST",
				data : {
					oldpassword : param
				},
				dataType : "json",
				success : function(result) {
					if (result == 1) {
						$("#num1").css("color", "green");
						$("#num1").html("密码正确！");
					} else {
						$("#num1").css("color", "red");
						$("#num1").html("密码错误！");
					}
				}
			});
		});
		 $("#newpassword").blur(function(){
			var params2=$("#newpassword").val();
			if(params2.trim()==null||params2.trim()==""){
				$("#num2").css("color", "red");
				$("#num2").html("新密码不能为空！");
			}else{
				$("#num2").html("");
			}
		});
		$("#rnewpassword").blur(function(){
			var params2=$("#rnewpassword").val();
			if(params2.trim()==null||params2.trim()==""){
				$("#num3").css("color", "red");
				$("#num3").html("重复密码不能为空！");
			}else{
				$("#num3").html("");
			}
		});	
		
		$("#userForm").submit(function(){
			var params=$("#newpassword").val();
			var params2=$("#rnewpassword").val();
			if(params!=params2){
				$("#num3").css("color", "red");
				$("#num3").html("两次输入的密码不一致！");
				return false;
			}
		}); 
	});
</script>
<div class="right">
	<div class="location">
		<strong>你现在所在的位置是:</strong> <span>密码修改页面</span>
	</div>
	<div class="providerAdd">
		<form id="userForm" name="userForm" method="post"
			action="pwdResult.html">
			<input type="hidden" name="method" value="savepwd">
			<!--div的class 为error是验证错误，ok是验证成功-->
			<div class="info">${msg}</div>
			<div class="">
				<label for="oldPassword">旧密码：</label> <input type="password"
					name="oldpassword" id="oldpassword" value=""> <font
					color="red" id="num1"></font>
			</div>
			<div>
				<label for="newPassword">新密码：</label> <input type="password"
					name="newpassword" id="newpassword" value=""> <font
					color="red" id="num2"></font>
			</div>
			<div>
				<label for="reNewPassword">确认新密码：</label> <input type="password"
					name="rnewpassword" id="rnewpassword" value=""> <font
					color="red" id="num3"></font>
			</div>
			<div class="providerAddBtn">
				<!--<a href="#">保存</a>-->
				<input type="submit" name="save" id="save" value="保存"
					class="input-button">
			</div>
		</form>
	</div>
</div>
</section>
<%@include file="/jsp/common/foot.jsp"%>

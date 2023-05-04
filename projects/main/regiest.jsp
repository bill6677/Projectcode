<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
</head>
<body style="background-color: #fff"><%-- background-image: url(<%=request.getContextPath() %>/base/loginPageImg/timg2.jpg) --%>
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div style="margin-top: 100px;">
				<img  style="width:750px;height: 500px" alt="" src="<%=request.getContextPath() %>/base/loginPageImg/timg1.jpg">
				</div>
			</div>
			<div class="col-lg-2"></div>
			<div class="col-lg-4 panel panel-info" style="margin-top: 100px;">
				<div class="panel-heading">
					<h3 class="panel-title" align="center">user register</h3>
				</div>
				<div class="panel-body">
				<div class="btn-group ">
					<div class="form-group">
						<%--@declare id="exampleinputemail1"--%><label for="exampleInputEmail1">Username:</label> <input
							type="text" class="form-control" id="Username"
							placeholder="name"><span style="font-size: 10px;color: red">*It can only be 2-4 characters Chinese!</span>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Login User:</label> <input
							type="text" class="form-control" id="idcard"
							placeholder="account"><span style="font-size: 10px;color: red">*4 to 16 digits (letters, numbers, underscores, minus signs)</span>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Password:</label> <input
							type="password" class="form-control" id="Password"
							placeholder="password"><span style="font-size: 10px;color: red">* At least 6 characters, including at least one uppercase letter, one lowercase letter, one number, and one special character</span>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Confirm Password:</label> <input
							type="password" class="form-control" id="confirmPassword"
							placeholder="confirm password">
					</div>
					<div type="button" id="regist" class="btn btn-info ">register</div>&nbsp;&nbsp;
					<div type="reset" class="btn btn-default">reset</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$("#redo").click(function(){
		
	});
	function yz(){
		var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;//用户名正则，4到16位（字母，数字，下划线，减号）
		var pPattern1 = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/;
		var userPa = /^[\u4E00-\u9FA5]{2,4}$/;
		if(!userPa.test($("#Username").val())||$("#Username").val() == ''){
			alert("The user name does not match the format")
			return false;
		}else if(!uPattern.test($("#idcard").val())||$("#Username").val() == ''){
			alert("The login account does not conform to the format")
			return false;
		}else if(!pPattern1.test($("#Password").val())||$("#Username").val() == ''){
			alert("The password is invalid")
			return false;
		}else{
			return true;
		}
	};
	$("#regist").click(function(){
		if($("#Password").val()==$("#confirmPassword").val()&yz()){
		$.ajax({
			url:"<%=request.getContextPath()%>/log/regist.json",
				method : "post",
				dataType : "text",
				data : {
					"username" : $("#Username").val(),
					"password" : $("#Password").val(),
					"idcard":$("#idcard").val()
				},
				success : function(result) {
					if (result == 'success') {
						alert("register success");
						window.location.href="<%=request.getContextPath()%>/log/do.html"
					} else {
						alert("login fail")
					}
				}
			});
		}else{
			//alert("密码确认不正确");
		}
	})
</script>
</html>
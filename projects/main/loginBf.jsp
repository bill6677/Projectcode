<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login begins</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-5" style="margin-top: 100px;">
				<div class="btn-group">
					<div class="form-group">
						<label for="exampleInputEmail1">UserID</label> <input
							type="text" class="form-control" id="Username"
							placeholder="ID">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Password</label> <input
							type="password" class="form-control" id="Password"
							placeholder="Password">
					</div>
					<div class="form-group">
						<select id="txt_major" class="form-control" style="width: 103px">
							<option selected="selected" value="">select role</option>
							<option value="manager">manager</option>
							<option value="doctor">doctor</option>
							<option value="room">room</option>
							<option value="user">user</option>
						</select>
					</div>
					<button type="button" id="login" class="btn btn-default">login</button>
					<button type="button" id="redo" class="btn btn-default" >register</button>
				</div>
			</div>
			<div class="col-lg-3"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$("#redo").click(function(){
		window.location.href="<%=request.getContextPath()%>/log/regiest.html"
	});
	$("#login").click(function(){
		var name = $("#txt_major").val();
		$.ajax({
			url:"<%=request.getContextPath()%>/log/logindo.json",
			method : "post",
			dataType : "text",
			data : {
				"username" : $("#Username").val(),
				"password" : $("#Password").val(),
				"role":$("#txt_major").val()
			},
			success : function(result) {
				if (result == 'success') {
					if(name == "user"){
						window.location.href="<%=request.getContextPath()%>/log/login3.html"
					}else if(name == 'room'){
						window.location.href="<%=request.getContextPath()%>/log/login1.html"
					}else if(name == "doctor"){
						window.location.href="<%=request.getContextPath()%>/log/login2.html"
					}else{
						window.location.href="<%=request.getContextPath()%>/log/login.html"
					}
					
				} else {
					alert("login fail")
				}
			}
		});
	})
</script>
</html>
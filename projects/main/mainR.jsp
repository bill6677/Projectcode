<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link>
<title>home</title>
</head>
<script src="<%=request.getContextPath()%>/src/jquery.min.js"></script>
<link
	href="<%=request.getContextPath()%>/src/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/src/skin.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/src/menu/sidemenu.css"
	rel="stylesheet" />
<script src="<%=request.getContextPath()%>/data/menudataR.js"></script>
<script src="<%=request.getContextPath()%>/src/menu/sidemenu.js"></script>
<style>
.main {
	background: #fff;
	position: absolute;
	float: left;
	left: 200px;
	right: 0px;
	top: 50px;
	bottom: 0px;
	padding: 8px;
	transition-duration: 0.3s;
	transition-timing-function: ease;
	-webkit-transition-duration: 0.3s;
	-webkit-transition-timing-function: ease;
}

.collapse .main {
	left: 50px;
	transition-duration: 0.3s;
	transition-timing-function: ease;
	-webkit-transition-duration: 0.3s;
	-webkit-transition-timing-function: ease;
}

.mymenu .mini-menu-float {
	display: inline-block;
	float: right;
}
</style>
</head>
<body style="background-color: #fff">
	<div class="header">
		<div class="logo">
			<img src="<%=request.getContextPath()%>/photo/timg.jpg" /><span><%=session.getAttribute("sysname") %><a href="<%=request.getContextPath() %>/log/loginout">&nbsp;&nbsp;<span style="font-size: 10px;color: white;">log out</span></a></span>
		</div>
		<div class="header-tabs">
			<ul>
				<li><div class="tabs-item">
						<i class="fa fa-dashboard"></i>
					</div></li>
			</ul>
		</div>
		<div class="header-menu"></div>
	</div>
	<div id="menu" class="main-sidebar"></div>
	<div class="main">
		<iframe id="mainframe"
			src="<%=request.getContextPath()%>/page/page.jsp"
			frameborder="0" name="main"
			style="width: 100%; height: 100%; padding: 0" border="0"></iframe>
	</div>
</body>
<script>
	$("#menu").sidemenu({
		data : menuDataR,
	});
</script>
</html>

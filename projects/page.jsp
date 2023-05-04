<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>预防中心</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap-table.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/toastr.min.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/toastr.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap-table.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap-table-zh-CN.min.js"></script>
</head>
<style> 
#myfirst {
width:125px;
height:125px;
background:red;
position:relative;
animation-name:myfirst;
animation-duration:5s;
animation-timing-function:linear;
animation-delay:2s;
animation-iteration-count:infinite;
animation-direction:alternate;
animation-play-state:running;
/* Firefox: */
-moz-animation-name:myfirst;
-moz-animation-duration:5s;
-moz-animation-timing-function:linear;
-moz-animation-delay:2s;
-moz-animation-iteration-count:infinite;
-moz-animation-direction:alternate;
-moz-animation-play-state:running;
/* Safari and Chrome: */
-webkit-animation-name:myfirst;
-webkit-animation-duration:5s;
-webkit-animation-timing-function:linear;
-webkit-animation-delay:2s;
-webkit-animation-iteration-count:infinite;
-webkit-animation-direction:alternate;
-webkit-animation-play-state:running;
/* Opera: */
-o-animation-name:myfirst;
-o-animation-duration:5s;
-o-animation-timing-function:linear;
-o-animation-delay:2s;
-o-animation-iteration-count:infinite;
-o-animation-direction:alternate;
-o-animation-play-state:running;
}

@keyframes myfirst
{
0%   {background:red; left:0px; top:0px;}
25%  {background:yellow; left:100px; top:0px;}
50%  {background:blue; left:100px; top:100px;}
75%  {background:green; left:0px; top:100px;}
100% {background:red; left:0px; top:0px;}
}

@-moz-keyframes myfirst /* Firefox */
{
0%   {background:red; left:0px; top:0px;}
25%  {background:yellow; left:200px; top:0px;}
50%  {background:blue; left:200px; top:200px;}
75%  {background:green; left:0px; top:200px;}
100% {background:red; left:0px; top:0px;}
}

@-webkit-keyframes myfirst /* Safari and Chrome */
{
0%   {background:red; left:0px; top:0px;}
25%  {background:yellow; left:100px; top:0px;}
50%  {background:blue; left:100px; top:100px;}
75%  {background:green; left:0px; top:100px;}
100% {background:red; left:0px; top:0px;}
}

@-o-keyframes myfirst /* Opera */
{
0%   {background:red; left:0px; top:0px;}
25%  {background:yellow; left:200px; top:0px;}
50%  {background:blue; left:200px; top:200px;}
75%  {background:green; left:0px; top:200px;}
100% {background:red; left:0px; top:0px;}
}
</style>
<body style="background-color: #fff">
	<div class="container">
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-1"></div>
			<div class="col-md-8 ">
				<form role="form">
					<div class="form-group">
						<textarea id="context" class="form-control" rows="3"
							style="resize: none;" placeholder="notebook"></textarea>
					</div>
				</form>
				<div>
					<button id="publish" type="button" class="btn btn-success">record</button>
				</div>
				<hr>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Look forward to an early end to the epidemic！！！</h3>
					</div>
					<div class="panel-body">
						<div id="myCarousel" class="carousel slide">
							<!-- 轮播（Carousel）指标 -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
							</ol>
							<!-- 轮播（Carousel）项目 -->
							<div class="carousel-inner" >
								<div class="item active">
									<img src="<%=request.getContextPath() %>/base/loginPageImg/01.jpg"
										alt="First slide">
									<div class="carousel-caption">go for it</div>
								</div>
								<div class="item">
									<img src="<%=request.getContextPath() %>/base/loginPageImg/03.jpg"
										alt="Second slide">
									<div class="carousel-caption">Fight</div>
								</div>
								<div class="item">
									<img src="<%=request.getContextPath() %>/base/loginPageImg/04.jpg"
										alt="Third slide">
									<div class="carousel-caption">ok</div>
								</div>
							</div>
							<!-- 轮播（Carousel）导航 -->
							<a class="left carousel-control" href="#myCarousel" role="button"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								role="button" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
						<hr>
						<h3>epidemic prevention and control</h3>
						2023 01, the new situation of the novel coronavirus
						<h3>CD</h3>
						It was infected in December 2022
						<h3>Precautions against the epidemic</h3>
						<p>Not necessary, do not go out, do a good job of two yards a temperature detection</p>
						<p>Frequent disinfection, do not easily take off masks when going out, and cooperate with epidemic prevention and control measures</p>
					</div>
				</div>
		
			</div>
			<div class="col-md-3" style="margin-top: 25px;">
				<p>note</p>
				<div class="panel panel-default" style="height: 410px;">
					<div id="news" class="panel-body" style="height: 410px;overflow:hidden"></div>
				</div>
				<div id= "myfirst"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/log/listNews",
			datatype:"POST",
			data:"JSON",
			success:function(result){
				for (var i = 0; i < result.length; i++) {
					var html = '<div>'
						+'<span style="font-size:10px ;">'+result[i].publishName+'</span>'
						+'<p>'+result[i].publishContext+'</p>'
						+'<p style="font-size:10px ;">'+formatter(result[i].publishTime)+'</p>'
						+'</div>';
					$("#news").append(html);
				}
			}
		});
	})
	$("#publish").click(function(){
		if($("#context").val() != null && $("#context").val() != ""){
			$.ajax({
				url:"<%=request.getContextPath()%>/log/publicnews",
				type : "POST",
				datatype : "JSON",
				data : {
					"context" : $("#context").val()
				},
				success : function(re) {
					if (re == 'success') {
						alert("ok")
						location.reload();
					}
				}
			});
		} else {
			alert("empty！")
		}
	});
	function formatter(value) {
		var si = new Date(value);
		return si.getFullYear() + "." + (si.getMonth() + 1) + "."
				+ si.getDate() + " " + si.getHours() + ":" + si.getMinutes()
				+ ":" + si.getSeconds();
	}
</script>
</html>
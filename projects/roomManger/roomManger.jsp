<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>room</title>
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
<script type="text/javascript"
	src="
        bootstrap-table/src/extensions/export/bootstrap-table-export.js
      "></script>
</head>
<body style="background-color: #808080">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8" style="margin-top: 100px;">
				<div class="col-md-1">
					<div class="input-group" style="margin-left: 5px">
						<!-- <span class="input-group-addon">请输入关键字</span> <input type="text"
							id="name" class="form-control" style="width: 120px; float: left"
							value="">  --><span class="input-group-btn">
							<!-- <button class="btn btn-default" type="button" id="cli">查询</button> -->&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-info" onclick="editroomifo1()">&nbsp;add room</button>
						</span>
					</div>
				</div>
				<div style="margin-top: 20px">
					<table id="roomlist" style="margin-top: 20px"></table>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="roomifo" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">room information</h4>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">room num:</span> <input type="text"
							class="form-control" id="rid" placeholder="" >
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">room name:</span> <input type="text"
							class="form-control" id="rname" placeholder="" >
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">room phone:</span> <input type="text"
							class="form-control" id="rtel" placeholder="" >
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">room holder:</span> <input type="text"
							class="form-control" id="rperson" placeholder="" >
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">close
					</button>
					<button type="button" class="btn btn-primary" id="saveedit">save</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 增加模态框（Modal） -->
	<div class="modal fade" id="roomifo1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">room information</h4>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">room num:</span> <input type="text"
							class="form-control" id="rid1" placeholder="" >
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">room name:</span> <input type="text"
							class="form-control" id="rname1" placeholder="" >
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">room phone:</span> <input type="text"
							class="form-control" id="rtel1" placeholder="" >
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">room holder:</span> <input type="text"
							class="form-control" id="rperson1" placeholder="" >
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">close
					</button>
					<button type="button" class="btn btn-primary" id="saveroom">add room</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!--新增弹窗  begin-->
	<div class="modal inmodal fade" id="del" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">delete</h4>
				</div>
				<div class="modal-body">
					<p>
						<strong>sure?</strong> delete
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">close</button>
					<button type="button" id="delyes_btn1" class="btn btn-primary"
						data-dismiss="modal">confirm</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var roomid = null;
$(function(){
$('#roomlist').bootstrapTable({
	url:"<%=request.getContextPath()%>/Manager/roomlist",
							clickToSelect : true,
							singleSelect : true,
							search:true,
							searchOnEnterKey:true,
							searchText:" ",
							toolbar : '#toolbar',
							toolbarAlign : '-',
							pagination : 'true',
							sidePagination : 'server',
							pageSize : 10,
							queryParams : queryParams,
							pageList : [ 10, 20, 'All' ],
							columns : [
									{
										field : 'checkBox',
										checkbox : true,
										align : "center"
									},
									{
										field : 'roomId',
										title : 'room num',
										align : "center"
									},
									{
										field : 'roomName',
										title : 'room name',
										align : "center",
									},
									{
										field : 'roomTel',
										title : 'room phone',
										align : "center",
									},
									{
										field : 'roomLeader',
										title : 'room holder',
										align : "center",
									},
									{
										title : 'operate',
										formatter : function(value, row, index) {
											return '<button class="btn btn-info" onclick="editroomifo('+row.id+')">&nbsp;edit</button>&nbsp;<button class="btn btn-danger" onclick="dele('+row.id+')">delete</button>';
										},
										align : "center",
									} ],
						});
		function queryParams(params) {
			var pars = {
				limit : params.limit,
				offset : params.offset,
				search: params.search
			};
			return pars;
		};
	})
	
	function editroomifo(id) {
		$("#roomifo").modal('show');
		roomid = id;
	}
	//保存修改的信息
	
	$("#saveedit").click(function() {
		$.ajax({
			url : "<%=request.getContextPath()%>/Manager/update.json",
			datatype : "json",
			data : {
				"id" : roomid,
				"roomId" : $("#rid").val(),
				"roomName" : $("#rname").val(),
				"roomTel" : $("#rtel").val(),
				"roomLeader" : $("#rperson").val()
			},
			success : function(response) {
				if (response.result == 'success') {
					toastr.success('ok！', 'note', {
						timeOut : 1000
					});
					$("#roomifo").modal('hide');
					toastr.subscribe(function() { //这个是让提示信息加载完消失之后在执行的刷新
						window.location.reload();
					});
				} else {
					toastr.danger('ok！', 'note', {
						timeOut : 1000
					});
					$("#roomifo").modal('hide');
					toastr.subscribe(function() { //这个是让提示信息加载完消失之后在执行的刷新
						window.location.reload();
					});
				}
			}
		});
	});
	function editroomifo1() {
		$("#roomifo1").modal('show');
	}
	$("#saveroom").click(function() {
		$.ajax({
			url : "<%=request.getContextPath()%>/Manager/addroom",
			datatype : "json",
			data : {
				"roomId" : $("#rid1").val(),
				"roomName" : $("#rname1").val(),
				"roomTel" : $("#rtel1").val(),
				"roomLeader" : $("#rperson1").val()
			},
			success : function(response) {
				if (response.result == 'success') {
					toastr.success('add ok！', 'note', {
						timeOut : 1000
					});
					$("#roomifo1").modal('hide');
					toastr.subscribe(function() { //这个是让提示信息加载完消失之后在执行的刷新
						window.location.reload();
					});
				} else {
					toastr.danger('add fail！', 'note', {
						timeOut : 1000
					});
					$("#roomifo1").modal('hide');
					toastr.subscribe(function() { //这个是让提示信息加载完消失之后在执行的刷新
						window.location.reload();
					});
				}
			}
		});
	});
	function dele(id){
		$("#del").modal('show');
		roomid = id;
	}
	$("#delyes_btn1").click(function(){
		$.ajax({
			url : "<%=request.getContextPath()%>/Manager/delroom",
			datatype : "json",
			data : {"id":roomid},
			success : function(response) {
				if (response.result == 'success') {
					toastr.success('delete ok！', 'note', {
						timeOut : 1000
					});
					$("#del").modal('hide');
					toastr.subscribe(function() { //这个是让提示信息加载完消失之后在执行的刷新
						window.location.reload();
					});
				} else {
					toastr.danger('delete fail！', 'note', {
						timeOut : 1000
					});
					$("#del").modal('hide');
					toastr.subscribe(function() { //这个是让提示信息加载完消失之后在执行的刷新
						window.location.reload();
					});
				}
			}
		});
	});
</script>
</html>
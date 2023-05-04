<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>医生维护</title>
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
<body style="background-color: #808080">
<div class="container-fluid">
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10" style="margin-top: 100px;">
				<div class="col-md-1" >
					<div class="input-group" style="margin-left: 5px">
						<!--  <span class="input-group-addon">请输入关键字</span> <input type="text" id = "name"
							class="form-control" style="width: 120px; float: left" value=""> --> <span class="input-group-btn">
							<!-- <button class="btn btn-default" type="button" id="cli">查询</button>  -->
							<button class="btn btn-info" onclick="adddocifo()">&nbsp;add doctor	</button>
						</span>
					</div>
				</div>
				<div style="margin-top: 20px">
					<table id="docifo" style="margin-top: 20px"></table>
				</div>
			</div>
			<div class="col-lg-1"></div>
		</div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="docifomodal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">doctor information</h4>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">doctor num:</span> <input type="text"
							class="form-control" id="docid" placeholder="" >
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">doctor name:</span> <input type="text"
							class="form-control" id="docname" placeholder="" >
					</div>
					<br>
					<div class="input-group">
						<select id="txt_major" class="form-control" style="width: 103px"
						onchange="refreshProjectclueInfo()">
						<option selected="selected" value="">all room</option>
						<!-- <option value="内科">内科</option>
						<option value="眼科">眼科</option>
						<option value="骨科">骨科</option> -->
					</select>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">close
					</button>
					<button type="button" class="btn btn-primary" id="saveifo">save</button>
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
						<strong>sure?</strong> delete?
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
	<!-- 增加模态框（Modal） -->
	<div class="modal fade" id="adddoc" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">doctor information</h4>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">doctor num:</span> <input type="text"
							class="form-control" id="adddocid" placeholder="" >
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">doctor name:</span> <input type="text"
							class="form-control" id="adddocname" placeholder="" >
					</div>
					<br>
					<div class="input-group">
						<select id="txt_major1" class="form-control" style="width: 103px"
						>
						<option selected="selected" value="">all room</option>
						<!-- <option value="内科">内科</option>
						<option value="眼科">眼科</option>
						<option value="骨科">骨科</option> -->
					</select>
					</div>
					<br/>
					<div class="input-group">
						<span class="input-group-addon">add time:</span> <input type="date"
							class="form-control" id="adddate" placeholder="" >
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">close
					</button>
					<button type="button" class="btn btn-primary" id="savedocifo">add doctor </button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
<script type="text/javascript">
var docid = null;
$(function(){
	$('#docifo').bootstrapTable({
		url:"<%=request.getContextPath()%>/Manager/listdoctorifo",
			clickToSelect : true,
			singleSelect : true,
			toolbar : '#toolbar',
			search:true,
			searchOnEnterKey:true,
			searchText:" ",
			toolbarAlign : '-',
			pagination : 'true',
			sidePagination : 'server',
			pageSize : 10,
			queryParams : queryParams,
			pageList : [ 10, 20, 'All' ],
			columns : [ {
				field : 'checkBox',
				checkbox : true,
				align : "center"
			}, {
				field : 'doctorId',
				title : 'doctor num',
				align : "center"
			},{
				field : 'doctorName',
				title : 'doctor name',
				align : "center"
			}, {
				field : 'rooms',
				title : 'room',
				formatter:function(value, row,index){
					return value[0].roomName;
				},
				align : "center"
			},  {
				field : "doctorEntryTime",
				title : "join time",
				formatter : function(value, row,index){
					var si =  new Date(value);
					return si.getFullYear()+"year"+(si.getMonth()+1)+"month"+si.getDate()+"day"
				},
				align : "center"
			}, {
				field : "exitStatu",
				title : "is here?",
				formatter:function(value, row,index){
					return value==1?"yes":"no";
				},
				align : "center"
			}, {
				field : "",
				title : "oporate",
				align : "center",
				formatter:function(value,row,index){
					return "<button type='button' class='btn btn-success' data-toggle='modal' onclick='editifo("+row.id+")' >editor</button>&nbsp;<button class='btn btn-danger' onclick='deleifo("+row.id+")'>delete doctor</button>"
				}
			}],
		});
		function queryParams(params) {
			var pars = {
					limit: params.limit,
			        offset: params.offset,
			        name:$("#name").val(),
			        search: params.search
			}; 
			return pars;
		};
		
		//预加载科室信息
		$.ajax({
			url:"<%=request.getContextPath()%>/Manager/listroom.json",
			datatype:"json",
			data:{},
			success:function(list){
				console.log(list)
				for (var i = 0; i < list.length; i++) {
					var option = '<option value="'+list[i].roomId+'">'+list[i].roomName+'</option>';
					$("#txt_major").append(option);
					$("#txt_major1").append(option);
				}
			}
		});
	})
	function editifo(id) {
		var a = $('#docifo').bootstrapTable('getSelections', '');
		if (a.length == 0) {
			toastr.info('select！', 'note');
		} else {
			$("#docid").val(a[0].doctorId);
			$("#docname").val(a[0].doctorName);
			docid = id;
			$("#docifomodal").modal('show');
		}

	}
	$("#saveifo").click(function(){
		$.ajax({
			url : "<%=request.getContextPath()%>/Manager/updateifo",
			datatype : "json",
			data : {"id":docid,"doctorId":$("#docid").val(),"doctorName":$("#docname").val()},
			success : function(response) {
				if (response.result == 'success') {
					toastr.success('ok！', 'note', {
						timeOut : 1000
					});
					$("#docifomodal").modal('hide');
					toastr.subscribe(function() { //这个是让提示信息加载完消失之后在执行的刷新
						window.location.reload();
					});
				} else {
					toastr.danger('no！', 'note', {
						timeOut : 1000
					});
					$("#docifomodal").modal('hide');
					toastr.subscribe(function() { //这个是让提示信息加载完消失之后在执行的刷新
						window.location.reload();
					});
				}
			}
		});
	});
	function deleifo(id){
		$("#del").modal('show');
		docid = id;
	}
	$("#delyes_btn1").click(function(){
		$.ajax({
			url : "<%=request.getContextPath()%>/Manager/delifo",
			datatype : "json",
			data : {"id":docid},
			success : function(response) {
				if (response.result == 'success') {
					toastr.success('delete success！', 'note', {
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
	function adddocifo(){
		$("#adddoc").modal('show');
	}
	$("#savedocifo").click(function(){
		$.ajax({
			url : "<%=request.getContextPath()%>/Manager/adddocifo",
			datatype : "json",
			data : {
				"doctorId" : $("#adddocid").val(),
				"doctorName" : $("#adddocname").val(),
				"doctorProId" : $("#txt_major1").val(),
				"doctordate" : $("#adddate").val()
			},
			success : function(response) {
				if (response.result == 'success') {
					toastr.success('add ok！', 'note', {
						timeOut : 1000
					});
					$("#adddoc").modal('hide');
					toastr.subscribe(function() { //这个是让提示信息加载完消失之后在执行的刷新
						window.location.reload();
					});
				} else {
					toastr.danger('add fail！', 'note', {
						timeOut : 1000
					});
					$("#adddoc").modal('hide');
					toastr.subscribe(function() { //这个是让提示信息加载完消失之后在执行的刷新
						window.location.reload();
					});
				}
			}
		});
	});
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>药品列表</title>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/inputGroup.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.table2excel.js"></script>
	<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tableExport.min.js"></script>
	<script type="text/javascript" src="
        <%=request.getContextPath()%>/bootstrap-table/src/extensions/export/bootstrap-table-export.js
      "></script>
</head>
<body style="background-color: #808080">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10" style="margin-top: 100px;">
				<div class="col-md-1">
					<!-- <select id="txt_major" class="form-control" style="width: 103px"
						onchange="refreshProjectclueInfo()">
						<option selected="selected" value="">全部科室</option>
						<option value="内科">内科</option>
						<option value="眼科">眼科</option>
						<option value="骨科">骨科</option>
					</select> -->
				</div>
				<div style="margin-top: 20px">
					<table id="doctor" style="margin-top: 20px"></table>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
	<!--删除弹窗  begin-->
	<div class="modal inmodal fade" id="del_myModal" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">add new record</h4>
				</div>
				<div class="modal-body">
					<div style="padding: 100px 100px 10px;">
							<form class="bs-example bs-example-form" role="form">
								<div class="input-group">
									<span class="input-group-addon">doctor:</span> <input type="text"
										class="form-control" id="doctorname" placeholder="daoctor name"
										disabled=true> <input type="hidden" id="Mid" />
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon">patient name:</span> <input type="text"
										class="form-control" id="oilname" placeholder="patient name"
										disabled=true>
								</div>
								<br>
								<div class="input-group">
									<div class="col-md-1">
										<select id="sex" class="form-control" style="width: 103px"
											onchange="refreshProjectclueInfo()">
											<option selected="selected" value="">sex</option>
											<option value="man">man</option>
											<option value="woman">woman</option>
										</select>
									</div>
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon">age:</span> <input type="text"
										class="form-control" id="age" placeholder="age">
								</div>
								<br>
								<div class="input-group">
									<div class="col-md-1">
										<select id="txt_major1" class="form-control"
											style="width: 103px">
											<option selected="selected" value="">room</option>
											<option value="internal">internal</option>
											<option value="surgery">surgery</option>
										</select>
									</div>
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon">list:</span>
									<textarea id="result" name="deblock_udid" rows="16"
										style="min-width: 90%" class="form-control"></textarea>
								</div>
								<br>
								<!-- <div class="input-group">
									<span class="input-group-addon">开药列表</span>
								</div>
								<br> -->
								<div class="input-group">
									<span class="input-group-addon">method:</span>
									<textarea id="usekind" name="deblock_udid" rows="8"
										style="min-width: 90%" class="form-control"></textarea>
								</div>
							</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">close</button>
					<button type="button" id="delyes_btn" class="btn btn-primary"
						data-dismiss="modal">confirm</button>
					<!-- <button type="button" class="btn btn-white" data-dismiss="modal" id="ex">导出文件</button> -->
				</div>
			</div>
		</div>
	</div>
	<!--新增弹窗  begin-->
	<div class="modal inmodal fade" id="del_myModal1" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">sure delete</h4>
				</div>
				<div class="modal-body">
					<p>
						<strong>sure?！</strong> delete
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">close</button>
					<button type="button" id="delyes_btn1" class="btn btn-primary"
						data-dismiss="modal">yes</button>
				</div>
			</div>
		</div>
	</div>
	<!--新建弹窗  begin-->
	<div class="modal inmodal fade" id="del_myModal2" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">新建检查单</h4>
				</div>
				<div class="modal-body">
					<table class="table" id="mytable">
						<thead>
							<tr>
								<th>姓名:<input type="text" id="name1"/></th>
								<th>性别:<input type="text" id="sex1" style="width: 50px" /></th>
								<th>年龄:<input type="text" id="age1" style="width: 50px" /></th>
								<th>检查项目:<input type="text" id="jcxm"/></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th colspan=4>检查科室:
								<input type="text" id="room" /></th>
							</tr>
							<tr>
								<th colspan=4>检查结果:
								<textarea id="checkresult" name="deblock_udid" rows="16"
										style="min-width: 90%" class="form-control"></textarea></th>
							</tr>
							<tr>
								<td colspan=4>检查时间:<input type="date" id="checkdate"/></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-white" data-dismiss="modal" id="ex1">新建并导出检查单</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
$(function(){
	//加载输入框
	$('.input-group-add').initInputGroup({
		'widget': 'input', //输入框组中间的空间类型
		/*'add' : '添加',
		'del' : '删除'*/
		'field': 'data',
		'data': []
	});
	//加载数据
	$('#doctor').bootstrapTable({
		url:"<%=request.getContextPath()%>/Doctor/orderuser.json",
			clickToSelect : true,
			singleSelect : true,
			toolbar : '#toolbar',
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
				title : '医生编号',
				align : "center"
			}, {
				field : 'doctorName',
				title : '医生姓名',
				align : "center",
			}, {
				field : 'orderName',
				title : '病人名字',
				align : "center",
			}, {
				field : "orderTime",
				title : "预约时间",
				formatter : function(value, row,index){
					var si =  new Date(value);
					return si.getFullYear()+"年"+(si.getMonth()+1)+"月"+si.getDate()+"日"
				},
				align : "center",
			},/*  {
				title : '操作',
				formatter : function(value, row,
						index) {
						return '<button class="btn btn-info" onclick="newset()">&nbsp;新建检查单</button>&nbsp;<button class="btn btn-info" onclick="redirectToSurveyData()">&nbsp;新建诊疗记录</button>&nbsp;<button class="btn btn-danger" onclick="dele()">删除记录</button>';
				},
				align : "center",
			} */],
		});
		function queryParams(params) {
			var pars = {
					limit: params.limit,
			        offset: params.offset
			}; 
			return pars;
		};
	})
	$("#cli").click(function(){
		/********刷新表格*******/
			$("#doctor").bootstrapTable("refresh", {
				url:"<%=request.getContextPath()%>/Medicine/pageTest.shtml",
			});
	});
	
	function redirectToSurveyData(){
		var a= $('#doctor').bootstrapTable('getSelections','');
		console.log(a);
		if(a.length==0){
			toastr.success('请选择一条记录！', '提示');
		}else{
			$("#doctorname").val(a[0].doctorName);
			$("#oilname").val(a[0].orderName);
			$("#Mid").val(a[0].id);
			$("#del_myModal").modal('show');
		}
	}
	
	$("#delyes_btn").click(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/Doctor/trement",
			datatype:"json",
			data:{
				"sickId":$("#oilname").val(),
				"recordRoom":$("#txt_major1").val(),
				"recordResult":$("#result").val(),
				"careUse":$("#usekind").val(),
				"sex":$("#sex").val(),
				"age":$("#age").val(),
				"id":$("#Mid").val(),
			},
			success:function(response){
				if(response.result=='success'){
					toastr.success('新建成功！', '提示',{timeOut:1000});
					toastr.subscribe(function(){   //这个是让提示信息加载完消失之后在执行的刷新
					    window.location.reload();
					           });
				}
			}
		});
	})
	/*去人删除记录  */
	function dele(){
		$("#del_myModal1").modal('show');
	}
	/*刪除诊疗记录  */
	$("#delyes_btn1").click(function(){
		 var a= $('#doctor').bootstrapTable('getSelections','');
		if(a.length==0){
			toastr.success('请选择一条记录！', '提示');
		}else{
			var id = a[0].id;
			$.ajax({
				url:"<%=request.getContextPath()%>/Medicine/dele",
				datatype:"json",
				data:{"id":id},
				success:function(response){
					if(response.result=='success'){
						toastr.success('删除成功！', '提示',{timeOut:1000});
						toastr.subscribe(function(){   //这个是让提示信息加载完消失之后在执行的刷新
						    window.location.reload();
						           });
					}else{
						toastr.danger('删除失败！', '提示',{timeOut:1000});
						toastr.subscribe(function(){   //这个是让提示信息加载完消失之后在执行的刷新
						    window.location.reload();
						           });
					}
					
				}
			});
		} 
	});
	function newset(){
	var a = $('#doctor').bootstrapTable('getSelections', '');
		if (a.length == 0) {
			toastr.success('请选择一条记录！', '提示');
		} else {
			$("#name1").val(a[0].orderName);
			$("#del_myModal2").modal('show');
		}
	}
	$("#ex").click(function() {
		excel()
	});
	/*********导出excel begin********/
	function excel() {
		/*  var a=  $("#reportperiod_year").val();
		 var b=  $("#reportperiod_month").val();
		 var str="备案企业数"+(a+b); */
		$("#doctor").table2excel({
			// 不被导出的表格行的CSS class类
			exclude : ".noExl",
			// 导出的Excel文档的名称，（没看到作用）
			name : "",
			// Excel文件的名称
			filename : "ssss",
			//文件后缀名
			fileext : ".txt"
		});
	}
	$("#ex1").click(function() {
		var name = $("#name1").val();
		var sex = $("#sex1").val();
		var kind = $("#jcxm").val();
		var room = $("#room").val();
		var date = $("#checkdate").val();
		var age = $("#age1").val();
		$.ajax({
			url : "<%=request.getContextPath()%>/Doctor/check",
			datatype:"json",
			data:{"name":name,"sex":sex,"age":age,"checkroom":room,"date":date,"checkKind":kind},
			success:function(response){
				if(response.result=='success'){
					toastr.success('新建成功！', '提示',{timeOut:1000});
					toastr.subscribe(function(){   //这个是让提示信息加载完消失之后在执行的刷新
					    window.location.reload();
					           });
				}else{
					toastr.danger('新建失败！', '提示',{timeOut:1000});
					toastr.subscribe(function(){   //这个是让提示信息加载完消失之后在执行的刷新
					    window.location.reload();
					           });
				}
			}
		});
		$("#mytable").tableExport({type:'doc',escape:"false"
       });
	});
	
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>checklist
</title>
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
        bootstrap-table/src/extensions/export/bootstrap-table-export.js
      "></script>
</head>
<body style="background-color: #808080">
<div class="container">
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
					<table id="checklist" style="margin-top: 20px"></table>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
	<!--新建弹窗  begin-->
	<div class="modal inmodal fade" id="del_myModal3" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">Save check result</h4>
				</div>
				<div class="modal-body">
					<table class="table" id="mytable">
						<thead>
							<tr>
								<th>name:<span id="name1" ></span></th>
								<th>sex:<span id="sex1" ></span></th>
								<th>age:<span id="age1" ></span></th>
								<th>inspection item:<span id="jcxm" ></span></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th colspan=4>Examination of departments:
								<span id="room" ></span></th>
							</tr>
							<tr>
								<th colspan=4>result:
								<textarea id="checkresult" name="deblock_udid" rows="16"
										style="min-width: 90%" class="form-control"></textarea></th>
							</tr>
							<tr>
								<td colspan=4>time:<span id="checkdate1" ></span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">close</button>
					<button type="button" class="btn btn-white" data-dismiss="modal" id="ex2">save</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var id="";
$(function(){
	//加载数据
	$('#checklist').bootstrapTable({
		url:"<%=request.getContextPath()%>/Doctor/everychecklist.json",
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
			}, {
				field : 'name',
				title : 'name',
				align : "center",
			}, {
				field : 'sex',
				title : 'sex',
				align : "center",
			}, {
				field : "age",
				title : "age",
				align : "center",
			}, {
				field : "checkroom",
				title : "room",
				align : "center",
			}, {
				field : "checktime",
				title : "time",
				formatter : function(value, row,index){
					var si =  new Date(value);
					return si.getFullYear()+"year"+(si.getMonth()+1)+"month"+si.getDate()+"day"
				},
				align : "center",
			}, {
				field : "checkKind",
				title : "item",
				align : "center",
			}, {
				field : "checkResult",
				title : "result",
				formatter : function(value, row,
						index) {
						return '<button class="btn btn-danger" onclick="make()">edited</button>';
				},
				align : "center",
			}],
		});
	function queryParams(params) {
		var pars = {
				limit: params.limit,
		        offset: params.offset,
		        name : params.search
		}; 
		return pars;
	};
});
function make(){
	var a= $('#checklist').bootstrapTable('getSelections','');
	if(a.length==0){
		toastr.info('selet one！', 'note');
	}else{
		$("#name1").html(a[0].name);
		$("#sex1").html(a[0].sex);
		$("#jcxm").html(a[0].checkKind);
		$("#room").html(a[0].checkroom);
		$("#age1").html(a[0].age);
		$("#checkdate1").html(zh(a[0].checktime));
		id = a[0].checkId;
		$("#del_myModal3").modal('show');
	}
$("#ex2").click(function(){
	var result = $("#checkresult").val();
	$.ajax({
		url:"<%=request.getContextPath()%>/Doctor/saveresult",
		datatype:"json",
		data:{"checkResult":result,"checkId":id},
		success:function(response){
			if(response.result=='success'){
				toastr.success('oksave！', 'not',{timeOut:1000});
				toastr.subscribe(function(){   //这个是让提示信息加载完消失之后在执行的刷新
				    window.location.reload();
				           });
			}else{
				toastr.danger('fail save！', 'note',{timeOut:1000});
				toastr.subscribe(function(){   //这个是让提示信息加载完消失之后在执行的刷新
				    window.location.reload();
				           });
			}
		}
	});
});
}
//日期格式化
function zh(value) {
		var si = new Date(value);
		return si.getFullYear() + "y" + (si.getMonth() + 1) + "m"
				+ si.getDate() + "d"
	}
</script>
</html>
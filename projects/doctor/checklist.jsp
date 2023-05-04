<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>checklist</title>
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
<body style="background-color: #808080 ">
<div class="container">
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10" style="margin-top: 100px;">
				<div class="col-md-1">
				
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
					<h4 class="modal-title">result</h4>
				</div>
				<div class="modal-body">
					<table class="table" id="mytable">
						<thead>
							<tr>
								<th>name:<input type="text" id="name1" /></th>
								<th>sex:<input type="text" id="sex1" style="width: 50px" /></th>
								<th>age:<input type="text" id="age1" style="width: 50px" /></th>
								<th>item:<input type="text" id="jcxm"/></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th colspan=4>Examination of departments:
								<input type="text" id="room" /></th>
							</tr>
							<tr>
								<th colspan=4>Examination of departments:
								<textarea id="checkresult" name="deblock_udid" rows="16"
										style="min-width: 90%" class="form-control"></textarea></th>
							</tr>
							<tr>
								<td colspan=4>Examination of time:<p id="date"></p></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon2">Examination of result::</span><input id="resul" type="text" class="form-control"
						placeholder="输入确诊结果" aria-describedby="basic-addon2">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal" id="result">confirm</button>
					<button type="button" class="btn btn-white" data-dismiss="modal">close</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function(){
	//加载数据
	$('#checklist').bootstrapTable({
		url:"<%=request.getContextPath()%>/Doctor/checklist.json",
			clickToSelect : true,
			singleSelect : true,
			toolbar : '#toolbar',
			toolbarAlign : '-',
			search:true,
			searchOnEnterKey:true,
			searchText:" ",
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
					return si.getFullYear()+"y"+(si.getMonth()+1)+"m"+si.getDate()+"d"
				},
				align : "center",
			}, {
				field : "checkKind",
				title : "checkKind",
				align : "center",
			}, {
				field : "checkResult",
				title : "checkResult",
				formatter : function(value, row,
						index) {
						return value==null?"have not finished":'<button class="btn btn-danger" onclick="look()">view result </button>';
				},
				align : "center",
			}],
		});
	function queryParams(params) {
		var pars = {
				limit: params.limit,
		        offset: params.offset,
		        search: params.search
		}; 
		return pars;
	};
});
function look(){
	var a= $('#checklist').bootstrapTable('getSelections','');
	if(a.length==0){
		toastr.info('请选择一条记录！', '提示');
	}else{
		$("#name1").val(a[0].name);
		$("#sex1").val(a[0].sex);
		$("#jcxm").val(a[0].checkKind);
		$("#room").val(a[0].checkroom);
		$("#age1").val(a[0].age);
		$("#checkresult").val(a[0].checkResult)
		$("#date").html(da(a[0].checktime));
		$("#del_myModal3").modal('show');
	}
function da(param){
	var si =  new Date(param);
	return si.getFullYear()+"年"+(si.getMonth()+1)+"月"+si.getDate()+"日"
}
}
//疾病确诊
$("#result").click(function(){
	
	$.ajax({
			url : "<%=request.getContextPath()%>/Medicine/comfirmresult",
			type : "POST",
			datatype : "JSON",
			data : {
				name : $("#name1").val(),
				sex : $("#sex1").val(),
				age : $("#age1").val(),
				ilname : $("#resul").val()
			},
			success : function(response) {
				if(response == 'success'){
					alert("更新成功")
				}
			}
		});
	});
</script>
</html>
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
	<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tableExport.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-table/src/extensions/export/bootstrap-table-export.js
      "></script>
</head>
<body style="background-color: #808080">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8" style="margin-top: 100px;">
				<div class="col-md-1" >
					<div class="input-group" style="margin-left: 5px">
						<!-- <span class="input-group-addon">请输入关键字</span> <input type="text" id = "name"
							class="form-control" style="width: 120px; float: left" value=""> <span class="input-group-btn">
							<button class="btn btn-default" type="button" id="cli">查询</button>
						</span> -->
					</div>
				</div>
				<div style="margin-top: 20px">
					<table id="medicine" style="margin-top: 20px"></table>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">处方单</h4>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">病人姓名:</span> <input type="text"
							class="form-control" id="oilname" placeholder="病人姓名" disabled=true>
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">处方单:</span>
						<textarea id="result" name="deblock_udid" rows="14"
							style="min-width: 90%" class="form-control" disabled=true></textarea>
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">使用方法:</span>
						<textarea id="usekind" name="deblock_udid" rows="8"
							style="min-width: 90%" class="form-control" disabled=true ></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
<script>
$(function(){
	$('#medicine').bootstrapTable({
		url:"<%=request.getContextPath()%>/Medicine/getorderlist",
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
				title : '医生',
				align : "center"
			}, {
				field : 'sickId',
				title : '病人姓名',
				align : "center",
			}, {
				field : 'sex',
				title : '性别',
				align : "center",
			},{
				field : 'age',
				title : '年龄',
				align : "center",
			}, {
				field : "recordRoom",
				title : "诊疗科室",
				align : "center",
			}, {
				field : "recordTime",
				title : "诊疗时间",
				formatter : function(value, row,index){
					var si =  new Date(value);
					return si.getFullYear()+"年"+(si.getMonth()+1)+"月"+si.getDate()+"日"
				},
				align : "center"
			}, {
				field : "careUse",
				title : "使用方法",
				align : "center",
				visible:false
			} , {
				field : "recordResult",
				title : "结果",
				align : "center",
				visible:false
			}, {
				title :"处方单",
				align : "center",
				formatter:function(value,row,index){
					return "<button type='button' class='btn btn-success' data-toggle='modal' onclick='getData()' >查看处方详情</button>"
				}
			} ],
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
	})
	$("#cli").click(function(){
		/********刷新表格*******/
			$("#medicine").bootstrapTable("refresh", {
				url:"<%=request.getContextPath()%>/Medicine/getorderlist",
			});
	});
	function getData(){
		var a = $('#medicine').bootstrapTable('getSelections');
		if(a.length == 1){
			$("#oilname").val(a[0].sickId);
			$("#result").val(a[0].recordResult);
			$("#usekind").val(a[0].careUse);
			$("#myModal").modal('show');
		}else{
			toastr.warning('请先选中数据！','提示');
		}
	}
</script>
</html>
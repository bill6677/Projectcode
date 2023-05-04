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
</head>
<body style="background-color:#808080">
	<div class="container">
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10" style="margin-top: 100px;">
				<div class="col-md-1" >
					<div class="input-group" style="margin-left: 5px">
						<span class="input-group-addon">请输入关键字</span> <input type="text" id = "name"
							class="form-control" style="width: 120px; float: left" value=""> <span class="input-group-btn">
							<button class="btn btn-default" type="button" id="cli">查询</button>
						</span>
					</div>
				</div>
				<div style="margin-top: 20px">
				<button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#myModal2">查看出库记录</button>
					<table id="medicine" style="margin-top: 20px"></table>
				</div>
			</div>
			<div class="col-lg-1"></div>
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
					<h4 class="modal-title" id="myModalLabel">出库数量</h4>
				</div>
				<div class="modal-body">
					<div class="input-group">
						<span class="input-group-addon">请输入数量:</span> <input type="text"
							class="form-control" id="number" placeholder="数量" >
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" id="confirm2" class="btn btn-primary">确定出库</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					药品出库记录
				</h4>
			</div>
			<div class="modal-body">
				<table id="medicine1" style="margin-top: 20px"></table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" 
						data-dismiss="modal">关闭
				</button>
				<!-- <button type="button" class="btn btn-primary">
					提交更改
				</button> -->
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
<script>
var Moid="";
$(function(){
	$('#medicine').bootstrapTable({
		url:"<%=request.getContextPath()%>/Medicine/pageTest.shtml",
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
				field : 'mname',
				title : '药   名',
				align : "center"
			},{
				field : 'mnoid',
				title : '药的ID',
				align : "center",
				visible:false
			}, {
				field : 'mspecs',
				title : '规   格',
				align : "center",
			}, {
				field : 'munit',
				title : '单  位',
				align : "center",
			}, {
				field : "mprice",
				title : "出售单价",
				align : "center",
			}, {
				field : "mdate",
				title : "生产日期",
				formatter : function(value, row,index){
					var si =  new Date(value);
					return si.getFullYear()+"年"+(si.getMonth()+1)+"月"+si.getDate()+"日"
				},
				align : "center"
			}, {
				field : "mval",
				title : "有效日期(月)",
				align : "center"
			} , {
				field : "mnumber",
				title : "库存数量",
				align : "center"
			} , {
				field : "sno",
				title : "供应商编号",
				align : "center"
			} , {
				field : "iscf",
				title : "是否为处方药",
				align : "center"
			} , {
				field : "",
				title : "操作",
				align : "center",
				formatter:function(value,row,index){
					return "<button type='button' class='btn btn-success' data-toggle='modal' onclick='output()' >药品出库</button>"
				}
			}],
		});
		function queryParams(params) {
			var pars = {
					limit: params.limit,
			        offset: params.offset,
			        name:$("#name").val()
			}; 
			return pars;
		};
	})
	$("#cli").click(function(){
		/********刷新表格*******/
			$("#medicine").bootstrapTable("refresh", {
				url:"<%=request.getContextPath()%>/Medicine/pageTest.shtml",
			});
	});
	function output(){
		var a = $('#medicine').bootstrapTable('getSelections');
		if(a.length==0){
			toastr.warning('请先选中数据！','提示');
		}else{
			Moid = a[0].id;
			$("#myModal").modal('show');
		}
	
	$("#confirm2").click(function() {
			var number = $("#number").val();
			$.ajax({
				url:"<%=request.getContextPath()%>/Medicine/confirm.json",
				datatype:"JSON",
				type:'POST',
				data:{"number":number,"id":Moid},
				success:function(response){
					if(response.result=='success'){
						toastr.success('更新成功！','提示',{timeOut:1000});
						toastr.subscribe(function(){   //这个是让提示信息加载完消失之后在执行的刷新
						    window.location.reload();
						           });
					}else if(response.result == 'fail'){
						toastr.error('库存不足,更新失败!','提示',{timeOut:1000});
						toastr.subscribe(function(){   //这个是让提示信息加载完消失之后在执行的刷新
						    window.location.reload();
						           });
					}
				}
			});
		});
	}
	$('#myModal2').on('shown.bs.modal', function () {
		$('#medicine1').bootstrapTable({
			url:"<%=request.getContextPath()%>/Medicine/medinicerecord",
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
					field : 'mname',
					title : '药   名',
					align : "center"
				},{
					field : 'mnoid',
					title : '药的ID',
					align : "center",
					visible:false
				}, {
					field : 'mspecs',
					title : '规   格',
					align : "center",
				}, {
					field : 'munit',
					title : '单  位',
					align : "center",
				}, {
					field : "mprice",
					title : "出售单价",
					align : "center",
				}, {
					field : "mdate",
					title : "出库日期",
					formatter : function(value, row,index){
						var si =  new Date(value);
						return si.getFullYear()+"年"+(si.getMonth()+1)+"月"+si.getDate()+"日"
					},
					align : "center"
				}, {
					field : "mval",
					title : "有效日期(月)",
					align : "center"
				} , {
					field : "mnumber",
					title : "数量",
					align : "center"
				} , {
					field : "sno",
					title : "供应商编号",
					align : "center"
				} , {
					field : "iscf",
					title : "是否为处方药",
					align : "center"
				} ,  /* {
					field : "",
					title : "操作",
					align : "center",
					formatter:function(value,row,index){
						return "<button type='button' class='btn btn-success' data-toggle='modal' onclick='output()' >药品出库</button>"
					}
				}  */],
			});
			function queryParams(params) {
				var pars = {
						limit: params.limit,
				        offset: params.offset,
				       	name:$("#name").val()
				}; 
				return pars;
			};
		})
</script>
</html>
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
<body>
<body style="background-color: #808080">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8" style="margin-top: 100px;">
				<div class="col-md-1">
					 <select id="txt_major" class="form-control" style="width: 103px"
						onchange="refreshProjectclueInfo()">
						<option selected="selected" value="">全部科室</option>
						<option value="内科">内科</option>
						<option value="眼科">眼科</option>
						<option value="骨科">骨科</option>
					</select>
				</div>
				<div style="margin-top: 20px">
					<table id="doctor" style="margin-top: 20px"></table>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
	<!-- 选择日期的模态框开始 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">请选择日期</h4>
            </div>
            <div class="modal-body">日期选择:<input type="date" id="date"/></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="getda()">提交预约</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</div>
</body>
<script>
var params;
$(function(){
	$('#doctor').bootstrapTable({
		url:"<%=request.getContextPath()%>/Doctor/doctor.json",
			clickToSelect : true,
			singleSelect : true,
			toolbar : '#toolbar',
			toolbarAlign : '-',
			pagination : 'true',
			search:true,
			searchOnEnterKey:true,
			searchText:" ",
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
				field : 'rooms',
				title : '科室',
				formatter:function(value, row,index){
					return value[0].roomName;
				},
				align : "center",
			}, {
				field : "exitStatu",
				title : "能否预约",
				formatter:function(value, row,index){
					if(value=='1'){
						return "可以预约";
					}else{
						return "不能预约";
					}
				},
				align : "center",
			}, {
				field : "",
				title : "选择预约日期",
				formatter:function(value, row,index){
					return '<input type="date" id="'+row.doctorId+'"/>';
				},
				align : "center",
			},   {
				title : '操作',
				formatter : function(value, row,
						index) {
					if(row.exitStatu=='1'){
						return '<div style="width:75px;margin:0 auto;"><button class="btn btn-info" onclick="redirectToSurveyData(\''
						+ row.doctorId
						+ ','
						+ row.doctorName
						+ '\')"><i class="fa fa-search">&nbsp;立即预约</i></button></div>';
					}else if(row.exitStatu=='0'){
						return '<div style="width:75px;margin:0 auto;"><button class="btn btn-info" onclick="redirectToSurveyData(\''
						+ row.doctorId
						+ ','
						+ row.doctorName
						+ '\')" disabled=ture ><i class="fa fa-search">&nbsp;立即预约</i></button></div>';
					} 
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
	})
	$("#cli").click(function(){
		/********刷新表格*******/
			$("#doctor").bootstrapTable("refresh", {
				url:"<%=request.getContextPath()%>/Medicine/pageTest.shtml",
			});
	});
	function redirectToSurveyData(param){
		var data = param.split(',');
		var doctorId = data[0];
		var doctorName = data[1];
		var date = $("#"+doctorId+"").val();
		var date1 = new Date(date).getTime();
		var _second = new Date().getTime();
		if(date!=''&&date1>_second){
			$.ajax({
				url:"<%=request.getContextPath()%>/Doctor/order",
				datatype:"json",
				data:{"doctorId":doctorId,"doctorName":doctorName,"date":date},
				success:function(response){
					if(response.result=='success'){
						toastr.success('预约成功！', '提示');
					}else if(response.result=='fail'){
						toastr.error('预约人数已满或者已经预约过了', '提示');
					}
				}
			});
		}else{
				toastr.info('请选择正确的预约日期！', '提示');
		}
	}
	<%-- function getda(param){
		var date = $("#date").val();
		var data = param.split(',');
		var doctorId = data[0];
		var doctorName = data[1];
			$.ajax({
				url:"<%=request.getContextPath()%>/Doctor/order",
				datatype:"json",
				data:{"doctorId":doctorId,"doctorName":doctorName,"date":date},
				success:function(response){
					if(response.result=='success'){
						toastr.success('预约成功！', '提示');
					}
				}
			});
	} --%>
	<%-- function cdate(param){
		var data = param.split(',');
		var doctorId = data[0];
		var doctorName = data[1];
		$.ajax({
			url:"<%=request.getContextPath()%>/Doctor/order",
			datatype:"json",
			data:{"doctorId":doctorId,"doctorName":doctorName},
			success:function(response){
				if(response.result=='success'){
					toastr.success('预约成功！', '提示');
				}
			}
		}); --%>
	
</script>
</body>

</html>
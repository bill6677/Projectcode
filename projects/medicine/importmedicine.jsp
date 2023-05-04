 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
 <html> 
<head> 
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />
 <title>药品清单导入here</title> 
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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/webuploader.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/webuploader.js"></script>
</head> 
 <body style="background-color: #808080"> 
	<div class="container-fluid"> 
		<div class="row"> 
			<div class="col-lg-4" style="margin-top: 100px;"> 
				<div class="col-sm-12"> 
					<div class="col-sm-7">
 						<input id="txt_file" type="text" placeholder="文件" >
						<class="form-control" /> 
 					</div>
				<div class="col-sm-3" style="width: 130px" id="btn_selectFile">选择文件</div> 
					<div class="col-sm-1" id="btn_selectFile"> 
						<button type="button" id="btn_upload" class="btn btn-success button-left" >上传</button> 
					</div> 
				</div>
			</div>
		<div class="col-lg-8" style="margin-top: 100px;"> 
		<span style=" font-size: 18px;font-family:Fantasy">药品清单:</span>
 			<div style="height: auto;overflow:auto">
			<table id="medicine" class="table table-bordered table-hover"></table>
			</div> 
			<div class="col-lg-8"> 
				<button type="button" id="pass" style="position: fixed; bottom:0;" class="btn btn-danger">确定导入</button> -->
			</div> 
			</div> 
 		</div> 
 	</div> 
	<div class="container"> 
 		<div class="row"> 
			<div class="col-lg-4"></div>
			
		</div> 
 	</div>
 </body> 
 <script> 
 $(function(){
 	fileData();
 });
 function fileData(){
 	$('#medicine').bootstrapTable({
		url:"<%=request.getContextPath()%>/Medicine/pageTest1.shtml",
			clickToSelect : true,
 			singleSelect : true,
			height : 500,
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
 			} ],
 		});
 		function queryParams(params) {
 			var pars = {
 					limit: params.limit,
 			        offset: params.offset 
 			}; 
 			return pars;
 		};
 	}
 		var uploader = WebUploader.create({
 			// swf文件路径
 			swf: 'js/Uploader.swf',
 			// 文件接收服务端。
			server: '<%=request.getContextPath()%>/Medicine/importfile',
			// 选择文件的按钮。可选。
 			// 内部根据当前运行是创建，可能是input元素，也可能是flash.
 			pick: '#btn_selectFile',
 			// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
 			resize: false
 		});
 		// 当有文件添加进来的时候
 		uploader.on('fileQueued', function(file) {
 			$("#txt_file").val(file.name);
 		});
 		// 文件上传过程中创建进度条实时显示。
 		uploader.on('uploadProgress', function(file, percentage) {
 			var $li = $('#' + file.id),
 				$percent = $li.find('.progress .progress-bar');
 			// 避免重复创建
 			if(!$percent.length) {
 				$percent = $('<div class="progress progress-striped active">' +
 					'<div class="progress-bar" role="progressbar" style="width: 0%">' +
 					'</div>' +
 					'</div>').appendTo($li).find('.progress-bar');
 			}
 			$li.find('p.state').text('上传中');
 			$percent.css('width', percentage * 100 + '%');
 		});
 		uploader.on('uploadSuccess', function(file,respone) {
 			if (respone.result == 'success') {
 				toastr.success('上传成功！', '提示');
 				location.reload();
 				//$("#txt_file").val("");
 				uploader.reset();
 			} else if (respone.result == "fail") {
 				// 上传错误或失败
 				toastr.error('上传失败，请不要重复导入数据！', '提示');
 			}
		});
 		uploader.on('uploadError', function(file) {
 			$('#' + file.id).find('p.state').text('上传出错');
		});
		uploader.on('uploadComplete', function(file) {
 			$('#' + file.id).find('.progress').fadeOut();
 		});
 		/* 上传按钮 */
		$('#btn_upload').on('click', function() {
 			isClick = true;
 			if($("#txt_file").val() != "") {
 				$("#modal_loading").modal({
 					show : true,
 					backdrop: 'static',
					keyboard: false
				})
 				uploader.upload();
			}else {
 				toastr.warning('已经上传过了！','提示')
 			}
		});
		
 		$("#pass").click(function(){
 			$.ajax({
				url:"<%=request.getContextPath()%>/Medicine/insert",
				data:{},
 				datatype:"json",
 				success:function(respone){
 					if(respone.result == 'success'){
						toastr.success('导入成功！', '提示');
 						location.reload();
					}else{
						toastr.warning('已经上传过了！','提示');
					}
 				}
 			});
		});
		function tableHeight() {
 	        return $(window).height() - 50;
 	    }
 	</script>
 </html>
comment
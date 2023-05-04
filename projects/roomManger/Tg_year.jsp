<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>年度报表</title>
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
</head>
<body>
<body style="background-color: #808080">
	<div class="container">
		<div class="row">
			<div id="pan2" class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>年度统计报表</h5>
					</div>
					<div id="pan1cont" class="ibox-content"
						style="display: block; overflow: auto;">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab"
								href="tabs_panels.html#tab-4"><i class="fa fa-laptop"></i></a></li>
							<!-- <li class=""><a data-toggle="tab" onclick="initEchart()"
								href="tabs_panels.html#tab-7"><i class="fa fa-bar-chart-o"></i></a>
							</li> -->
						</ul>
						<div class="tab-content">
							<div id="tab-4" class="tab-pane active">
								<div id="toolbar">
									<label class=" col-sm-1 control-label"
										style="padding-right: 0px; padding-left: 0px;">年选择:</label>
									<div class="col-md-1">
										<select id="reportperiod_year" class="form-control"
											name="reportperiod_year" style="float: left;width: 80px"
											onchange="refreshProjectclueInfo()">
											<option value="2017">2017</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
											<option value="2021">2021</option>
											<option value="2022">2022</option>
											<option value="2023">2023</option>
											<option value="2024">2024</option>
											<option value="2025">2025</option>
											<option value="2026">2026</option>
											<option value="2027">2027</option>
											<option value="2028">2028</option>
										</select>
									</div>
									 <!-- <div class="col-md-1">
										<select id="reportperiod_month" class="form-control"
											name="reportperiod_month" style="width: 110px; float: left"
											onchange="refreshProjectclueInfo()">
											<option value="感冒">感冒</option>
											<option value="糖尿病">糖尿病</option>
											<option value="高血压">高血压</option>
										</select>
									</div>  -->
									<!-- <button id="excelImport_btn"
										class="btn btn-primary pull-right buttom-left">
										<i class="fa fa-file-excel-o"></i> 导出Excel
									</button> -->
								</div>
								<table id="departmentTable" class="table-hover"></table>
							</div>
							<div id="tab-7" class="tab-pane ">
								<!-- <div style="width: 100%; height: 400px" id="echarts-box"> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="col-sm-7 pull-left">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<h3 class="panel-title">药品数据报表</h3>
							</div>
							<div class="panel-body" >
								<div style="width:100%;height: 400px" id="echarts-box"></div>
							</div>
						</div>
					</div>
					<div class="col-sm-5 pull-right">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title">药品进货建议</h3>
							</div>
							<div class="panel-body">
								<div style="width:100%;height: 400px">
								<h3>本年度药品售卖量前三</h3>
								<h4 id="no1" style="color: red"></h4>
								<h5 id="no2"></h5>
								<h6 id="no3"></h6>
								<p>根据对去年的药品的销售数据分析对比给出以下的药品进货建议:</p>
								<p>根据数据统计获得今年<span id="No1"></span>这种药品的需求量居高,去年达到了<span id="No11"></span>盒</p>
								<small>以上的三种药品的需求量在今年可能会持续增加,可以对这三种药品进行适量的进货。</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
				<div class="col-sm-7 pull-right">
						<div class="panel panel-danger">
							<div class="panel-heading">
								<h3 class="panel-title">疾病数据报表</h3>
							</div>
							<div class="panel-body">
								<div style="width:100%;height: 400px" id="echarts-box1"></div>
							</div>
						</div>
					</div>
					<div class="col-sm-5 pull-left">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">疾病数据建议</h3>
							</div>
							<div class="panel-body">
								<div style="width:100%;height: 400px">
								<h3>年度疾病排行前三</h3>
								<h4 id="il1" style="color: red"></h4>
								<h5 id="il2"></h5>
								<h6 id="il3"></h6>
								<p>根据对去年的疾病排行数据分析对比给出以下的疾病预防建议:</p>
								<p>根据数据统计获得今年<span id="Noil1"></span>患病数量居高,去年达到了<span id="Noil11"></span>人</p>
								<small>1.洗洗更健康：早晨起来可以试着用冷水洗脸，可能很多人对这个还不太习惯，夏天的时候不太冷，冬天了可怎么办？其实不用太担心，热水和冷水搀在一起也可以。晚上睡觉前用热水洗脚，脚是很重要的部位，一定要保护好。。</small>
								<small>2.漱口有讲究：睡了一晚上觉，或者在外头呆了一天，口腔里必然会有很多细菌存在，怎么样消灭这些病菌呢？可以选择淡盐水，早晚使用淡盐水漱口刷牙。</small>
								<small>3.生命在运动：身体容易生病，关键在于抵抗力和免疫力的下降，那么多运动是改善健康很好的方法、途径。早上起来早一点，做点运动，哪怕是散散步、做做操也是可以的，平常如果有闲暇时间，也不要老呆在电脑跟前，出去锻炼一下一定是可以的。</small>
								<small>4.开窗透透气：对于经常在室内的人，比如宅男宅女们，千万不要一直捂在房间里，经常出去透透气，如果不想出去，至少也要经常打开门窗，给房间通风换气。</small>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts.min.js" ></script>
<script type="text/javascript">
   /***************js函数入口***************/
	$(function(){
		initEchart();
		initEchart1();
		//初始化table
		setTimeout(function(){
			tableInit();
		}, 300);
	});
   function  tableInit(){
		$('#departmentTable').bootstrapTable({
			url : '<%=request.getContextPath()%>/Manager/listYearData',
			clickToSelect : true,
			singleSelect : true,
			toolbar : '#toolbar',
			toolbarAlign : '-',
			pagination : 'true',
			sidePagination : 'server',
			pageSize:50,
			showRefresh : 'true',
			queryParams : queryParams,
			pageList : [50, 100, 'All' ],
			rowStyle: function (row, index) {
	             var style = {};
	                 style={css:{'color':'#836FFF'}};                
	             return style;
	         },
			//onClickRow : onClickRow,
			columns : [/* {
				 title : '序号',
				formatter: function (value, row, index) {  
		             return index+1;  
		         }  
			}, */  {
				title : '名称',
				field : 'item0',
				align : "center"
			},{
				title : '患病人数',
				field : 'item1',
				formatter: function(value,row,index){
					return row["item2"]==null?0:(row["item2"]);
					         //从数据库查出来的percent值,用toFixed进行保留两位数，然后添加上%即可
					},
				align : "center"
				
			},{
				title : '总人数占有比列(%)',
				field : 'item2',
				formatter: function(value,row,index){
					return row["item3"]==null?0:(row["item3"].toFixed(2));
					         //从数据库查出来的percent值,用toFixed进行保留两位数，然后添加上%即可
					},
				align : "center"
			}],
			formatNoMatches:function(){
				return "没有匹配的结果!";
			},
			formatLoadingMessage:function(){
				return "请导入数据......";
			}
		});
	}
   function queryParams(params) {
		var pars = {
			limit : params.limit,
			offset : params.offset,
			year:$("#reportperiod_year").val(),
			ilname:$("#reportperiod_month").val()
		};
		return pars;
	};
	/********刷新表格*******/
	function refreshProjectclueInfo(){
		$("#departmentTable").bootstrapTable("refresh",{
			url:'<%=request.getContextPath()%>/Manager/listYearData',
		});
		initEchart1();
	}
	function initEchart() {
		$("#echarts-box").width($("#pan2").width() - 20);
		/* var tableData = $("#departmentTable").bootstrapTable('getData');
		console.info(tableData);
		var xdata = [];
		var ydata1 = [];//男性
		var ydata2 = [];//女性
		for (var i = 0; i < tableData.length; i++) {
			xdata.push(tableData[i].item3)
			ydata1.push(tableData[i].item1);
			ydata2.push(tableData[i].item2);
		}
		console.info(xdata); */
		
		//获取药品数据
		$.ajax({
			url : "<%=request.getContextPath()%>/Manager/Medecine.json",
			type : "POST",
			datatype : "JSON",
			data : {},
			success : function(result) {
				/* console.info(result.ilnamedata)*/
				$("#no1").html('药品售量第一的药品:'+result.ilnamedata[0].item0);
				$("#No1").html(result.ilnamedata[0].item0);
				$("#No11").html(result.ilnamedata[0].item1)
				$("#no2").html('药品售量第二的药品:'+result.ilnamedata[1].item0);
				$("#no3").html('药品售量第三的药品:'+result.ilnamedata[2].item0);
				var medicinedata = [];
				var name = [];
				for (var i = 0; i < result.ilnamedata.length; i++) {
					name.push(result.ilnamedata[i].item0)
					medicinedata.push({value:result.ilnamedata[i].item1,name:result.ilnamedata[i].item0}) 
				} 
				/* console.info(name) */
				var option = {
					    title : {
					        text: '药品数据',
					        subtext: '纯属虚构',
					        x: 'left',
					        y: 'bottom'
					    },
					    tooltip : {
					        trigger: 'item',
					        formatter: "{a} <br/>{b} : {c}盒"
					    },
					    toolbox: {
					        show : true,
					        orient: 'vertical',
					        y: 'center',
					        feature : {
					            mark : {show: true},
					            dataView : {show: true, readOnly: false},
					            restore : {show: true},
					            saveAsImage : {show: true}
					        }
					    },
					    legend: {
					        orient: 'vertical',
					        x: 'left',
					        data : name
					    },
					    calculable : true,
					     series : [
					    	 /*{
					            name:'数量',
					            type:'funnel',
					            width: '40%',
					            height: '85%',
					            x:'5%',
					            y:'50%',
					            data:medicinedata
					        }, */
					       {
					            name:'数量',
					            type:'funnel',
					            width: '40%',
					            height: '75%',
					            x: '5%',
					            y: '5%',
					            sort : 'ascending',
					            data:medicinedata
					        },
					        /* {
					            name:'漏斗图',
					            type:'funnel',
					            width: '40%',
					            height: '45%',
					            x:'55%',
					            y: '5%',
					            itemStyle: {
					                normal: {
					                    // color: 各异,
					                    label: {
					                        position: 'left'
					                    }
					                }
					            },
					            data:[
					                {value:60, name:'访问'},
					                {value:30, name:'咨询'},
					                {value:10, name:'订单'},
					                {value:80, name:'点击'},
					                {value:100, name:'展现'}
					            ]
					        },
					        {
					            name:'金字塔',
					            type:'funnel',
					            width: '40%',
					            height: '45%',
					            x:'55%',
					            y:'50%',
					            sort : 'ascending',
					            itemStyle: {
					                normal: {
					                    // color: 各异,
					                    label: {
					                        position: 'left'
					                    }
					                }
					            },
					            data:[
					                {value:60, name:'访问'},
					                {value:30, name:'咨询'},
					                {value:10, name:'订单'},
					                {value:80, name:'点击'},
					                {value:100, name:'展现'}
					            ]
					        } */
					    ]
					};
					                    

					var main1 = echarts.init(document.getElementById("echarts-box"));
					main1.setOption(option);
			}
		});
		
	}
	function initEchart1() {
		$("#echarts-box").width($("#pan2").width() - 20);
		/* var tableData = $("#departmentTable").bootstrapTable('getData');
		console.info(tableData);
		var xdata = [];
		var ydata1 = [];//男性
		var ydata2 = [];//女性
		for (var i = 0; i < tableData.length; i++) {
			xdata.push(tableData[i].item3)
			ydata1.push(tableData[i].item1);
			ydata2.push(tableData[i].item2);
		}
		console.info(xdata); */
		$.ajax({
			url : "<%=request.getContextPath()%>/Manager/Medecine1.json",
			type : "POST",
			datatype : "JSON",
			data : {year:$("#reportperiod_year").val()},
			success : function(result) {
				/* console.info(result.ilnamedata)*/
				$("#il1").html('第一是:'+result.ilnamedata1[0].item0);
				$("#Noil1").html(result.ilnamedata1[0].item0);
				$("#Noil11").html(result.ilnamedata1[0].item2)
				$("#il2").html('第二是:'+result.ilnamedata1[1].item0);
				$("#il3").html('第三是:'+result.ilnamedata1[2].item0);
				var medicinedata1 = [];
				var name1 = [];
				for (var i = 0; i < result.ilnamedata1.length; i++) {
					
					name1.push(result.ilnamedata1[i].item0)
					medicinedata1.push({value:result.ilnamedata1[i].item2,name:result.ilnamedata1[i].item0}) 
				} 
				var option = {
						color : [ 'rgba(255, 69, 0, 0.5)', 'rgba(255, 150, 0, 0.5)',
								'rgba(255, 200, 0, 0.5)', 'rgba(155, 200, 50, 0.5)',
								'rgba(55, 200, 100, 0.5)' ],
						title : {
							text : '疾病数据报表',
							subtext : '纯属虚构'
						},
						tooltip : {
							trigger : 'item',
							formatter : "{a} <br/>{b} : {c}位"
						},
						toolbox : {
							show : true,
							feature : {
								mark : {
									show : true
								},
								dataView : {
									show : true,
									readOnly : false
								},
								restore : {
									show : true
								},
								saveAsImage : {
									show : true
								}
							}
						},
						legend : {
							data : name1
						},
						calculable : true,
						series : [ {
							name : '数量',
							type : 'funnel',
							x : '10%',
							width : '80%',
							itemStyle : {
								normal : {
									label : {
										formatter : '{b}数量'
									},
									labelLine : {
										show : false
									}
								},
								emphasis : {
									label : {
										position : 'inside',
										formatter : '{b}数量 : {c}位'
									}
								}
							},
							data : medicinedata1
						}  , {
							name : '实际',
							type : 'funnel',
							x : '10%',
							width : '80%',
							maxSize : '80%',
							itemStyle : {
								normal : {
									borderColor : '#fff',
									borderWidth : 2,
									label : {
										position : 'inside',
										formatter : '{c}位',
										textStyle : {
											color : '#fff'
										}
									}
								},
								emphasis : {
									label : {
										position : 'inside',
										formatter : '{b}患病: {c}位'
									}
								}
							},
							data :medicinedata1
						}    ]
					};

					var main1 = echarts.init(document.getElementById("echarts-box1"));
					main1.setOption(option);
			}
		});
		
	}
</script>
</html>
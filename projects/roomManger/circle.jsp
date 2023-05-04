<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发病率</title>
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
<style type="text/css">
body{
	font-size: 14px;
	line-height: 1.428;
	/* -webkit-filter:brightness(1);//兼容不同浏览器
	-o-filter:brightness(1);
	-moz-filter:brightness(1);
	filter:brightness(1);//设置亮度值，范围：0-1 */
	-webkit-filter: saturate(3.6);
	filter: saturate(3.6);
}
p.ex2{
	font:15px arial,sans-serif; 
}
      </style>
</head>
<body style="background-color: #808080">
	<div class="container">
		<div class="row">
			<div id="pan2" class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>发病率</h5>
					</div>
					<div id="pan1cont" class="ibox-content"
						style="display: block; overflow: auto;">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab"
								href="tabs_panels.html#tab-4"><i class="fa fa-laptop"></i></a></li>
							<li class=""><a data-toggle="tab" onclick="initEchart()"
								href="tabs_panels.html#tab-7"><i class="fa fa-bar-chart-o"></i></a>
							</li>
						</ul>
						<div class="tab-content">
							<div id="tab-4" class="tab-pane active">
								<div id="toolbar">
									<label class=" col-sm-1 control-label"
										style="padding-right: 0px; padding-left: 0px;">疾病选择:</label>
									<div class="col-md-1">
										<select id="reportperiod_year" class="form-control"
											name="reportperiod_year" style="width: 110px"
											onchange="refreshProjectclueInfo()">
											<option value="感冒">流行感冒</option>
											<option value="高血压">高血压</option>
											<option value="糖尿病">糖尿病</option>
										</select>
									</div>
									<!-- <div class="col-md-1">
										<select id="reportperiod_month" class="form-control"
											name="reportperiod_month" style="width: 80px; float: left"
											onchange="refreshProjectclueInfo()">
											<option value="01">1</option>
											<option value="02">2</option>
											<option value="03">3</option>
											<option value="04">4</option>
											<option value="05">5</option>
											<option value="06">6</option>
											<option value="07">7</option>
											<option value="08">8</option>
											<option value="09">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</select>
									</div> -->
									<!-- <button id="excelImport_btn"
										class="btn btn-primary pull-right buttom-left">
										<i class="fa fa-file-excel-o"></i> 导出Excel
									</button> -->
								</div>
								<table id="departmentTable" class="table-hover"></table>
							</div>
							<div id="tab-7" class="tab-pane ">
								<div style="width: 100%; height: 400px" id="echarts-box"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="container" style="height: 100%"></div>
	<div class="conrainer">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
			<h3>结果分析:</h3>
			<h4>一，综合分析</h4>
			<div class="lead"><small><p class="ex2">1.从年龄分布段来看2017年流行感冒的集中发病年龄段在10岁到30岁之间，其中20-30岁之间的人群中发病人数高达100位+，其中发病率高达80%，其中年龄段在40-90岁的人群中发病人数较少，发病率较低，不足5%</p>
			<p class="ex2">2.2017年高血压的集中发病年龄段在50岁到90岁之间，其中60-90岁之间的人群中发病人数高达100位+，其中发病率高达80%，其中年龄段在0-30岁的人群中发病人数较少，发病率较低，不足5%</p></small>
			</div>
			<h3><b>讨论</b></h3>
			<div class="lead text-left"><small>
			<h4>二 讨 论</h4>
<p class="ex2">1.2016— 2017监测年度, 南方省份流感活动未出现明显的夏季活动高峰, 南、北方省份2017年秋冬流感流行季节均早于上一个监测年度, 分别提前约2个月和1个月, 但流行峰值水平低于2015— 2016监测年度。由于2016— 2017年冬春季南方流感活动水平较低, 预计2017年进入今年夏季流感流行季节后, 人群免疫力普遍会较低, 对流感病毒易感, 建议人群做好对流感病毒的防护措施。</p>

<p class="ex2">2.建议各地继续高度重视近期流感病毒活动情况, 密切关注全球及我国疫情形势, 加强监测数据的分析和利用, 跟踪流感病毒的活动水平、变异和耐药性变化, 及时开展流感暴发疫情的调查处置和应对工作。流感活动水平较高的疫情省份应加强对医疗机构的指导和临床救治工作, 对流感高危人群和重症患者及时使用抗流感病毒药物(神经氨酸酶抑制剂), 降低严重并发症和死亡发生风险。鼓励孕妇、老年人、婴幼儿、慢性病患者、医务人员等高危人群及时接种流感疫苗, 以减少流感发病和重症、死亡病例的发生。</p>

<p class="ex2">3.监测是预防控制流感的关键策略和措施之一, 为进一步加强全国流感监测工作, 提高流感监测工作质量和水平, 国家卫生计生委疾控局于2017年3月30日印发了<u>《全国流感监测方案(2017年版)》</u>(国卫办疾控函〔2017〕296号), 要求各级卫生行政部门和监测网络成员单位在2017-2018监测年度依据新的监测方案开展相关工作。已经批准为省级流感参比中心的省级疾病预防控制中心, 要按照《监测方案》和《省级流感参比中心评估管理方案》的要求, 切实履行省级流感参比中心的职责, 充分发挥参比中心的作用; 尚未成为省级流感参比中心的省级疾病预防控制中心, 要继续加强本省流感监测工作的组织实施和管理, 对辖区内网络实验室和哨点医院定期开展考核、评估和督导, 针对存在的问题和不足, 认真开展培训和技术指导, 持续加强流感监测和实验室检测工作, 全面提高辖区内流感监测的能力和水平。也建议各省级卫生行政管理部门加强对流感监测网络的管理, 对有需要的哨点医院进行加强培训和指导, 增强相关工作人员的积极性和责任心。要求各网络实验室切实按照《监测方案》的要求对毒株及时送检; 对于不能区分型别或亚型的毒株和阳性标本要求在48 h内送至国家流感中心, 对发现的新亚型(或疑似新亚型)的毒株和阳性标本应当立即送国家流感中心复核检测[5]</p>。</small></div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts.min.js" ></script>
</body>
<script type="text/javascript">
   /***************js函数入口***************/
	$(function(){
		//初始化table
		setTimeout(function(){
			tableInit();
		}, 300);
	});
   function  tableInit(){
		$('#departmentTable').bootstrapTable({
			url : '<%=request.getContextPath()%>/Manager/year.json',
			clickToSelect : true,
			singleSelect : true,
			toolbar : '#toolbar',
			toolbarAlign : '-',
			pagination : 'true',
			sidePagination : 'server',
			pageSize:50,
			queryParams : queryParams,
			pageList : [50, 100, 'All' ],
			//onClickRow : onClickRow,
			columns : [/* {
				 title : '序号',
				formatter: function (value, row, index) {  
		             return index+1;  
		         }  
			}, */  {
				title : '月份',
				field : 'item0',
				align : "center"
			},{
				title : '2010年',
				field : 'item4',
				formatter: function(value,row,index){
					return row["item4"]==null?0:(row["item4"].toFixed(2));
					         //从数据库查出来的percent值,用toFixed进行保留两位数，然后添加上%即可
					},
					align : "center"
			},{
				title : '2011年',
				field : 'item5',
				formatter: function(value,row,index){
					return row["item5"]==null?0:(row["item5"].toFixed(2));
					         //从数据库查出来的percent值,用toFixed进行保留两位数，然后添加上%即可
					},
					align : "center"
			},{
				title : '2012年',
				field : 'item6',
				formatter: function(value,row,index){
					return row["item6"]==null?0:(row["item6"].toFixed(2));
					         //从数据库查出来的percent值,用toFixed进行保留两位数，然后添加上%即可
					},
					align : "center"
			},{
				title : '2013年',
				field : 'item7',
				formatter: function(value,row,index){
					return row["item7"]==null?0:(row["item7"].toFixed(2));
					         //从数据库查出来的percent值,用toFixed进行保留两位数，然后添加上%即可
					},
					align : "center"
			},{
				title : '2014年',
				field : 'item8',
				formatter: function(value,row,index){
					return row["item8"]==null?0:(row["item8"].toFixed(2));
					         //从数据库查出来的percent值,用toFixed进行保留两位数，然后添加上%即可
					},
					align : "center"
			},{
				title : '2015年',
				field : 'item9',
				formatter: function(value,row,index){
					return row["item9"]==null?0:(row["item9"].toFixed(2));
					         //从数据库查出来的percent值,用toFixed进行保留两位数，然后添加上%即可
					},
					align : "center"
			},{
				title : '2016年',
				field : 'item10',
				formatter: function(value,row,index){
					return row["item10"]==null?0:(row["item10"].toFixed(2));
					         //从数据库查出来的percent值,用toFixed进行保留两位数，然后添加上%即可
					},
					align : "center"
			},{
				title : '2017年',
				field : 'item11',
				formatter: function(value,row,index){
					return row["item11"]==null?0:(row["item11"].toFixed(2));
					         //从数据库查出来的percent值,用toFixed进行保留两位数，然后添加上%即可
					},
					align : "center"
			},{
				title : '2018年',
				field : 'item12',
				formatter: function(value,row,index){
					return row["item12"]==null?0:(row["item12"].toFixed(2));
					         //从数据库查出来的percent值,用toFixed进行保留两位数，然后添加上%即可
					},
					align : "center"
			},{
				title : '2019年',
				field : 'item13',
				formatter: function(value,row,index){
					return row["item13"]==null?0:(row["item13"].toFixed(2));
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
			ilname : $("#reportperiod_year").val()
		};
		return pars;
	};
	/********刷新表格*******/
	function refreshProjectclueInfo(){
		$("#departmentTable").bootstrapTable("refresh",{
			url:'<%=request.getContextPath()%>/Manager/year.json',
		});
	}
	function initEchart() {
		$("#echarts-box").width($("#pan2").width() - 20);
		var tableData = $("#departmentTable").bootstrapTable('getData');
		var colors = ['#5793f3', '#d14a61', '#675bba'];
		var xdata = [];
		var ydata1 = [];//2010
		var ydata2 = [];//2011
		var ydata3 = [];
		var ydata4 = [];
		var ydata5 = [];
		var ydata6 = [];
		var ydata7 = [];
		var ydata8 = [];
		var ydata9 = [];
		var ydata10 = [];
		for (var i = 0; i < tableData.length; i++) {
			xdata.push(tableData[i].item0)
			ydata1.push(tableData[i].item4);
			ydata2.push(tableData[i].item5);
			ydata3.push(tableData[i].item6);
			ydata4.push(tableData[i].item7);
			ydata5.push(tableData[i].item8);
			ydata6.push(tableData[i].item9);
			ydata7.push(tableData[i].item10);
			ydata8.push(tableData[i].item11);
			ydata9.push(tableData[i].item12);
			ydata10.push(tableData[i].item13);
		}
		console.log(xdata);
		var option = {
			title : {
				text : '2010-2019年每月'+$("#reportperiod_year").val()+'发病率',
				y:'center',
				x:'center'
			},
			tooltip : {
				trigger : 'axis',
				axisPointer: {
	                type: 'cross'
	            },
			},
			legend : {
				type:'scroll',
				data: (function (){
		            var list = [];
		            for (var i = 0; i <=9; i++) {
		                list.push(i + 2010 + '');
		            }
		            return list;
		        })()
			},
			grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true,
		        show:true
		    },
		    axisPointer: {
	            link: {xAxisIndex: 'all'},
	            label: {
	                backgroundColor: '#777'
	            }
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
					magicType : {
						show : true,
						type : [ 'line', 'bar' ]
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			xAxis : [ {
				type : 'category',
				axisLabel : {
					interval : 0,
					formatter:'{value}月'
				},
				data : xdata
			} ],
			yAxis : [{
				type : 'value',
				scale : true,
				name:'百分比',
				position: 'left',
				axisLabel:{
					formatter:'{value}(%)'
				},
				min:0,
				max:100,
				axisLine: {
	                lineStyle: {
	                    color: colors[2]
	                }
	            },
			} ],
			series : [{
				name : '2010',
				type : 'bar',
				stack: '年份',
				data : ydata1,
			/*  markLine : {
			     data : [
			         {type : 'average', name: '平均值'}
			     ]
			 } */
			} , {
				name : '2011',
				type : 'bar',
				stack: '年份',
				data : ydata2,
			/*  markLine : {
			     data : [
			         {type : 'average', name: '平均值'}
			     ]
			 } */
			}, {
				name : '2012',
				type : 'bar',
				data : ydata3,
			/*  markLine : {
			     data : [
			         {type : 'average', name: '平均值'}
			     ]
			 } */
			}, {
				name : '2013',
				type : 'bar',
				data : ydata4,
			/*  markLine : {
			     data : [
			         {type : 'average', name: '平均值'}
			     ]
			 } */
			}, {
				name : '2014',
				type : 'bar',
				data : ydata5,
			/*  markLine : {
			     data : [
			         {type : 'average', name: '平均值'}
			     ]
			 } */
			}, {
				name : '2015',
				type : 'bar',
				data : ydata6,
			/*  markLine : {
			     data : [
			         {type : 'average', name: '平均值'}
			     ]
			 } */
			}, {
				name : '2016',
				type : 'bar',
				data : ydata7,
			/*  markLine : {
			     data : [
			         {type : 'average', name: '平均值'}
			     ]
			 } */
			}, {
				name : '2017',
				type : 'bar',
				data : ydata8,
			/*  markLine : {
			     data : [
			         {type : 'average', name: '平均值'}
			     ]
			 } */
			}, {
				name : '2018',
				type : 'bar',
				data : ydata9,
			/*  markLine : {
			     data : [
			         {type : 'average', name: '平均值'}
			     ]
			 } */
			}, {
				name : '2019',
				type : 'bar',
				data : ydata10,
			/*  markLine : {
			     data : [
			         {type : 'average', name: '平均值'}
			     ]
			 } */
			}]
		};

		var main1 = echarts.init(document.getElementById("echarts-box"));
		main1.setOption(option);
	}
</script>
</html>
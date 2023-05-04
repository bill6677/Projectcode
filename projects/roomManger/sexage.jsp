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
        <%=request.getContextPath()%>/bootstrap-table/src/extensions/export/bootstrap-table-export.js
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
      p.ex2
{
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
										style="padding-right: 0px; padding-left: 0px;">年月选择:</label>
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
									 <div class="col-md-1">
										<select id="reportperiod_month" class="form-control"
											name="reportperiod_month" style="width: 110px; float: left"
											onchange="refreshProjectclueInfo()">
											<option value="感冒">感冒</option>
											<option value="糖尿病">糖尿病</option>
											<option value="高血压">高血压</option>
										</select>
									</div> 
									<!-- <button id="excelImport_btn"
										class="btn btn-primary pull-right buttom-left">
										<i class="fa fa-file-excel-o"></i> 导出Excel
									</button> -->
								</div>
								<table id="departmentTable" class="table-hover"></table>
							</div>
							<div id="tab-7" class="tab-pane ">
								<div style="width: 100%; height: 400px" id="echarts-box">
								</div>
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
			url : '<%=request.getContextPath()%>/Manager/sexage.json',
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
				title : '年龄段',
				field : 'item3',
				align : "center",
				formatter: function(value,row,index){
					if(value==0){
						return "10";
					}else if(value==1){
						return "20";
					}else if(value==2){
						return "30";
					}else if(value==3){
						return "40";
					}else if(value==4){
						return "50";
					}else if(value==5){
						return "60";
					}else if(value==6){
						return "70";
					}else if(value==7){
						return "80";
					}else if(value==8){
						return "90";
					}else if(value == 9){
						return "100"
					}
					
					}
			},{
				title : '男性人数',
				field : 'item1',
				formatter: function(value,row,index){
					return row["item1"]==null?0:(row["item1"]);
					         //从数据库查出来的percent值,用toFixed进行保留两位数，然后添加上%即可
					},
					align : "center"
			},{
				title : '女性人数',
				field : 'item2',
				formatter: function(value,row,index){
					return row["item2"]==null?0:(row["item2"]);
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
			url:'<%=request.getContextPath()%>/Manager/sexage.json',
		});
	}
	function initEchart() {
		$("#echarts-box").width($("#pan2").width() - 20);
		var tableData = $("#departmentTable").bootstrapTable('getData');
		console.info(tableData);
		var xdata = [];
		var ydata1 = [];//男性
		var ydata2 = [];//女性
		for (var i = 0; i < tableData.length; i++) {
			xdata.push(tableData[i].item3)
			ydata1.push(tableData[i].item1);
			ydata2.push(tableData[i].item2);
		}
		console.info(xdata);
		var option = {
			title : {
				text : $("#reportperiod_year").val()+'年各年龄段患'+$("#reportperiod_month").val()+'男女人数',
				y:'bottom',
				x:'center'
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '综合(总计)','男性人数','女性人数' ]
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
					formatter:function(params){
						if(params==0){
							return "0-10岁";
						}else if(params==1){
							return "10-20岁"
						}else if(params==2){
							return "20-30岁"
						}else if(params==3){
							return "30-40岁"
						}else if(params==4){
							return "40-50岁"
						}else if(params==5){
							return "50-60岁"
						}else if(params==6){
							return "60-70岁"
						}else if(params==7){
							return "70-80岁"
						}else if(params==8){
							return "80-90岁"
						}else if(params==9){
							return "90-100岁"
						}
					
					}
				/* ,
							            	rotate:30 */
				},
				data : xdata
			} ],
			yAxis : [ {
				type : 'value',
				scale : true,
				axisLabel:{
					formatter:'{value}(人)'
				},
				min:0,
				max:200
			} ],
			series : [ {
				name : '男性人数',
				type : 'bar',
				data : ydata1,
			/*  markLine : {
			     data : [
			         {type : 'average', name: '平均值'}
			     ]
			 } */
			} , {
				name : '女性人数',
				type : 'bar',
				data : ydata2,
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="height: 100%">
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<body style="height: 100%; margin: 0;background-color:#808080" >
<div class="row">
		<!-- <label class=" col-sm-1 control-label"
			style="padding-right: 0px; padding-left: 0px;">年份选择:</label> -->
		<div class="col-md-1">
			<!-- <select id="year" class="form-control"
				name="reportperiod_year" style="float: left"
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
			</select> -->
		</div>
		<!-- <label class=" col-sm-1 control-label"
			style="padding-right: 0px; padding-left: 0px;">疾病选择:</label> -->
		<div class="col-md-1">
			<!-- <select id="reportperiod_year" class="form-control"
				name="reportperiod_year" style="width: 110px"
				onchange="refreshProjectclueInfo()">
				<option value="感冒" selected="selected" >流行感冒</option>
				<option value="高血压">高血压</option>
				<option value="糖尿病">糖尿病</option>
			</select> -->
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
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/echarts.min.js"></script>
	<script type="text/javascript">
	var year1 = [];
	//2019
	$(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/Manager/mouth.json",
				datatype : "json",
				data : {},
				success : function(map) {
					//学生数据
					var d2 = [];//2016学生
					var d3= [];//2017学生人数
					var d4 = [];//2018年学生人数
					var d5 = [];//2019年学生人数
					//2016
					for (var i = 0; i < map.stulist.length; i++) {
						d2.push(map.stulist[i].item1)
					}
					//2017
					for (var i = 0; i < map.stulistone.length; i++) {
						d3.push(map.stulistone[i].item1)
					}
					//2018
					for (var i = 0; i < map.stulisttwo.length; i++) {
						d4.push(map.stulisttwo[i].item1)
					}
					//2019
					for (var i = 0; i < map.stulistthree.length; i++) {
						d5.push(map.stulistthree[i].item1)
					}
					
					//农民的数据
					var f1 = [];//2016
					var f2 = [];//2017
					var f3 = [];//2018
					var f4 = [];//2019
					//农民2016
					for (var i = 0; i < map.farmer.length; i++) {
						f1.push(map.farmer[i].item1)
					}
					//农民2017
					for (var i = 0; i < map.farmerone.length; i++) {
						f2.push(map.farmerone[i].item1)
					}
					//2018
					for (var i = 0; i < map.farmertwo.length; i++) {
						f3.push(map.farmertwo[i].item1)
					}
					//2019
					for (var i = 0; i < map.farmethree.length; i++) {
						f4.push(map.farmethree[i].item1)
					}
					//白领数据
					var w = [];
					var w1 = [];
					var w2 = [];
					var w3 = [];
					//2016
					for (var i = 0; i < map.white.length; i++) {
						w.push(map.white[i].item1)
					}
					//2017
					for (var i = 0; i < map.whiteone.length; i++) {
						w1.push(map.whiteone[i].item1)
					}
					//2018
					for (var i = 0; i < map.whitetwo.length; i++) {
						w2.push(map.whitetwo[i].item1)
					}
					//2019
					for (var i = 0; i < map.whitethree.length; i++) {
						w3.push(map.whitethree[i].item1)
					}
					//月份
					for (var i = 0; i < map.list.length; i++) {
						year1.push(map.list[i].item0);
					}
					
					var dom = document.getElementById("container");
					var myChart = echarts.init(dom);
					var app = {};
					option = null;
					var dataMap = {};
					function dataFormatter(obj) {
					    var pList = year1;
					    var temp;
					    for (var year = 2016; year <= 2019; year++) {
					        var max = 0;
					        var sum = 0;
					        temp = obj[year];
					        for (var i = 0, l = temp.length; i < l; i++) {
					            max = Math.max(max, temp[i]);
					            sum += temp[i];
					            obj[year][i] = {
					                name : pList[i],
					                value : temp[i]
					            }
					        }
					        obj[year + 'max'] = Math.floor(max / 100) * 100;
					        obj[year + 'sum'] = sum;
					    }
					    return obj;
					}
					var si = [11,12,36,41,15,65,85,74,59,74,59]; 
					/*var sl = [10,12,13,41,15,65,85,74,59,74,59];*/
					var so = [11,12,74,41,15,65,96,74,59,74,59];
					var lp = [9,12,13,49,15,65,85,12,59,74,59];
					var lo = [11,12,13,41,15,12,85,74,59,74,59];
					var lk = [11,12,45,41,15,65,85,74,59,74,59];
					dataMap.dataGDP = dataFormatter({
					    //max : 60000,
					    2019:si,
					    2018:[12,23,12,0,0,0,0,0,0,0],
					    2017:[12,23,12,0,0,0,0,0,0,0],
					    2016:[12,23,12,0,0,0,0,0,0,0],
					    
					});
					//学生数据
					dataMap.dataPI = dataFormatter({
					    //max : 4000,
					    2019:d5,
					    2018:d4,
					    2017:d3,
					    2016:d2,
					    
					});

					dataMap.dataSI = dataFormatter({
					    //max : 26600,
					    2019:f4,
					    2018:f3,
					    2017:f2,
					    2016:f1
					    
					});

					dataMap.dataTI = dataFormatter({
					    //max : 25000,
					    2019:w3,
					    2018:w2,
					    2017:w1,
					    2016:w
					    
					});

					dataMap.dataEstate = dataFormatter({
					    //max : 3600,
					    2019:lo,
					    2018:[12,23,12,0,0,0,0,0,0,0],
					    2017:[12,23,12,0,12,0,58,0,0,0],
					    2016:[11,23,12,0,0,0,0,0,0,0],
					    
					});

					dataMap.dataFinancial = dataFormatter({
					    //max : 3200,
					    2019:lk,
					    2018:[12,23,12,0,12,0,0,0,0,0],
					    2017:[12,23,12,0,0,0,32,0,0,0],
					    2016:[10,23,12,0,0,0,0,0,0,0],
					}); 


					option = {
					    baseOption: {
					        timeline: {
					            // y: 0,
					            axisType: 'category',
					            // realtime: false,
					            // loop: false,
					            autoPlay: true,
					            // currentIndex: 2,
					            playInterval: 2000,
					            // controlStyle: {
					            //     position: 'left'
					            // },
					            data:  [
					                '2016-01-01','2017-01-01','2018-01-01','2019-01-01'
					                /* {
					                    value: '2005-01-01',
					                    tooltip: {
					                        formatter: '{b} GDP达到一个高度'
					                    },
					                    symbol: 'diamond',
					                    symbolSize: 16
					                },
					                '2006-01-01', '2007-01-01','2008-01-01','2009-01-01','2010-01-01',
					                {
					                    value: '2011-01-01',
					                    tooltip: {
					                        formatter: function (params) {
					                            return params.name + 'GDP达到又一个高度';
					                        }
					                    },
					                    symbol: 'diamond',
					                    symbolSize: 18
					                }, */
					            ],
					            label: {
					                formatter : function(s) {
					                    return (new Date(s)).getFullYear();
					                }
					            }
					        },
					        title: {
					            subtext: '数据来自本系统测试数据'
					        },
					        tooltip: {
					        },
					        legend: {
					            x: 'right',
					            data: ['学生', '农民', '白领'],
					        },
					        calculable : true,
					        grid: {
					            top: 80,
					            bottom: 100,
					            tooltip: {
					                trigger: 'axis',
					                axisPointer: {
					                    type: 'shadow',
					                    label: {
					                        show: true,
					                        formatter: function (params) {
					                            return params.value.replace('\n', '');
					                        }
					                    }
					                }
					            }
					        },
					        xAxis: [
					            {
					                'type':'category',
					                'axisLabel':{'interval':0},
					                data:year1,
					                axisLabel : {
										interval : 0,
										formatter:'{value}月'
									/* ,
												            	rotate:30 */
									},
					            }
					        ],
					        yAxis: [
					            {
					                type: 'value',
					                name: '病例（个）',
					                min:0,
					                max:30,
					                axisLabel : {
										interval : 0,
										formatter:'{value}人'
									/* ,
												            	rotate:30 */
									},
					            }
					        ],
					        series: [
					            {name: '学生', type: 'bar'},
					            {name: '农民', type: 'bar'},
					            {name: '白领', type: 'bar'},
					            {
					                name: '人数占比',
					                type: 'pie',
					                center: ['75%', '35%'],
					                radius: '28%',
					                z: 100
					            } 
					        ]
					    },
					    options: [
					        {
					            title : {text: '2016患感冒人群病例人数'},
					            series : [
					                {data: dataMap.dataPI['2016']},
					                {data: dataMap.dataSI['2016']},
					                {data: dataMap.dataTI['2016']},
					                {data: [
					                    {name: '学生', value: dataMap.dataPI['2016sum']},
					                    {name: '农民', value: dataMap.dataSI['2016sum']},
					                    {name: '白领', value: dataMap.dataTI['2016sum']}
					                ]} 
					            ]
					        },
					        {
					            title : {text: '2017患感冒人群病例人数'},
					            series : [
					                {data: dataMap.dataPI['2017']},
					                {data: dataMap.dataSI['2017']},
					                {data: dataMap.dataTI['2017']},
					                {data: [
					                    {name: '学生', value: dataMap.dataPI['2017sum']},
					                    {name: '农民', value: dataMap.dataSI['2017sum']},
					                    {name: '白领', value: dataMap.dataTI['2017sum']}
					                ]} 
					            ]
					        },
					        {
					            title : {text: '2018患感冒人群病例人数'},
					            series : [
					                {data: dataMap.dataPI['2018']},
					                {data: dataMap.dataSI['2018']},
					                {data: dataMap.dataTI['2018']} ,
					                {data: [
					                    {name: '学生', value: dataMap.dataPI['2018sum']},
					                    {name: '农民', value: dataMap.dataSI['2018sum']},
					                    {name: '白领', value: dataMap.dataTI['2018sum']}
					                ]} 
					            ]
					        },
					        {
					            title : {text: '2019患感冒人群病例人数'},
					            series : [
					                {data: dataMap.dataPI['2019']},
					                {data: dataMap.dataSI['2019']},
					                {data: dataMap.dataTI['2019']} ,
					                {data: [
					                    {name: '学生', value: dataMap.dataPI['2019sum']},
					                    {name: '农民', value: dataMap.dataSI['2019sum']},
					                    {name: '白领', value: dataMap.dataTI['2019sum']}
					                ]} 
					            ]
					        }
					    ]
					};;
					if (option && typeof option === "object") {
					    myChart.setOption(option, true);
					}
				}
			});
		})
	</script>
</body>
</html>
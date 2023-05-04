<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=EDGE">
<title>地图分布</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/echarts.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/china.js"></script>
<style>
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
#china-map {
	width: 1000px;
	height: 1000px;
	margin: auto;
}
font{

background:yellow;

font-size:68px;

color:white;

}
p.ex2
{
	font:15px arial,sans-serif; 
}
</style>
</head>
<body style="background-color: #808080">
	<div id="china-map"></div>
	<div class="conrainer">
		<!-- <div class="row">
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
	</div> -->
	<script>
	function randomData() {  
	     return Math.round(Math.random()*2000);  
	}
	var mydata = [
			{
				name : '北京',
				value : randomData(),
			}, {
				name : '天津',
				value : randomData()
			}, {
				name : '上海',
				value : randomData()
			}, {
				name : '重庆',
				value : randomData()
			}, {
				name : '河北',
				value : randomData()
			}, {
				name : '河南',
				value : randomData()
			}, {
				name : '云南',
				value : randomData()
			}, {
				name : '辽宁',
				value : randomData()
			}, {
				name : '黑龙江',
				value : randomData()
			}, {
				name : '湖南',
				value : randomData()
			}, {
				name : '安徽',
				value : randomData()
			}, {
				name : '山东',
				value : randomData()
			}, {
				name : '新疆',
				value : randomData()
			}, {
				name : '江苏',
				value : randomData()
			}, {
				name : '浙江',
				value : randomData()
			}, {
				name : '江西',
				value : randomData()
			}, {
				name : '湖北',
				value : randomData()
			}, {
				name : '广西',
				value : randomData()
			}, {
				name : '甘肃',
				value : randomData()
			}, {
				name : '山西',
				value : randomData()
			}, {
				name : '内蒙古',
				value : randomData()
			}, {
				name : '陕西',
				value : randomData()
			}, {
				name : '吉林',
				value : randomData()
			}, {
				name : '福建',
				value : randomData()
			}, {
				name : '贵州',
				value : randomData()
			}, {
				name : '广东',
				value : randomData()
			}, {
				name : '青海',
				value : randomData()
			}, {
				name : '西藏',
				value : randomData()
			}, {
				name : '四川',
				value : randomData()
			}, {
				name : '宁夏',
				value : randomData()
			}, {
				name : '海南',
				value : randomData()
			}, {
				name : '台湾',
				value : randomData()
			}, {
				name : '香港',
				value : randomData()
			}, {
				name : '澳门',
				value : randomData()
			} 
	]
		var myChart = echarts.init(document.getElementById('china-map'));
		option = {
				title : {
					text : '疾病全国分布图',
					x : 'center'
				},
				tooltip : { //提示框组件。
					trigger : 'item' //数据项图形触发，主要在散点图，饼图等无类目轴的图表中使用。
				},
				  /* legend : {
					orient : 'horizontal', //图例的排列方向
					x : 'left', //图例的位置
					data : [ '患病人数' ]
				}, */ 
				/* backgroundColor: '#404a59', */
				dataRange : { //颜色的设置  dataRange
					x : 'left',
					y : 'center',
					splitList : [ {
						start : 1500,
					}, {
						start : 900,
						end : 1500,

					}, {
						start : 310,
						end : 1000,

					}, {
						start : 200,
						end : 300,

					}, {
						start : 10,
						end : 200,

					}, {
						start : 5,
						end : 5,

					}, {
						end : 10
					} ],
					min : 0,
					max : 2500,
					calculable : true,//颜色呈条状
					text : [ '高发地区', '低发地区' ], // 文本，默认为数值文本
					color : [ '#CD5B45', '#CD661D', '#CD7054', '#CD8C95',
							'#CD9B1D', '#CDAF95' ,'#CDB7B5']
				},
				toolbox : { //工具栏
					show : true,
					orient : 'vertical', //工具栏 icon 的布局朝向
					x : 'right',
					y : 'center',
					feature : { //各工具配置项。
						mark : {
							show : true
						},
						dataView : {
							show : true,
							readOnly : true
						}, //数据视图工具，可以展现当前图表所用的数据，编辑后可以动态更新。
						restore : {
							show : true
						}, //配置项还原。
						saveAsImage : {
							show : true
						}
					//保存为图片。
					}
				},
				roamController : { //控制地图的上下左右放大缩小 图上没有显示
					show : true,
					x : 'right',
					mapTypeControl : {
						'china' : true
					}
				},
				series : [ {
					name : '患病人数',
					type : 'map',
					mapType : 'china',
					selectedMode: 'single',
                    roam: false,
                    showLegendSymbol:true,
					//roam : true, //是否开启鼠标缩放和平移漫游
					itemStyle : { //是图形在默认状态下的样式
						normal : {
							show : true
						//是否显示标签
						},
						label : {
							show : true,
						},
						emphasis : { //是图形在高亮状态下的样式,比如在鼠标悬浮或者图例联动高亮时
							show : true
						},
						formatter:'{pe|{b}}\n\n{per|{c}}',
						rich:{
		                       pe:{
		                         color:'#fff'  
		                       },
		                        per:{
		                                 color: '#fff',
		                            backgroundColor: '#7D7D7D',
		                            padding: [6, 4],
		                             borderRadius: 4,
		                         
		                        }
		                                               
		                    }
					},
					label:{
						normal:{
							show:true
						},
						emphasis:{
							show:true
						}
					},
					top : "3%", //组件距离容器的距离
					data :mydata
				} ]
			};
			myChart.setOption(option);
			myChart.on('mouseover', function(params) {
				var dataIndex = params.dataIndex;
			});
	</script>
	
</body>
</html>
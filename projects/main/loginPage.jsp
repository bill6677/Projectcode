<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>

<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0"> 
	<title>log</title>
    <link href="<%=request.getContextPath() %>/css/loginPageCss/default.css" rel="stylesheet" type="text/css" />
	<!--必要样式-->
    <link href="<%=request.getContextPath() %>/css/loginPageCss/styles.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath() %>/css/loginPageCss/demo.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath() %>/css/loginPageCss/loaders.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath() %>/base/plugins/layui/css/layui.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	select{
                font-family: "微软雅黑";
                background: rgba(0,0,0,0);
                margin-bottom:10px;
                width: 249px;
                height: 40px;
                font-size: 14px;
                color: white;
                text-align: center;
                border: 1px #1a1a1a solid;
                border-radius: 5px;
            }
            option{
                color: black;
                background: #d0e9c6;
                line-height: 20px;
            }
            select:focus{
                border: 2px #ddd solid;
                box-shadow: 0 0 15px 1px #DDDDDD;
            }
            option:hover{
                background: #EBCCD1;
            }
	</style>
</head>
<body style="background-image: url(<%=request.getContextPath() %>/base/loginPageImg/12.png)">style="background-image: url(<%=request.getContextPath() %>/base/loginPageImg/12.png)"
	<div class='login'>
	  <div class='login_title'>
	    <span>login</span>
	  </div>
	  <div class='login_fields'>
	    <div class='login_fields__user'>
	      <div class='icon'>
	        <img alt="" src='<%=request.getContextPath() %>/base/loginPageImg/user_icon_copy.png'>
	      </div>
	      <input name="username" placeholder='PID' maxlength="18" type='text' autocomplete="off"/>
	        <div class='validation'>
	          <img alt="" src='<%=request.getContextPath() %>/base/loginPageImg/tick.png'>
	        </div>
	    </div>
	    <div class='login_fields__password'>
	      <div class='icon'>
	        <img alt="" src='<%=request.getContextPath() %>/base/loginPageImg/lock_icon_copy.png'>
	      </div>
	      <input name="pwd" placeholder='password' maxlength="18" type='text' autocomplete="off">
	      <div class='validation'>
	        <img alt="" src='<%=request.getContextPath() %>/base/loginPageImg/tick.png'>
	      </div>
	    </div>
	    <div class='login_fields__password'>
	      <div class='icon'>
	        <img alt="" src='<%=request.getContextPath() %>/base/loginPageImg/key.png'>
	      </div>
	      <input name="code" placeholder='verification code' maxlength="4" type='text' autocomplete="off">
	      <div class='validation' style="opacity: 1; right: -5px;top: -3px;">
          <canvas class="J_codeimg" id="myCanvas" onclick="Code();">Sorry, your browser does not support canvas, please download the latest version of the browser!</canvas>
	      </div>
	    </div>
	    <div class='login_fields__submit'>
	    	<div>
				<select id="txt_major" style="width: 103px">
					<option selected="selected" value="">select role</option>
					<option value="1">manager</option>
					<option value="2">doctor</option>
					<!-- <option value="3">department</option>
					<option value="4">user</option>  -->
				</select>
				<a href="<%=request.getContextPath() %>/log/regiest.html"><span>register</span></a>
			</div>
		</div>
		<div class='login_fields__submit'>
	      <input type='button' value='login'>
	    </div>
	  </div>
	  <div class='success'>
	  </div>
	</div>
	<div class='authent'>
	  <div class="loader" style="height: 44px;width: 44px;margin-left: 28px;">
        <div class="loader-inner ball-clip-rotate-multiple">
            <div></div>
            <div></div>
            <div></div>
        </div>
        </div>
	  <p>login ...</p>
	</div>
	<div class="OverWindows"></div>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/loginPageJs/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/loginPageJs/jquery-ui.min.js"></script>
	<script type="text/javascript" src='<%=request.getContextPath() %>/js/loginPageJs/stopExecutionOnTimeout.js?t=1'></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/base/plugins/layui/layui.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/loginPageJs/Particleground.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/loginPageJs/Treatment.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/loginPageJs/jquery.mockjax.js"></script>
	<script type="text/javascript">
		var canGetCookie = 0;//是否支持存储Cookie 0 不支持 1 支持
		var ajaxmockjax = 1;//是否启用虚拟Ajax的请求响 0 不启用  1 启用
		//默认账号密码
		
		var truelogin = "admin1";
		var truepwd = "123";
		
		var CodeVal = 0;
		var res;
	    Code();
	    function Code() {
			if(canGetCookie == 1){
				createCode("AdminCode");
				var AdminCode = getCookieValue("AdminCode");
				showCheck(AdminCode);
			}else{
				showCheck(createCode(""));
			}
	    }
	    function showCheck(a) {
			CodeVal = a;
	        var c = document.getElementById("myCanvas");
	        var ctx = c.getContext("2d");
	        ctx.clearRect(0, 0, 1000, 1000);
	        ctx.font = "80px 'Hiragino Sans GB'";
	        ctx.fillStyle = "#E8DFE8";
	        ctx.fillText(a, 0, 100);
	    }
	    $(document).keypress(function (e) {
	        // 回车键事件  
	        if (e.which == 13) {
	            $('input[type="button"]').click();
	        }
	    });
	    //粒子背景特效
	    $('body').particleground({
	        dotColor: '#E8DFE8',
	        lineColor: '#133b88'
	    });
	    $('input[name="pwd"]').focus(function () {
	        $(this).attr('type', 'password');
	    });
	    $('input[type="text"]').focus(function () {
	        $(this).prev().animate({ 'opacity': '1' }, 200);
	    });
	    $('input[type="text"],input[type="password"]').blur(function () {
	        $(this).prev().animate({ 'opacity': '.5' }, 200);
	    });
	    $('input[name="username"],input[name="pwd"]').keyup(function () {
	        var Len = $(this).val().length;
	        if (!$(this).val() == '' && Len >= 5) {
	            $(this).next().animate({
	                'opacity': '1',
	                'right': '30'
	            }, 200);
	        } else {
	            $(this).next().animate({
	                'opacity': '0',
	                'right': '20'
	            }, 200);
	        }
	    });
	    var open = 0;
	    layui.use('layer', function () {
			var msgalert = 'defualt account:' + truelogin + '<br/> defualt password:' + truepwd;
    		/*var index = layer.alert(msgalert, { icon: 6, time: 4000, offset: 't', closeBtn: 0, title: '友情提示', btn: [], anim: 2, shade: 0 });
			layer.style(index, {
				color: '#777'
			}); */
	        //非空验证
	        $('input[type="button"]').click(function () {
	            var username = $('input[name="username"]').val();
	            var pwd = $('input[name="pwd"]').val();
	            var code = $('input[name="code"]').val();
	            var pro = $("#txt_major").val();
	            if (username == '') {
	                ErroAlert('Please enter your account number');
	            } else if (pwd == '') {
	                ErroAlert('enter PIN');
	            } else if (code == '' || code.length != 4) {
	                ErroAlert('enter verification code');
	            } else if(pro ==''){
	            	ErroAlert('select role');
	            } else {
	                //认证中..
	                //fullscreen();
	                $('.login').addClass('test'); //倾斜特效
	                setTimeout(function () {
	                    $('.login').addClass('testtwo'); //平移特效
	                }, 300);
	                setTimeout(function () {
	                    $('.authent').show().animate({ right: -320 }, {
	                        easing: 'easeOutQuint',
	                        duration: 600,
	                        queue: false
	                    });
	                    $('.authent').animate({ opacity: 1 }, {
	                        duration: 200,
	                        queue: false
	                    }).addClass('visible');
	                }, 500);

	                //登录
	                var JsonData = { "username": username, "password": pwd, code: code,"role":$("#txt_major").val() };
					//此处做为ajax内部判断
					var url = "";
                    if(JsonData.code.toUpperCase() == CodeVal.toUpperCase()){
                        userSub(JsonData);
                        if(res.result == "success"){
                            url = "Ajax/Login";
                        }else if(res.result == "fail"){
                            url = "Ajax/LoginFalse";
                        }
                    }else{
                        ErroAlert('wrong verification！');
                    }

                    //ajax加载中
	               AjaxPost(url, JsonData, function () {},function (data) {
						//ajax返回
						//认证完成
						setTimeout(function () {
							$('.authent').show().animate({ right: 90 }, {
								easing: 'easeOutQuint',
								duration: 600,
								queue: false
							});
							$('.authent').animate({ opacity: 0 }, {
								duration: 200,
								queue: false
							}).addClass('visible');
							$('.login').removeClass('testtwo'); //平移特效
						}, 2000);
						setTimeout(function () {
							$('.authent').hide();
							$('.login').removeClass('test');
                            if(res.result == "success"){
                                //登录成功
                                $('.login div').fadeOut(100);
                                $('.success').fadeIn(1000);
                                $('.success').html(data.Text);
                                //跳转操作
                                //window.location.href = 'loginController/homepage.html';
                                if($("#txt_major").val() == "4"){
            						window.location.href="<%=request.getContextPath()%>/log/login3.html"
            					}else if($("#txt_major").val() == '3'){
            						window.location.href="<%=request.getContextPath()%>/log/login1.html"
            					}else if($("#txt_major").val() == "2"){
            						var username1 = $('input[name="username"]').val();
    	            				var pwd1 = $('input[name="pwd"]').val();
            						window.location.href="<%=request.getContextPath()%>/log/login2.html?DoctorId="+username1+"&pwd="+pwd1+""
            					}else{
            						window.location.href="<%=request.getContextPath()%>/log/login.html"
            					}
                            }else if(res.result == "fail"){
                            	ErroAlert('not found account');
                            }
						}, 2400);
					})
	            }
	        })
	    })

		// 用户验证
        function userSub(data) {
	        console.info(data)
            $.ajax({
                url : '<%=request.getContextPath()%>/log/logindo.json',
                data : data,
                dataType : 'json',
                type : 'post',
				async:false,
                success : function(result) {
                    res = result;
                }
            });
        }

		// 全屏展示
	    var fullscreen = function () {
	        elem = document.body;
	        if (elem.webkitRequestFullScreen) {
	            elem.webkitRequestFullScreen();
	        } else if (elem.mozRequestFullScreen) {
	            elem.mozRequestFullScreen();
	        } else if (elem.requestFullScreen) {
	            elem.requestFullscreen();
	        } else {
	            //浏览器不支持全屏API或已被禁用  
	        }
	    }  
		if(ajaxmockjax == 1){
			$.mockjax({  
				url: 'Ajax/Login',  
				status: 200,  
				responseTime: 50,          
				responseText: {"Status":"ok","Text":"longin success<br /><br />welcome"}  
			}); 
			$.mockjax({  
				url: 'Ajax/LoginFalse',  
				status: 200,  
				responseTime: 50,          
				responseText: {"Status":"Erro","Erro":"wrong "}
			});   
		}
    </script>

</body>
</html>

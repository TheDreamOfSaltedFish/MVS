<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	//不能直接通过链接访问
	if (null == session.getAttribute("user")) {
		response.sendRedirect(path+"/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>car</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link rel="stylesheet" tye="text/css" href="css/sadmin.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.min.css">
<script src='scripts/jquery.js'></script>
<script src='scripts/bootstrap.min.js'></script>
<script type="text/javascript" language="javascript">
$.ajaxSetup ({ 
    cache: false //关闭AJAX相应的缓存 
}); 
</script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-header">
			<a style="float:left;"class="navbar-brand" href="#"><b>超级管理员后台</b></a> <a id="j_nav_toggle"
			href="javascript:;"> <img alt="菜单栏搜索" src="images/caidan.png"
			style="float:left;width:40px;height:50px;">
		</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="javascript:;" id="a_person_info">设置</a></li>
				<li><a href="#">Help</a></li>
				<li class="dropdown dropdown-toggle "><a href="#"
					class="dropdown-toggle" id="dropdownMenu_user"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						咸鱼的梦想<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu_user">
						<li><a >个人信息</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">退出</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>


	<div id="left-menu">
		<div class="list-group">
			<button type="button"
				class="list-group-item btn-menu btn_text create-admin">
				<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
				创建角色
			</button>
			<button type="button" style="display:none;"
				class="list-group-item btn-menu btn_icon create-admin">
				<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
			</button>
			<button type="button"
				class="list-group-item  btn-menu btn_text create-user">
				<span class="glyphicon glyphicon-magnet" aria-hidden="true"></span>
				创建用户
			</button>
			<button type="button" style="display:none;"
				class="list-group-item  btn-menu btn_icon create-user">
				<span class="glyphicon glyphicon-magnet" aria-hidden="true"></span>
			</button>
			<button type="button"
				class="list-group-item  btn-menu btn_text manage-admin">
				<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
				管理角色
			</button>
			<button id="manage-admin" type="button" style="display:none;"
				class="list-group-item  btn-menu btn_icon manage-admin">
				<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
			</button>
			<button type="button"
				class="list-group-item  btn-menu btn_text manage-user">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				管理用户
			</button>
			<button type="button" style="display:none;"
				class="list-group-item  btn-menu btn_icon manage-user">
				<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
			</button>
			<button type="button"
				class="list-group-item  btn-menu btn_text data-export">
				<span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>
				数据备份
			</button>
			<button type="button" style="display:none;"
				class="list-group-item  btn-menu btn_icon data-export">
				<span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>
			</button>
		</div>
		<div class="panel panel-default">
			<div class="panel-body">一些注释讲解之类的，这下面太空了</div>
		</div>
	</div>
	<div id="main">
		<div id="content">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h2 class="panel-title">欢迎您</h2>
				</div>
				<div class="panel-body">
					您上次登录的时间是：${lastLoginTime}
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			var cnt = -1;//表示页面的编号
			$(".create-admin").click(function(){
				cnt = 0;
				$("#content").load("jsp_admin/create_admin.jsp");
			});
			
			$(".create-user").click(function(){
				cnt=1;
				$("#content").load("<%=request.getContextPath()%>/servlet/CreateUserServlet");
			});
			
			$(".manage-admin").click(function(){
				cnt=2;
				$("#content").load("<%=path%>/servlet/ManageAdminServlet");
			});
			
			$(".manage-user").click(function(){
				cnt=3;
				$("#content").load("<%=basePath%>/servlet/ManageUserServlet?random" + Math.random());
			});
			
			$(".data-export").click(function(){
				cnt=4;
				$("#content").load("<%=path%>/servlet/BackupDataServlet");
			});
			
			/*点击个人信息*/
		$("#a_person_info").click(function(){
			$("#content").load("<%=path%>/person_info.jsp");
		});

			var turn = true;
			$("#j_nav_toggle")
					.click(
							function() {
								if (turn) {
									$("#left-menu").css("width", "60px");
									$("#content").css("marginLeft", "70px");
									//
									$(".btn_text").hide();
									$(".btn_icon").show();
									turn = false;

									$(".btn_icon")
											.each(
													function(index) {
														if (index == cnt) {
															$(this)
																	.css(
																			"cssText",
																			"background-color:#232a32!important");
														} else {
															$(this)
																	.css(
																			"cssText",
																			"background-color:#2c343f!important");
														}
													});
								} else {
									$("#left-menu").css("width", "15%");
									$("#content").css("marginLeft", "16%");
									$(".btn_text").show();
									$(".btn_icon").hide();
									turn = true;
									$(".btn_text")
											.each(
													function(index) {
														if (index == cnt) {
															$(this)
																	.css(
																			"cssText",
																			"background-color:#232a32!important");
														} else {
															$(this)
																	.css(
																			"cssText",
																			"background-color:#2c343f!important");
														}
													});
								}
							});

			$(".btn_text")
					.click(
							function() {
								$(".btn_text")
										.each(
												function() {
													$(this)
															.css("cssText",
																	"background-color:#2c343f!important");
												});
								$(this).css("cssText",
										"background-color:#232a32!important");
							});
			$(".btn_icon")
					.click(
							function() {
								$(".btn_icon")
										.each(
												function() {
													$(this)
															.css("cssText",
																	"background-color:#2c343f!important");
												});
								$(this).css("cssText",
										"background-color:#232a32!important");
							});
		});
	</script>
</body>
</html>

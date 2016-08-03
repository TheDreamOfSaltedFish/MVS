<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>j-frame</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/j-css/j-theme.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap/bootstrap.min.css">
<script src='scripts/jquery.js'></script>
<script src='scripts/bootstrap.min.js'></script>
<script type="text/javascript" src="scripts/j-scripts/j-theme.js"></script>
<script type="text/javascript" src="js/jquery-form.js"></script>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-header">
		<a class="navbar-brand" href="#">超级管理员后台</a>
		<button id="j_nav_toggle" type="button" class="btn btn-default"
			aria-label="Left Align"
			style="margin-top:13px;color:#fff;background-color:#101010;border:0;">
			<span class="glyphicon glyphicon-align-left" aria-hidden="true"></span>
		</button>
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
					<li><a href="#">个人信息</a></li>
					<li role="separator" class="divider"></li>
					<li><a href="#">退出</a></li>
				</ul></li>
		</ul>
	</div>
	</nav>
	<div id="j-main">
		<div id="j-left-menu">
			<div class="list-group">
				<c:if test="${admin1!=null||admin2!=null}">
				<button type="button"
					class="list-group-item btn-menu btn_text">
					<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
					人员管理 <span style="float:right;"
						class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
				</button>
				<div class="list-group j-child-menu" style="display:none;">
					<c:if test="${admin2!=null}">
					<button type="button" class="list-group-item " id="manange_staff">数据维护</button>
					</c:if>
					<c:if test="${admin1!=null}">
					<button type="button" class="list-group-item" id="synch_staff">数据同步</button>
					</c:if>
				</div>
				<button type="button" style="display:none;"
					class="list-group-item btn-menu btn_icon">
					<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
				</button>
				</c:if>
				<c:if test="${admin3!=null}">
				<button type="button" class="list-group-item  btn-menu btn_text" onclick="window.location.href='<%=path%>/servlet/ManageLineServlet?type=1'">
					<span class="glyphicon glyphicon-magnet" aria-hidden="true"></span>
					线路管理
				</button>
				<button type="button" style="display:none;"
					class="list-group-item  btn-menu btn_icon">
					<span class="glyphicon glyphicon-magnet" aria-hidden="true"></span>
				</button>
				</c:if>
				<c:if test="${admin7!=null}">
				<button type="button" class="list-group-item  btn-menu btn_text" id="map_site" >
					<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
					站点管理<span style="float:right;"
						class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
				</button>
				<div class="list-group j-child-menu" style="display:none;">
					<c:if test="${admin2!=null}">
					<button type="button" class="list-group-item " id="map_site" onclick="window.location.href='servlet/MapSiteServlet'">站点维护</button>
					</c:if>
					<c:if test="${admin1!=null}">
					<button type="button" class="list-group-item" id="show_site">数据统计</button>
					</c:if>
				</div>
				<button id="manage-admin" type="button" style="display:none;"
					class="list-group-item  btn-menu btn_icon">
					<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
				</button>
				</c:if>

				<c:if test="${admin9!=null}">
				<button type="button"
					class="list-group-item btn-menu btn_text">
					<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
					车辆管理 <span style="float:right;"
						class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
					</button>
					<div class="list-group j-child-menu" style="display:none;">
					<c:if test="${admin10!=null}">
						<button type="button" class="list-group-item" id="cre_car">
							新建车辆数据
							</button>
							</c:if>
							<button type="button" class="list-group-item" id="man_car">
								数据维护与查询
								</button>
					</div>
					<button type="button" style="display:none;"
						class="list-group-item btn-menu btn_icon">
						<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
						</button>
					</c:if>
					<c:if test="${admin5!=null}">
						<button type="button" class="list-group-item  btn-menu btn_text">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							班次管理 <span style="float:right;"
								class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
						</button>
						<div class="list-group j-child-menu" style="display:none;">
							<c:if test="${admin6!=null}">
							<button type="button" class="list-group-item add-arrange">新增班次</button>
							</c:if>
							<button type="button" class="list-group-item manage-arrange">数据维护</button>
						</div>
						<button type="button" style="display:none;"
							class="list-group-item  btn-menu btn_icon">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						</button>
						</c:if>
			</div>
			<div class="panel panel-default j-no-radous">
				<div class="panel-body">一些注释讲解之类的，这下面太空了</div>
			</div>
		</div>
		<div id="content">
			<h1>欢迎您登录咸鱼的梦想厂车管理后台</h1>
		</div>
	</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="w-modal" tabindex="-1" role="dialog" 
   aria-labelledby="w-modal-label" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" id="w-modal-close2"
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="w-modal-label">
              <p id= "w-modal-p1"></p>
            </h4>
         </div>
         <div class="modal-body">
           <div id = "w-modal-div"></div>
           <p id="w-modal-p2"></p>
            <p id="w-modal-p3"></p>
         </div>
         <div class="modal-footer">
         	<div>
		<form action="servlet/ShowSiteServlet?type=2" method="post" >
			<button type="submit" id="w-modal-export"  class="btn btn-primary" style="display:none">导出报表</button>
			
		</form>
            <button type="button" id="w-modal-close"  class="btn btn-default" 
               data-dismiss="modal" >关闭
            </button>
            <button type="button" class="btn btn-primary" id="w-modal-but" onclick="javascript:update()">
               提交更改
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
	<!-- jimo -->
	<div id="load_modal" class="modal fade" id="myModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<b>正在加载，请稍后...</b>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		//异步加载代码
		
		$(".manage-arrange").click(function(){
			$("#load_modal").modal('show');//显示加载框
			$("#content").load("<%=path%>/servlet/ManageArrangeServlet");
		});
		
		$(".add-arrange").click(function(){
			$("#load_modal").modal('show');//显示加载框
			$("#content").load("<%=path%>/servlet/CreateArrServlet?multi=yes");
		});
		
		$("#cre_car").click(function() {
			$("#content").load("<%=request.getContextPath()%>/jsp_user/create_car.jsp");
		});
		
		$("#man_car").click(function() {
			$("#load_modal").modal('show');//显示加载框
			$("#content").load("<%=request.getContextPath()%>/servlet/ManageCarServlet?type=1&page_index=1&condition=0&sea_condition=0");
		});

		$("#manange_staff").click(function(){
				$("#content").load("<%=basePath%>servlet/ManageStaffServlet");
			});
		$("#synch_staff").click(function(){
				$("#content").load("<%=basePath%>servlet/ManageSynchServlet");
		});
		
		/*点击个人信息*/
		$("#a_person_info").click(function(){
			$("#content").load("<%=path%>/person_info.jsp");
		});
		
		$("#show_site").click(function(){
				$("#content").load("<%=basePath%>jsp_user/show_site.jsp");
		});
		
	</script>
</body>
</html>

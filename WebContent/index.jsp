<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/jquery/jquery-1.7.1.min.js"></script>
<script src="/jquery/jquery-ui-1.8.10.custom.min.js"></script>

<link href="/bootstrap/css/bootstrap.min.css" type="text/css"
	rel="stylesheet" />
<link href="/bootstrap/css/sticky-footer.css" type="text/css"
	rel="stylesheet" />
<link
	href="/bootstrap/Datepicker/css/bootstrap-datetimepicker.min.css"
	type="text/css" rel="stylesheet" />
<script
	src="/bootstrap/Datepicker/js/bootstrap-datetimepicker.min.js"
	charset="UTF-8"></script>
<script
	src="/bootstrap/Datepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
	charset="UTF-8"></script>
<link href="/css/sample_list.css" type="text/css"
	rel="stylesheet" />
<title>报告列表页面</title>
<script type="text/javascript">

$(document).ready(
		function() {
			$("#header").load("/html/header.jsp");
	    	$("#footer").load("/html/footer.jsp");
            //initTable("{}");
			//初始化页数
			var d = new Date();
			$(".form_date").datetimepicker({
				initialDate : d,
				language : 'zh-CN',
				format : 'yyyy-mm-dd',
				todayHighlight : 1,
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				startView : 2,
				minView : 2
			});
		});
</script>
</head>
<body style="padding: 80px">
	<div id="header"></div>
	<div id="content" style="margin-top: 50px;">工具说明：<br>
	<ul>
		<li>目前对chrome支持良好，对其他浏览器的支持正在努力实现中</li>
		<li>目前支持文件类型过滤：为简化系统和统一归档格式，过滤非PDF格式的文档</li>
		<li>支持在线预览</li>
		<li>支持下载</li>
		<li>删除功能目前屏蔽</li>
	</ul></div>
	<div id="footer"></div>
</body>
</html>
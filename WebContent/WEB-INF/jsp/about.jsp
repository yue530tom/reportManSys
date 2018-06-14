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
<title>说明页面</title>
<script type="text/javascript">
	$(document).ready(function() {
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
	<div id="content" style="margin-top: 20px;">
		目的：<br>
		<ul>
			<li>方便测试人员将测试报告归档</li>
			<li>方便非项目组成员查阅</li>
			<li>在线查阅，提高机动性，免除在本地归档丢失或找不见的情况</li>
		</ul>
	</div>
	<div id="content" style="margin-top: 20px;">
		功能：<br>
		<ul>
			<li>目前对chrome支持良好，对其他浏览器的支持正在努力实现中</li>
			<li>目前支持文件类型过滤：为简化系统和统一归档格式，过滤非PDF格式的文档</li>
			<li>支持在线预览</li>
			<li>支持下载</li>
			<li>支持查阅最近文档上传情况</li>
			<li>删除功能目前屏蔽（已经实现）</li>
			<li>上传操作需要登录（权限控制并未全部完成）</li>
		</ul>
		后续:<br>
		<ul>
			<li>加入文档分类功能</li>
			<li>直接将文档以邮件附件的形式发送</li>
		</ul>
	</div>
		<div id="content" style="margin-top: 20px;">
		操作说明：<br>
		<ul>
			<li>首页：显示公告</li>
			<li>最新报告：显示最近新上传的10份报告</li>
			<li>上传报告：将本地报告上传到服务器。注意：没有做前端上传进度条，浏览器状态栏有显示，在上传报告时请勿重复上传；上传完毕，会有提示【xxx】上传成功 或 【xxx】不是pdf 或 【xxx】已经存在</li>
			<li>报告列表：显示符合条件的报告，支持按名称，作者，类型和时间查询，选择条件后点击界面【筛选】即可</li>
		</ul>
	</div>
			<div id="content" style="margin-top: 20px;">
		问题和意见反馈：<br>
		<ul>
			<li><a href="yueling@dangdang.com">yueling@dangdang.com</a></li>
		</ul>
	</div>
	<div id="footer"></div>
</body>
</html>
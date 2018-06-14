<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="/jquery/jquery-1.7.1.min.js"></script>
<script
	src="/jquery/jquery-ui-1.8.10.custom.min.js"></script>

<link
	href="/bootstrap/css/bootstrap.min.css"
	type="text/css" rel="stylesheet" />
<link
	href="/bootstrap/css/sticky-footer.css"
	type="text/css" rel="stylesheet" />
<link
	href="/bootstrap/Datepicker/css/bootstrap-datetimepicker.min.css"
	type="text/css" rel="stylesheet" />
<script
	src="/bootstrap/Datepicker/js/bootstrap-datetimepicker.min.js"
	charset="UTF-8"></script>
<script
	src="/bootstrap/Datepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
	charset="UTF-8"></script>
<link href="/css/sample_list.css"
	type="text/css" rel="stylesheet" />
<title>Insert title here</title>
<style type="text/css">
#content {
	width: 300px;
	margin: 0 auto;
	margin-top: 150px;
}
</style>
</head>
<body>
	<div id="header">
		<jsp:include page="/html/header.jsp"></jsp:include>
	</div>
	<div style="margin-top: 80px;"></div>
	<hr style="width: 100%" />
	<div id="content">
		<div id="Sample_div" >
			<form action="/login" method="POST">
				<table id="Sample_table" align="center">
					<tr>
						<td>用户名称:</td>
						<td><input type="text" name="userName" /></td>
					</tr>
					<tr>
						<td>用户口令:</td>
						<td><input type="password" name="userPasswd" /></td>
					</tr>
					<tr align="center">
					<td></td>
						<td align="center"><input type="reset" name="重置" />&nbsp;&nbsp;&nbsp;<input type="submit" name="提交" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div id="footer">
		<jsp:include page="/html/footer.jsp"></jsp:include>
	</div>
</body>
</html>
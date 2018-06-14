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
<title>Insert title here</title>
<meta http-equiv="refresh" content="0.2;url=uploadlink">
<style type="text/css">
#content{
	width:1200px;
	margin:0 auto;
	margin-top:5px;
}
</style>
<script type="text/javascript">
	fileObj = ${fileobject}
	if (fileObj.errInfo == "exist") {
		alert("【" + fileObj.filename + " 】已经存在，请更换文件或者重命名再试");
	} else if (fileObj.errInfo == "TpyeErr") {
		alert("【" + fileObj.filename + " 】文件类型非PDF，请上传PDF类型文件!");
	} else if(fileObj.errInfo == "noFile"){
		alert("请选择上传文件!");
	}else(fileObj.errInfo == "TpyeErr"){
		alert("【" + fileObj.filename + " 】上传成功!");
	}
	history.back(-1);
</script>
</head>
<body>
	<div id="header">
		<jsp:include page="/html/header.jsp"></jsp:include>
	</div>
	<div style="margin-top: 80px;">
	</div>
	<hr style="width: 100%" />
	<div id="content">
		<div id="Sample_div" class="sample_div">
			
		</div>
	</div>
	<div id="footer">
		<jsp:include page="/html/footer.jsp"></jsp:include>
	</div>
</body>
</html>
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
<script src="/js/jquery.blockUI.js"></script>
<script src="/js/ajaxfileupload.js"></script>


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
<title>上传报告</title>
<style type="text/css">
#content {
	width: 1200px;
	margin: 0 auto;
	margin-top: 5px;
}
</style>
<!-- <script type="text/javascript">
	fileObj = ${fileobject}
	if (fileObj.errInfo == "exist") {
		alert("【" + fileObj.filename + " 】已经存在，请更换文件或者重命名再试");
	} else if (fileObj.errInfo == "TpyeErr") {
		alert("【" + fileObj.filename + " 】文件类型非PDF，请上传PDF类型文件!");
	} else if(fileObj.errInfo == "noFile"){
		alert("请选择上传文件!");
	}else{
		alert("【" + fileObj.filename + " 】上传成功!");
	}
</script> -->
<script type="text/javascript">
	fileObj = ${fileobject};
	var mess="";
	if (fileObj.errInfo == "exist") {
		mess="【" + fileObj.filename + " 】已经存在，请更换文件或者重命名再试";
	} else if (fileObj.errInfo == "TpyeErr") {
		mess="【" + fileObj.filename + " 】文件类型非PDF，请上传PDF类型文件!";
	} else if (fileObj.errInfo == "noFile") {
		mess="未选择任何文件，请选择上传文件!";
	} else if(fileObj.errInfo == "notExist"){
		mess="【" + fileObj.filename + " 】上传成功!";
		/* css("color","rgba(255, 0, 0, 0.71)"); */
	}else{
		mess="未知错位，你是不是地球人";
	}
	alert(mess);
</script>
<script type="text/javascript">
	/* 	$(document).ready(function() {
	 $(document).ajaxStart(function() {
	 doUpload();$.blockUI}).ajaxStop($.unblockUI);
	 doUpload();
	 });  */

	$(document).ready(function() {
		$('#doupload').click(function() {
			
			$.blockUI({
				overlayCSS : {
					backgroundColor : '#fff'
				},
				message: $('#displayBox'), 
	            css: { 
	                top:  ($(window).height() - 200) /2 + 'px', 
	                left: ($(window).width() - 400) /2 + 'px', 
	                width: '400px' 
	            } 
			});
		});
	});
</script>

</head>
<body>
	<div id="header">
		<jsp:include page="/html/header.jsp"></jsp:include>
	</div>
	<div style="margin-top: 80px;"></div>
	<hr style="width: 100%" />
	<div id="content">
		<div id="Sample_div" class="sample_div">
			<form action="./upload" method="POST" enctype="multipart/form-data"
				id="uploadForm">
				<table id="Sample_table" class="sample_table">
					<tr>
						<td>文件名称: <input type="file" name="myfiles" id="myfiles" /></td>
						<td>文档类型: <select name="select" id="select_filetype">
								<option value="1">pdf</option>
						</select></td>
						<td><input type="submit" value="上传报告"
							class="btn btn-default btn-xs" id="doupload" /></td>
					</tr>
				</table>
			</form>

		</div>

		<!-- <div style="margin-top: 300px;" align="center">
			<span style="font-weight: lighter; font-size: 3px;"><span
				id="info">xxxx</span> </span>
		</div> -->
	</div>
	<div id="footer">
		<jsp:include page="/html/footer.jsp"></jsp:include>
	</div>
	<img id="displayBox" alt=""
		src="/image/upload.jpg"
		style="display: none">
</body>
</html>
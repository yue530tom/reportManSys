<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看文档</title>
<script type="text/javascript" src="/js/pdfobject.js"/>
<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>
<script>
	function myBrowser() {
		var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
		var isOpera = userAgent.indexOf("Opera") > -1;
		if (isOpera) {
			return "Opera"
		}
		; //判断是否Opera浏览器
		if (userAgent.indexOf("Firefox") > -1) {
			return "FF";
		} //判断是否Firefox浏览器
		if (userAgent.indexOf("Chrome") > -1) {
			return "Chrome";
		}
		if (userAgent.indexOf("Safari") > -1) {
			return "Safari";
		} //判断是否Safari浏览器
		if (userAgent.indexOf("compatible") > -1
				&& userAgent.indexOf("MSIE") > -1 && !isOpera) {
			return "IE";
		}
		; //判断是否IE浏览器
	}
	//以下是调用上面的函数
	//var mb = myBrowser();
	if ("IE" == mb) {
		alert("我是 IE");
	}
	if ("FF" == mb) {
		alert("我是 Firefox");
	}
	if ("Chrome" == mb) {
		alert("我是 Chrome");
	}
	if ("Opera" == mb) {
		alert("我是 Opera");
	}
	if ("Safari" == mb) {
		alert("我是 Safari");
	}
</script>
</head>
<body>
	<table style="width: 100%; height: 100%">
		<tr>
			<td height="600" id="pdf"><script>
				fileObj = ${fileobject};
				if (fileObj.filename == "") {
					alert("传入的id无效，请重新输入！")
					window.history.back(-1);
				} else {
					PDFObject.embed("pdf/" + fileObj.filename, "#pdf");
				}
			</script></td>
		</tr>
	</table>
</body>
</html>
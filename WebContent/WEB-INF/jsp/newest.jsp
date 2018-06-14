<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/jquery/jquery-1.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/jquery/jquery-ui-1.8.10.custom.min.js"></script>

<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" type="text/css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/bootstrap/css/sticky-footer.css" type="text/css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/bootstrap/Datepicker/css/bootstrap-datetimepicker.min.css"
	type="text/css" rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/bootstrap/Datepicker/js/bootstrap-datetimepicker.min.js"
	charset="UTF-8"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/Datepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
	charset="UTF-8"></script>
<link href="${pageContext.request.contextPath}/css/sample_list.css" type="text/css"
	rel="stylesheet" />
<title>最近上传报告</title>
<style> 
.div-left{width:300px;height:120px;border:1px solid #000;float:left} 
/* css注释说明：float:left设置居左靠左 */ 
</style> 
<script type="text/javascript">

$(document).ready(
		function() {
			$("#header").load("${pageContext.request.contextPath}/html/header.jsp");
	    	$("#footer").load("${pageContext.request.contextPath}/html/footer.jsp");
            initTable();
		});

function initTable(){
	var data = null;
	$.ajax({
		type:"GET",
		data:data,
		url:"reportLastRefresh",
		dataType:"JSON",
		success : function(json) {
			refreshList(json);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			  //alert(textStatus+errorThrown.getMessage());
		}
	});
}

function refreshList(json){
	var ja = json.list;
	var string= JSON.stringify(json);
	
	$("#Sample_table").empty();
	$("#Sample_table")
			.append(
					'<tr><th>文件名称</th><th>编辑日期</th><th>编辑作者</th><th>文档类型</th><th>文档分类</th><th>操作</th></tr>');
	for(var i = 0; i < ja.length; i++){
		var file_name = ja[i].file_name;
		var editor = ja[i].editor;
		var file_category = ja[i].file_category;
		var edit_time = ja[i].edit_time;
		var file_id = ja[i].file_id;
		var file_type = ja[i].file_type;
		var file_secondName = ja[i].file_secondName;
		$("#Sample_table").append('<tr id="tr_'+i+'"></tr>');
		$("#tr_" + i).append('<td><a href="report/'+file_id+'" target="_blank">'+file_name+'</a></td>');
		$("#tr_" + i).append("<td>" + edit_time + "</td>");
		$("#tr_" + i).append("<td>" + editor + "</td>");
		$("#tr_" + i).append("<td>" + file_type + "</td>");
		if(file_category==1){
			$("#tr_" + i).append("<td>性能测试报告</td>");
		}else{
			$("#tr_" + i).append("<td>其他</td>");
		}
		$("#tr_" + i).append('<td><a href="${pageContext.request.contextPath}/download/' + file_id + '">下载</a></td>');
	}
	$("#record_sum").text(ja.length).css("color","rgba(255, 0, 0, 0.71)");
}
</script>
</head>
<body style="padding: 80px">
	<div id="header"></div>
	<div id="Content_header" class="content_header">
		<h3>最新10份报告</h3>
	</div>
	<hr style="width: 1300px" />
	<div id="Conetent_body" class="content_body">
		
		<div id="Sample_div" class="sample_div">
			<table id="Sample_table" class="sample_table">
				<tr>
					<th>样本名</th>
					<th>编辑日期</th>
					<th>创建者</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</table>
		</div>
	</div>
	<div id="footer"></div>
</body>
</html>
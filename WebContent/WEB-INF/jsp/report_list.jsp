<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/jquery/jquery-1.7.1.min.js"></script>
<script src="/jquery/jquery-ui-1.8.10.custom.min.js"></script>
<script src="/js/jquery.blockUI.js"></script>
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
/* $(document).ajaxStart(function() {
	$('#Filter_btn').click(function() { 
    $.blockUI({ 
        message: $('#displayBox'), 
        css: { 
            top:  ($(window).height() - 400) /2 + 'px', 
            left: ($(window).width() - 400) /2 + 'px', 
            width: '400px' 
        } 
    })
	}).ajaxStop($.unblockUI); */
$(document).ready(
		function() {
			$("#header").load("/html/header.jsp");
	    	$("#footer").load("/html/footer.jsp");
/* 	    	$(document).ajaxStart(function() {
	    		$('#Filter_btn').click(function() { 
	    	    $.blockUI({ 
	    	        message: $('#displayBox'), 
	    	        css: { 
	    	            top:  ($(window).height() - 400) /2 + 'px', 
	    	            left: ($(window).width() - 400) /2 + 'px', 
	    	            width: '400px' 
	    	        } 
	    	    })
	    		}).ajaxStop($.unblockUI); */
	    		//$(document).ajaxStart($.blockUI).ajaxStop($.unblockUI);
	    		$(document).ajaxStart(
	    				function() { 
	    				        $.blockUI({ 
	    				            message: $('#displayBox'), 
	    				            css: { 
	    				                top:  ($(window).height() - 400) /2 + 'px', 
	    				                left: ($(window).width() - 400) /2 + 'px', 
	    				                width: '400px' 
	    				            } 
	    				        }); 
	    				    }).ajaxStop($.unblockUI);
            initTable("{}");
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

function initTable(filter){
	var data = null;
	if(filter != "{}"){
		data = "filter="+filter; 
	}
	
	$.ajax({
		type:"GET",
		data:data,
		url:"report_filter",
		dataType:"JSON",
		success : function(json) {
			refreshList(json);
			initPage(json);
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			//  alert(textStatus+errorThrown.getMessage());
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
		$("#tr_" + i).append('<td><a href="/download/' + file_id + '">下载</a></td>');
	}
	$("#record_sum").text(ja.length).css("color","rgba(255, 0, 0, 0.71)");
}
  
function initPage(json) {
	var curPage = 1;
	var totalPage = json.page;
	if (curPage == '1') {
		$("#btn_lastPage").attr({
			"disabled" : "disabled"
		});
	} else {
		$("#btn_lastPage").removeAttr("disabled");
	}
	if (parseInt(curPage) == parseInt(totalPage)) {
		$("#btn_nextPage").attr({
			"disabled" : "disabled"
		});
	} else {
		$("#btn_nextPage").removeAttr("disabled");
	}

	$("#cur_page").text(curPage);
	$("#tot_page").text(totalPage);
}
function jumpPage() {
	var jpage = $("#pageNum").val();
	var tpage = $("#tot_page").text();
	var num = parseInt(jpage);
	var page = '{"cur_page":"' + (num - 2) + '","totalPage":"' + tpage
			+ '"}';
	var filter = $("#buffer_span").text();
	if (num<=0 || num>parseInt(tpage) || jpage.length==0 ) {
		alert("请输入合适的页数！");
	} else {
		$.ajax({
			url : "report_filter",
			type : "GET",
			dataType : "JSON",
			data : "page=" + page + "&filter=" + filter,
			success : function(json) {
				refreshList(json);
				$("#cur_page").text(jpage);
				turnButtonStatue(jpage, tpage);
			}

		});
	}
}

function nextPage() {
	var curpage = $("#cur_page").text();
	var tpage = $("#tot_page").text();
	var num = parseInt(curpage);
	var page = '{"cur_page":"' + (num - 1) + '","totalPage":"' + tpage+ '"}';
	var filter = $("#buffer_span").text();
	if (num >= parseInt(tpage)) {
		alert("请输入合适的页数！");
	} else {
		$.ajax({
			url : "report_filter",
			type : "GET",
			dataType : "JSON",
			data : "page=" + page + "&filter=" + filter,
			success : function(json) {
				refreshList(json);
				$("#cur_page").text(num + 1);
				turnButtonStatue(num + 1, tpage);
			}
		});
	}
}

function lastPage() {
	var curpage = $("#cur_page").text();
	var tpage = $("#tot_page").text();
	var num = parseInt(curpage);
	var page = '{"cur_page":"' + (num - 3) + '","totalPage":"' + tpage
			+ '"}';
	var filter = $("#buffer_span").text();
	if (num <= 1) {
		alert("请输入合适的页数！");
	} else {
		$.ajax({
			url : "report_filter",
			type : "GET",
			dataType : "JSON",
			data : "page=" + page + "&filter=" + filter,
			success : function(json) {
				refreshList(json);
				$("#cur_page").text(num - 1);
				turnButtonStatue(num - 1, tpage);
			}

		});
	}
}

function turnButtonStatue(curPage, totalPage) {
	if (curPage == '1') {
		$("#btn_lastPage").attr({
			"disabled" : "disabled"
		});
	} else {
		$("#btn_lastPage").removeAttr("disabled");
	}
	if (parseInt(curPage) == parseInt(totalPage)) {
		$("#btn_nextPage").attr({
			"disabled" : "disabled"
		});
	} else {
		$("#btn_nextPage").removeAttr("disabled");
	}
}

function clearText(id){
	$(id).val("");
}

function reFixText(id,text){
	if($(id).val()=="" || $(id).val()==" "){
		$(id).val(text);
	}
}

function doFilter(){
	var filterJs = {};
	if ($("#Name_input").val() != "请输入文件名称") {
		filterJs["file_name"] = $("#Name_input").val();
	}
	if ($("#Name_idetor").val() != "请输入创建者") {
		filterJs["editor"] = $("#Name_idetor").val();
	}
	if ($("#sample_edit_date").val() != "请输入编辑时间") {
		filterJs["edit_time"] = $("#sample_edit_date").val();
	}
	if ($("#status_list").val() != "all") {
		filterJs["status"] = $("#status_list").val();
	}
	$("#buffer_span").text(JSON.stringify(filterJs));
	initTable(JSON.stringify(filterJs));
}

</script>
</head>
<body style="padding: 80px">
	<div id="header"></div>
	<div id="Content_header" class="content_header">
		<h3>报告列表</h3>
	</div>
	<hr style="width: 1300px" />
	<div id="Conetent_body" class="content_body">
		<div id="Filter_div" class="filter_div">
			<table id="Filter_table" class=".filter_table">
				<tr>
					<td><b>文件名称：</b><input id="Name_input" name="name_input"
						type="text" value="请输入文件名称" onfocus="clearText('#Name_input');"
						onblur="reFixText('#Name_input','请输入文件名称');" /></td>
					<td><b>文件类型：</b><select id="status_list" name="status_list">
							<option>all</option>
							<option value="1">PDF</option>
					</select></td>
					<td><button id="Filter_btn" class="filter_btn"
							onclick="doFilter();">筛选</button></td>
				</tr>
				<tr>
					<td><b>创建作者：</b><input id="Name_idetor" name="name_idetor"
						type="text" value="请输入创建者" onfocus="clearText('#Name_idetor');"
						onblur="reFixText('#Name_idetor','请输入创建者');" /></td>
					<td><b style="float: left;">编辑时间：</b>
						<div id="Idet_time" class="input-group date form_date col-md-5"
							style="width: 285px; float: left;">
							<input id="sample_edit_date" name="sample_edit_date" type="text"
								style="padding: 0" class="form-control" value="请输入编辑时间"
								onfocus="clearText('#sample_edit_date');"
								onblur="reFixText('#sample_edit_date','请输入编辑时间');" /> <span
								class="input-group-addon" id="Input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
						</div></td>
				</tr>
			</table>
		</div>
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

		<div style="margin-top: 3px;">

			<span style="font-weight: lighter;">本页共<span
				id="record_sum"></span>条记录
			</span>
		</div>

		<div id="pt_div">
			<input type="button" id="btn_lastPage" class="btn btn-default btn-xs"
				value="上一页" onclick="lastPage();" />&nbsp;<span id="cur_page">0</span>&nbsp;
			<input type="button" id="btn_nextPage" class="btn btn-default btn-xs"
				value="下一页" onclick="nextPage()" /> 共<span id="tot_page"></span>页&nbsp;&nbsp;&nbsp;&nbsp;
			去<input type="text" width="20px" id="pageNum" />页 &nbsp; <input
				type="button" value="确定" class="btn btn-default btn-xs"
				onclick="jumpPage();" />
		</div>
		<span id="buffer_span" style="display: none">{}</span>
	</div>
	<div id="footer"></div>
	<img id="displayBox" alt="" src="/image/upload.jpg" style="display:none">
</body>
</html>
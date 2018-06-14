<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<a class="navbar-brand" href="about"><span
				class="glyphicon glyphicon-tree-conifer"></span>测试报告归档助手</a>
		</div>
		<div>
			<ul class="nav nav-tabs">
				<li class="dropdown"><a
					href="/"><span class="glyphicon glyphicon-home"></span>首页</a></li>
				<li class="dropdown"><a href="reportLast">最新报告</a></li>
				<li class="dropdown"><a href="reportList">报告列表</a></li>
				<li class="dropdown"><a href="uploadlink">上传报告</a></li>			
			</ul>
		</div>
		<div
			style="color: black; position: absolute; right: 10px; bottom: 15px;">
			<%
				if (request.getSession().getAttribute("userName") == null) {
			%>
			<span> <a class="link"
				href="/login">登录</a>
			</span>
			<%
				} else {
			%>
			<span>Hello, <%=request.getSession().getAttribute("userName")%>&nbsp;!&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="link" href="/logout">退出</a>
			</span>
			<%
				}
			%>
		</div>
	</nav>
</div>

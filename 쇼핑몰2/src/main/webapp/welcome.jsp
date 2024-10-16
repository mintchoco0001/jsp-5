<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹 쇼핑몰</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"/>
<script src="sources/js/clock.js"></script>
</head>
<body onload="clock()">
	<jsp:include page="header.jsp"/>
	
	<%!
		String greeting = "쇼핑몰에 오신것을 환영합니다!";
		String tagline = "welcome to shoppingmall";
	%>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting %>
			</h1>		
		</div>
	</div>
	
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
			<h3 id="clock"></h3>
			
		</div>
		<hr>
	</div> 
</body>
</html>
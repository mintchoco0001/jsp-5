<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>웹 파일에서 메핑 후 출력하기</h3>
	<p>
		<strong><%=request.getAttribute("message") %></strong>
		<br>
		<a href="AnnoMapping.do">바로가기</a>
	</p>
</body>
</html>
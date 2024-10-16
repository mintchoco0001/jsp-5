<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>웹 쇼핑몰</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>


	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h5 class="form-signin-heading">아이디와 비밀번호를 입력해주세요</h5>

			<%-- <%
				String error = request.getParameter("error");
				/* if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				} */
			%> --%>
			<c:set var="error" value="${param.error}"></c:set>
			<c:if test="${not empty error}">
				<div class='alert alert-danger'>아이디와 비밀번호를 확인해 주세요</div>
			</c:if>

			<form class="form-signin" action="loginprocess.login" method="post">

				<div class="form-group">
					<label for="inputUserName" class="sr-only">아이디</label> <input
						type="text" class="form-control" placeholder="ID" name="id"
						required autofocus>
				</div>

				<div class="form-group">
					<label for="inputPassword" class="sr-only">비밀번호</label> <input
						type="password" class="form-control" placeholder="Password"
						name="password" required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
		</div>
	</div>

</body>
</html>
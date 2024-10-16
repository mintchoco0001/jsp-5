<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원가입</h1>
		</div>
	</div>


	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-5">

			<%-- 	<%
			String error = request.getParameter("error");
			if (error != null) {
				out.println("<div class='alert alert-danger'>");
				out.println("아이디가 중복되었습니다");
				out.println("</div>");
			}
			%> --%>

			<c:set var="addError" value="${param.error}" />
			<c:if test="${not empty addError }" />

			<form name="login" class="form-signin" action="addMemberProcess.jsp"
				method="post" enctype="multipart/form-data">

				<div class="form-group">
					<label for="inputUserId" class="sr-only">아이디</label> <input
						type="text" class="form-control" placeholder="아이디" name="id"
						id="inputUserId" required autofocus>
				</div>

				<div class="form-group">
					<label for="inputPassword" class="sr-only">비밀번호</label> <input
						type="password" class="form-control" placeholder="비밀번호"
						name="password" id="inputPassword" required>
				</div>

				<div class="form-group">
					<label for="inputName" class="sr-only">이름</label> <input
						type="text" class="form-control" placeholder="이름" name="name"
						id="inputName" required>
				</div>

				<div class="form-group row">
					<label class="col-sm-5">사진</label> 
					<input type="file"
						class="form-control" name="personImage" required>
				</div>


				<button class="btn btn btn-lg btn-success btn-block" type="submit">회원가입</button>

			</form>
		</div>
	</div>

</body>
</html>
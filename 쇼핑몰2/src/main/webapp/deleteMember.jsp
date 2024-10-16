<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>웹 쇼핑몰</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원탈퇴</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h5 class="form-signin-heading">비밀번호를 입력해주세요</h5>
			
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("비밀번호가 다릅니다");
					out.println("</div>");
				}
			%>
			
			<form class="form-signin" action="deleteMemberProcess.jsp" method="post">
				
				<div class="form-group">
					<label for="inputPassword" class="sr-only">비밀번호</label> 
					<input type="password" class="form-control" 
					placeholder="Password" name="password" required>
				</div>
				<button class="btn btn btn-lg btn-danger btn-block" 
					type="submit">회원탈퇴</button>
			</form>
		</div>
	</div>
	
</body>
</html>
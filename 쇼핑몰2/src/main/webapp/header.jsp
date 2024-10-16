<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String user_id = (String) session.getAttribute("UserId");
%>

<nav class="navbar navbar-expand navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="welcome.jsp">홈</a>
			<%-- 		<%
			if (user_id == null) { //null = emty
				out.println("<a class='navbar-brand' href='login.jsp'>로그인</a>");
				out.println("<a class='navbar-brand' href='addMember.jsp'>회원가입</a>");

			} else {
				out.println("<a class='navbar-brand' href='logout.jsp'>로그아웃</a>");
				out.println("<a class='navbar-brand' href='deleteMember.jsp'>회원탈퇴</a>");

			}
			%> --%>

			<c:set var="user_id" value="${ sessionScope.UserId}"></c:set>
			<c:choose>
				<c:when test="${not empty user_id }">
					<a class="navbar-brand" href="logout.jsp">로그아웃</a>
					<a class="navbar-brand" href="infoMember.jsp">회원정보</a>
					<a class="navbar-brand" href="deleteMember.jsp">회원탈퇴</a>
				</c:when>
				<c:otherwise>
					<a class="navbar-brand" href="login.jsp">로그인</a>
					<a class="navbar-brand" href="addMember.jsp">회원가입</a>
				</c:otherwise>
			</c:choose>
		</div>

		<div>
			<ul class="navbar-nav mr-auto">
				<li class=" nav-item">
					<a class="navbar-brand" href="List.jsp">게시판</a>
					<a class="navbar-brand" href="Products.jsp">상품 목록</a>
					<a class="navbar-brand" href="addProduct.jsp">상품 추가</a>
				</li>
			</ul>
		</div>
	</div>
</nav>

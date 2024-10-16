<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDTO"%>
<%@ page import="member.MemberDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String id = request.getParameter("id");
String password = request.getParameter("password");

MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.getMemberDTO(id, password);
dao.close();

/* if (dto.getId() != null) {
	session.setAttribute("UserId", dto.getId());
	session.setAttribute("UserName", dto.getName());
	response.sendRedirect("welcome.jsp");
} else {
	request.getRequestDispatcher("login.jsp?error=1").forward(request, response);
} */
%>


<c:set var="id" value="<%=dto.getId()%>" />
<c:choose>
	<c:when test="${not empty id}">
		<c:set var="UserId" value="<%=dto.getId()%>" scope="session"></c:set>
		<c:set var="Username" value="<%=dto.getName()%>" scope="session"></c:set>
		<c:redirect url="welcome.jsp" />
	</c:when>
	<c:otherwise>
		<c:redirect url="login.jsp">
			<c:param name="error" value="1"></c:param>
		</c:redirect>
	</c:otherwise>
</c:choose>

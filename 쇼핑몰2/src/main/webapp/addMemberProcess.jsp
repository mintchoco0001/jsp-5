<%@page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="java.sql.*"%>
<%@ page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");

String url = application.getRealPath("/sources/images");

MultipartRequest multi = new MultipartRequest(request, url, 10 * 1024 * 1024, "utf-8",
		new DefaultFileRenamePolicy());

String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");

String filename = multi.getFilesystemName("personImage");

MemberDAO dao = new MemberDAO();
int re = dao.addMemberDTO(id, password, name, filename);
dao.close();

%>

<c:set var="re" value="<%=re%>" />
<c:choose>
	<c:when test="${re eq 1}">
		<script>
			alert("회원가입완료");
		</script>
		<script>
			location.href = "welcome.jsp"
		</script>
	</c:when>
	<c:when test="${re eq 2}">
		<script>
			alert("아이디가 중복되었습니다");
		</script>
		<script>
			location.href = "addMember.jsp"
		</script>
	</c:when>
</c:choose>


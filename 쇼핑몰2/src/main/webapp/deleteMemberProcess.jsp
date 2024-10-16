<%@page import="java.sql.*"%>
<%@ page import="member.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = (String) session.getAttribute("UserId");
	String password = request.getParameter("password");
	
	
	MemberDAO dao = new MemberDAO();
	int re = dao.deleteMemberDTO(id, password);
	dao.close();	

	if (re == 1) {
		session.invalidate();
		out.println("<script>alert('회원삭제완료');</script>");
		out.println("<script>location.href='welcome.jsp'</script>");
	} else {
		request.getRequestDispatcher("deleteMember.jsp?error=1").forward(request, response);
	}
	
%>    
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDTO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="utils.JSFunction"%>


<%
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String password = request.getParameter("password");
	String ip = request.getRemoteAddr();
	
	BoardDTO dto = new BoardDTO();
	//dto.setName(name);
	//dto.setSubject(subject);
	//dto.setContent(content);
	//dto.setPassword(password);
	//dto.setIp(ip);
	
	BoardDAO dao = new BoardDAO();
	int result=0;
	for(int i=1; i<=200; i++ ) {
		dto.setSubject(subject+i);
		dto.setName(name);
		dto.setContent(content);
		dto.setPassword(password);
		dto.setIp(ip);
		result = dao.insertBoard(dto);
	}
	
	dao.close();
	
	if(result==1) {
		JSFunction.alertLocation("글 작성이 성공하였습니다.", "List.jsp", out);
	} else {
		JSFunction.alertBack("글 작성 실패", out);
	}

%>
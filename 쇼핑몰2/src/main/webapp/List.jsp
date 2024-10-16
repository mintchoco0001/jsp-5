<%@page import="utils.BoardPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDTO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String items = request.getParameter("items");
	String text = request.getParameter("text");
	BoardDAO dao = new BoardDAO();
	int listCount = dao.selectCount(items,text);
	
	int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
	int totalPage = (int)Math.ceil((double)listCount/pageSize);
	
	int pageNum=1;
	String pageTemp = request.getParameter("pageNum");
	if(pageTemp != null && !pageTemp.equals(""))
		pageNum = Integer.parseInt(pageTemp);
	
	int start=(pageNum-1) * pageSize + 1;
	
	ArrayList<BoardDTO> boardLists = dao.getBoardList(items,text,pageSize,start);
	dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"/>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>		
		</div>
	</div>
	
	<div class="container">
		<form>
			<div>
				<div class="text-right">
					<span class="badge badge-success">전체 <%=listCount%>건</span>
				</div>
			</div>
			
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>글쓴이</th>
					</tr>
					<%-- <%
						for (BoardDTO dto : boardLists) {
							
					%> --%>
					<c:set var="list" value="<%=boardLists%>"></c:set>
					<c:forEach items="${list}" var="blist">
					
					<tr>
						<td>${blist.num}</td>
						<td>
							<a href="View.jsp?num=${blist.num}">
							${blist.subject}
							</a>
						</td>
						<td>${blist.regist_day}</td>
						<td>${blist.hit}</td>
						<td>${blist.name}</td>
					</tr>
					
					</c:forEach>
					<%-- <%
						}
					%> --%>
				</table>
			</div>
			
			<div align="center">
				<span><%=BoardPage.pagingStr(listCount, pageSize, blockPage, pageNum) %></span>
			</div>
			
			<div align="center">
					<table>
						<tr>
							<td width="100%" align="left">&nbsp;&nbsp; 
								<select name="items" class="txt">
										<option value="subject">제목에서</option>
										<option value="content">본문에서</option>
										<option value="name">글쓴이에서</option>
								</select>
								<input name="text" type="text"/>
								<input type="submit" id="btnAdd" 
								class="btn btn-primary" value="검색 " />
							</td>
							
							<td width="100%" align="right">
								<a href="Write.jsp" class="btn btn-primary">글쓰기</a>
							</td>
						</tr>
					</table>
			</div>
		</form>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDTO" %>
<%@ page import="board.BoardDAO" %>

<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO();
	dao.hitCount(num);
	BoardDTO dto = dao.selectView(num);
	dao.close();

%>

<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<title>게시판 세부내용 보기</title>
</head>

<body>
	<jsp:include page="header.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판 세부내용 보기</h1>
		</div>
	</div>

	<div class="container">

			<div class="form-group row">
				<label class="col-sm-2 control-label" >성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" value="<%=dto.getName()%>" readonly>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="subject" type="text" class="form-control" value="<%=dto.getSubject()%>" readonly>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8">
					<textarea name="content" cols="50" rows="5" class="form-control">
						<%=dto.getContent().replace("\r\n","<br>")%>
					</textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >등록일자</label>
				<div class="col-sm-5">
					<input name="regist_day" type="text" class="form-control" value="<%=dto.getRegist_day()%>" readonly>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >아이피주소</label>
				<div class="col-sm-5">
					<input name="ip" type="text" class="form-control" value="<%=dto.getIp()%>" readonly>
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					 <input type="button" class="btn btn-primary" value="삭제하기">
					 <input type="button" class="btn btn-primary" value="수정하기">				
					 <input type="button" class="btn btn-primary" value="돌아가기">				
				</div>
			</div>
			
		
		
	</div>
</body>
</html>




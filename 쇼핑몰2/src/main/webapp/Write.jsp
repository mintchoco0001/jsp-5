<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<title>게시판 글작성</title>
</head>

<body>
	<jsp:include page="header.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판 글작성</h1>
		</div>
	</div>

	<div class="container">
		<form action="writeProcess.jsp" class="form-horizontal" method="post">

			<div class="form-group row">
				<label class="col-sm-2 control-label" >성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="subject" type="text" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8">
					<textarea name="content" cols="50" rows="5" class="form-control">
					</textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-5">
					<input name="password" type="password" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					 <input type="submit" class="btn btn-primary" value="등록">				
					 <input type="reset" class="btn btn-primary" value="취소">
				</div>
			</div>
			
		</form>
		
	</div>
</body>
</html>




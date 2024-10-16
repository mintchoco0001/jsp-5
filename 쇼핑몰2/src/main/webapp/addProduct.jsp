<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품등록</h1>
		</div>
	</div>

	<div class="container">
		<form action="ProcessAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 아이디</label>
				<div class="col-sm-3">
					<input type="text" name="productId" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품 이름</label>
				<div class="col-sm-3">
					<input type="text" name="productName" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품 가격</label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품 정보</label>
				<div class="col-sm-5">
					<input type="text" name="description" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품 분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품 제조사</label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품 재고량</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품 상태</label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New"> 신상품 
					<input type="radio" name="condition" value="Old"> 중고상품 
					<input type="radio" name="condition" value="Refurbished"> 리퍼상품
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-5">
					<input type="file" name="filename">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="offset-sm-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록하기">
				</div>
			</div>
		</form>
	</div>
</body>
</html>

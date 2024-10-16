<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" />
<script src="sources/js/clock.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>

	<%
	String id = request.getParameter("id");
	ProductDAO dao = new ProductDAO();
	ProductDTO product = dao.getProductById(id);
	dao.close();
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 text-center">
				<img src="./images/<%=product.getProductId()%>.jpg"
					style="height: 500px; width: 100%">
			</div>
			<div class="col-md-6">
				<h3> 상품명 : <%=product.getPname()%></h3>
				<p> 상품설명 : <%=product.getDescription()%></p>
				<p> 상품코드 : <%=product.getProductId()%></p>
				<p> 제조사 : <%=product.getManuFacturer()%></p>
				<p> 분류 : <%=product.getCategory()%></p>
				<p> 재고수 : <%=product.getUnitsInStock()%></p>
				<p> 상품가격 : <%=product.getUnitPrice()%>원</p>
				<p> 상품상태 : <%=product.getCondition()%></p>
				<p><a href="#"
					class="btn btn-secondary" role="button">상품 주문</a></p>
				<p><a href="Products.jsp"
					class="btn btn-secondary">상품 목록</a></p>
			</div>
		</div>
	</div>
</body>
</html>

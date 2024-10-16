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
    	ProductDAO dao = new ProductDAO();
    	ArrayList<ProductDTO> listOfProducts = dao.getAllProducts();
    	dao.close();
    %>
    
    <div class="container">
        <div class="row">
        <%
        	for(int i=0; i<listOfProducts.size(); i++){
        		ProductDTO product = listOfProducts.get(i);
        	
        %>
            <div class="col-md-4 text-center">
                <img src="./sources/images/<%=product.getFilename()%>"
                     style="height: 200px;width: 100%">
                <h3><%= product.getPname() %></h3>
                <p><%= product.getDescription() %></p>
                <p><%= product.getUnitPrice()%>원</p>
                <p><a href="ProductsInfo.jsp?id=<%=product.getProductId() %>" 
                      class="btn btn-secondary" role="button">상품 상세 페이지</a></p>
            </div>
       <%
            }
        %>
        </div>
    </div>
</body>
</html>

<%@page import="product.ProductDAO"%>
<%@page import="product.ProductDTO"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="javax.swing.DefaultBoundedRangeModel"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.oreilly.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String url = application.getRealPath("/sources/images");

MultipartRequest multi = new MultipartRequest(request, url, 10 * 1024 * 1024, "utf-8",
		new DefaultFileRenamePolicy());

String productId = multi.getParameter("productId");
String productName = multi.getParameter("productName");
int unitPrice = Integer.parseInt(multi.getParameter("unitPrice"));
String description = multi.getParameter("description");
String category = multi.getParameter("category");
String manufacturer = multi.getParameter("manuFacturer");
int unitsInStock = Integer.parseInt(multi.getParameter("unitsInStock"));
String condition = multi.getParameter("condition");

String filename = multi.getFilesystemName("filename");

ProductDAO dao = new ProductDAO();
int result = dao.addProduct(productId, productName, unitPrice, description, category, manufacturer, unitsInStock,
		condition, filename);

if (result == 1) {
	out.print("<script>상품을 추가했습니다</script>");
	response.sendRedirect("Products.jsp");
}else{
	out.print("<script>상품 추가에 실패했습니다</script>");
	request.getRequestDispatcher("addProduct.jsp?error=1");
}
dao.close();
%>
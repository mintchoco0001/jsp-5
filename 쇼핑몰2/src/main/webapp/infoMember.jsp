<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.apache.catalina.valves.JDBCAccessLogValve"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보</h1>
		</div>
	</div>
	<%
	String id = (String) session.getAttribute("UserId");
	JDBConnect jdbc = new JDBConnect();
	String sql = "SELECT id, password, name, personImage FROM members WHERE id = ?";
	ResultSet rs = null;
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	psmt.setString(1, id);
	rs=psmt.executeQuery();
	rs.next();
	%>


	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="/sources/images/<%=rs.getString("personImage")%>">
			</div>
			<div class="col-md-6">
				<h3>
					회원 아이디 :
					<%=rs.getString("id")%></h3>
				<h3>
					회원 비밀번호 :
					<%=rs.getString("password")%></h3>
				<h3>
					회원 이름 :
					<%=rs.getString("name")%></h3>
			</div>

		</div>
	</div>
</body>
</html>

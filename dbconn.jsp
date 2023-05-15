<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>Insert title here</title>
</head>
<body>
	<%
	Connection conn = null;

	String url = "jdbc:mysql://Localhost:3306/JSPBookDB";
	String user = "root";
	String password = "java";

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	%>
</body>
</html>
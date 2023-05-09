<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<%@ include file="dbcoon.jsp"%>
	<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	String rating = request.getParameter("rating");
	int num = 1;
	PreparedStatement pstmt = null;

	try {
		String sql = "insert into board(title,content,writer,date,rating) Values(?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, writer);
		pstmt.setObject(4, LocalDateTime.now());
		pstmt.setString(5, rating);
		pstmt.executeUpdate();

	} catch (Exception excep) {

	} finally {
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
	response.sendRedirect("boardwrite.jsp");
	%>

</body>
</html>
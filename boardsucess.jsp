<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = (String) session.getAttribute("userId");
	String rating = request.getParameter("rating");
	if(rating == null){
		rating = "0";
	}
	
	PreparedStatement pstmt = null;

	if (writer != null) {
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
	}
	response.sendRedirect("boardwrite.jsp");
	%>

</body>
</html>
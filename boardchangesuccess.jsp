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
	int number =(int) session.getAttribute("number");
	int num = 1;
	PreparedStatement pstmt = null;

	if (writer != null) {
		try {
			String sql = "update board set content=? ,rating =? where titlenum= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setString(2, rating);
			pstmt.setInt(3, number);
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
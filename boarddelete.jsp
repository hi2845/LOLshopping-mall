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
	int number = Integer.parseInt(request.getParameter("number"));

	PreparedStatement pstmt = null;

	try {
		String sql = "delete from board where titlenum = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, number);
	
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
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="dbconn.jsp"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <%
 request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String phone = phone1 + phone2 + phone3;
String birthYear = request.getParameter("birthYear");
String birthMonth = request.getParameter("birthMonth");
String birthDay = request.getParameter("birthDay");
String birth = birthYear + birthMonth + birthDay;
String id="";
%>

<title>Insert title here</title>
</head>
<body>
<%

ResultSet rs = null;
PreparedStatement pstmt = null;
try {
	String sql = "SELECT ID FROM projectdata WHERE NAME=? AND BIRTH=? AND PHONE =?";
	pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
	    pstmt.setString(2, birth);
	    pstmt.setString(3, phone);
	rs = pstmt.executeQuery();
 while(rs.next()) {
	 id = rs.getString("id");
	}
} catch (SQLException e) {
	id="123";
} finally {
		if (pstmt != null)
			pstmt.close();
		if (rs != null)
			rs.close();
		if (conn != null)
			conn.close();
	}
%>
당신의 아이디는:<%=id%> 입니다.
<a href="findout.jsp">뒤로가기</a>
</body>
</html>
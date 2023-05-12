<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id"); //로그인창에서 가져온 id pw 값 
String pw = request.getParameter("pw"); 
PreparedStatement pstmt = null;
ResultSet rs = null;
try {
  String sql = "SELECT * FROM projectdata WHERE id = ? AND pw = ? " ;
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(1, id);
  pstmt.setString(2, pw);
  rs = pstmt.executeQuery();
  

  if (rs.next() && rs.getString("id").equals(id) && rs.getString("pw").equals(pw)) {
    // 로그인 성공
    session.setAttribute("userId", id);
    session.setAttribute("userPw", pw);
	response.sendRedirect("darul.html");
  } else {
    // 로그인 실패
    out.println("로그인 실패");
  }
} catch (Exception e) {
  out.println("로그인 처리 중 오류가 발생하였습니다.");
} finally {
  if (rs != null) rs.close();
  if (pstmt != null) pstmt.close();
  if (conn != null) conn.close();
}
%>
</body>
</html>
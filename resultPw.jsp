<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="dbconn.jsp"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String phone = phone1 + phone2 + phone3;
	String birthYear = request.getParameter("birthYear");
	String birthMonth = request.getParameter("birthMonth");
	String birthDay = request.getParameter("birthDay");
	String birth = birthYear + birthMonth + birthDay;
	String pw = "";
	%>
	<%
	ResultSet rs= null;
	PreparedStatement pstmt = null;
	try{
		String sql="SELECT PW FROM projectdata WHERE name =? AND id =? AND phone=? AND birth=?";
		pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, phone);
			pstmt.setString(4, birth);
		rs = pstmt.executeQuery();
//		rs = pstmt.executeQuery("SELECT PW FROM projectdata WHERE name =? AND id =? AND phone=? AND birth=?");
		
		while(rs.next()){
			pw = rs.getString("pw");
		}
	}catch(SQLException e){
		
	}finally{
		if(pstmt!=null)pstmt.close();
		if(rs!=null)rs.close();
		if(conn!=null)conn.close();
	}
	
	%>
	당신의 비밀번호는 : <%= pw %>입니다.
	
</body>
</html>
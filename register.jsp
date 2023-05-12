<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file ="dbconn.jsp" %>
<%@ page import = "java.sql.*" %>
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
String id= request.getParameter("id");
String pw = request.getParameter("pw");
String re_pw = request.getParameter("re_pw");
String position = request.getParameter("position");
String email1= request.getParameter("email1");
String email2= request.getParameter("email2");
String email = email1 + "@"+ email2;
String sex= request.getParameter("sex");
String birthYear= request.getParameter("birthYear");
String birthMonth= request.getParameter("birthMonth");
String birthDay= request.getParameter("birthDay");
String birth= birthYear + birthMonth + birthDay;
String postcode = request.getParameter("postcode");
String address = request.getParameter("address");
String detailAddress = request.getParameter("detailAddress");
String extraAddress = request.getParameter("extraAddress");
String location = address + "\t" +detailAddress + extraAddress;
String balance= request.getParameter("balance");
String phone1= request.getParameter("phone1");
String phone2= request.getParameter("phone2");
String phone3= request.getParameter("phone3");
String phone= phone1 + phone2 + phone3;
String grade= request.getParameter("grade");

%>
<p><h1>입력하신 정보</h1>
<p> 이름: <%= name %>
<p> 아이디: <%= id %>
<p> 비번  <%= pw %>
<p> 비번확인:  <%= re_pw %>
<p> 포지션:  <%= position %>
<p> 이메일:  <%= email %>
<p> 성별:  <%= sex %>
<p> 생년월일:  <%= birth %>
<p> 주소:  <%= location %>
<p> 잔고:  <%= balance %>
<p> 연락처:  <%= phone %>
<p> 등급: <%= grade %>
<p><h2>회원등록이 완료되었습니다.</h2>
<a href="loginpage.jsp">돌아가기</a>
<%
PreparedStatement pstmt = null;
try{
	String sql = "insert into projectdata(name,id,pw,position,email,sex,birth,location,balance,phone,grade)Values(?,?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, id);
	pstmt.setString(3, pw);
	pstmt.setString(4, position);
	pstmt.setString(5, email);
	pstmt.setString(6, sex);
	pstmt.setString(7, birth);
	pstmt.setString(8, location);
	pstmt.setString(9, balance);
	pstmt.setString(10, phone);
	pstmt.setString(11, grade);
/* 	out.println("테이블 삽입 완료"); */
	pstmt.executeUpdate();
}catch(SQLException e){
	out.println("오류 발생");
	out.println("SQLException: " + e.getMessage());
}finally{
	if(conn !=null)conn.close();
	if(pstmt !=null)pstmt.close();
}


%>
</body>
</html>
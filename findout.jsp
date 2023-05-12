<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<center>
<p><h2>아이디/패스워드 찾기</h2> 
<p>아이디를 찾고 싶으시면 아이디 찾기를
<p>비밀번호를 잊으셨다면 비밀번호 찾기를 눌러주세요.
<form name="findId" action="findId.jsp" method="post">
<p> <input type="submit" value="아이디찾기">
</form>
<form name="findPw" action="findPw.jsp" method="post">
<p> <input type="submit" value="패스워드찾기">
</form>
</center>
</body>
</html>
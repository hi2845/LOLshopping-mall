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
<p><h3>아이디와 비밀번호를 입력해주세요. </h3>

<form name="enterForm" action="mainPage.jsp" method="post">
<p>아이디(id): <input type="text" name="id">
<p>비밀번호(password): <input type="text" name="pw">
<input type="submit" value="확인">
</form>

<form name="findoutForm" action="findout.jsp" method="post">
<input type="submit" value="회원정보찾기"> 
</form>
<form name="registerForm" action="register_code.jsp" method="post">
<input type="submit" value="회원가입">
</form>
</center>
</body>
</html>
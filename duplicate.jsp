<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function idCheck(){
       /// alert("이 아이디는 사용하실 수 없습니다.");
        window.opener.document.getElementById('id').value 
        = window.document.getElementById('id').value;
        document.dupleForm.submit();
}
        </script>
</head>
<body>
<h1>아이디를 입력해주세요.</h1>
<form name='dupleForm' action="duplicate_process.jsp">
    아이디: <input type='text' name='id' id='id'>
<!--     <input type='submit' value='중복검사'> -->
    <input type='button' value='중복검사' onclick="idCheck()">
    <p>아이디는 4~12자로 입력해주시고, 공백은 사용불가, 영어 소문자와 숫자로 조합해주세요.</p>
</form>
</body>
</html>
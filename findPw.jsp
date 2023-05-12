<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<p><h2>비밀번호 찾기</h2>
<form name = "findPwForm" method ="post" action="resultPw.jsp">
<p>이름: <input type="text" name="name">
<p>아이디: <input type="text" name="id">
<p>전화번호:
<select name="phone1">
<option value="010">010</option>
<option value="011">011</option>
<option value="012">012</option>
<option value="013">013</option>
<option value="019">019</option>
</select>
- <input type="text" name="phone2" maxlength="4" size="4">
- <input type="text" name="phone3" maxlength="4" size="4">

<p>생년월일:
<select name="birthYear">

<%
int currentYear = java.time.LocalDate.now().getYear(); 
for(int year = currentYear; year>=1950; year--){
%>	
<option value="<%=year%>"><%=year%></option>
 <% } %> 

</select>년
<select name="birthMonth">
<% for(int i = 1; i <=12; i++){
%>
<option value="<%=i < 10 ? "0"+i : i %>"><%=i < 10 ? "0"+i : i %></option>
<% }%>

</select>월
<select name="birthDay">
<%
for(int j=1; j<=31; j++){
%>
<option value="<%=j < 10 ? "0"+j : j%>"> <%=j < 10 ? "0"+j : j %></option>	
<%}%>
</select>일

<p> <input type="submit" value="확인">
</form>
</body>
</html>
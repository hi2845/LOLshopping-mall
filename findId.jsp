<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Find Id</title>
</head>
<body>
	<p>
	<h3>아이디 찾기</h3>
	<p>
	<form name="FindIdForm" action="resultId.jsp" method="post">
		이름 : <input type="text" name="name">
	
	<p>
	<h2>핸드폰 번호:</h2>
	<select name="phone1">
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="012">012</option>
		<option value="017">017</option>
		<option value="019">019</option>
	</select> -
	<input name="phone2" type="text" maxlength="4" size="4"> -
	<input name="phone3" type="text" maxlength="4" size="4">
	<p>
	<h2>생년월일</h2>
	<select name="birthYear">
		<% 
        int currentYear = java.time.LocalDate.now().getYear(); // 현재 연도를 가져옴
        for(int year = currentYear; year >=1950; year--) {
    %>
		<option value="<%= year %>"><%= year %>
		</option>
		<% } %>
	</select> 년
	<select name="birthMonth">
		<%
	for(int j = 1;  j <=12; j++){
%>
		<option value="<%=(j < 10 ? "0" +j  : j )%>"> <%=(j < 10 ? "0" + j: j)%></option>
		<% } %>

	</select> 월
	<select name="birthDay">
	<% 
	for(int z = 1; z <32; z++){
	%>
		<option value="<%=z <10 ? "0"+z : z %>"><%=z<10 ? "0"+z : z %>
	</option>
	<%} %>
	</select>일
	<input type="submit" value="확인"/>
</form>
</body>
</html>
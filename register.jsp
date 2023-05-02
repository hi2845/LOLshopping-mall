<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="dbconn.jsp"%>

<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#ctxt {
	color: blue;
} /* id명이 ctxt인 요소의 글자들을 파란색으로 처리함 */
.p {
	border: 10px groove #06c;
}
</style>
</head>
<body>

	<h3>
		<p id="ctxt">회원가입창
	</h3>
	<form action="register_process.jsp" name="form" method="post">
		<p>
			이름 : <input type="text" name="name">
		</p>
		<p>
			아이디 : <input type="text" name="id"><input type="button"
				onclick="check()" value="중복검사하기">
		<p>
			비밀번호 : <input type="text" name="pw">

		</p>
		<p>
			포지션 : <input type="radio" name="position" value="탑">탑 <input
				type="radio" name="position" value="미드">미드 <input
				type="radio" name="position" value="정글">정글 <input
				type="radio" name="position" value="원딜">원딜 <input
				type="radio" name="position" value="서폿">서폿

		</p>

		<p>
			이메일 : <input type="text" name="email1" size="15"> @<select
				name="email2">
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option>
				<option value="google.com">google.com</option>

			</select>
		<p>
			성별 : <input type="radio" name="sex" value="남성" checked>남성 <input
				type="radio" name="sex" value="여성">여성
		<p>
			생년월일 : <select name="birthYear">
				<%
				int currentyear = java.time.LocalDate.now().getYear();
				for (int year = currentyear; year >= 1950; year--) {
				%>
				<option value="<%=year%>">
					<%=year%>
					<%
					}
					%>
				
			</select> 년 <select name="birthMonth">
				<%
				for (int i = 1; i <= 12; i++) {
				%>
				<option value="<%=(i < 10 ? "0" + i : i)%>"><%=(i < 10 ? "0" + i : i)%></option>
				<%
				}
				%>
			</select>월 <select name="birthDay">
				<%
				for (int j = 1; j < 32; j++) {
				%>
				<option value="<%=(j < 10 ? "0" + j : j)%>"><%=(j < 10 ? "0" + j : j)%></option>
				<%
				}
				%>
			</select>일

		</p>
		<p>주소
		<p>
			<input type="text" id="postcode" placeholder="우편번호"> <input
				type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="address" placeholder="주소"><br> <input
				type="text" id="detailAddress" placeholder="상세주소"> <input
				type="text" id="extraAddress" placeholder="참고항목">

			<script
				src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				function execDaumPostcode() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

									// 각 주소의 노출 규칙에 따라 주소를 조합한다.
									// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									var addr = ''; // 주소 변수
									var extraAddr = ''; // 참고항목 변수

									//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
									if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
										addr = data.roadAddress;
									} else { // 사용자가 지번 주소를 선택했을 경우(J)
										addr = data.jibunAddress;
									}

									// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
									if (data.userSelectedType === 'R') {
										// 법정동명이 있을 경우 추가한다. (법정리는 제외)
										// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										if (data.bname !== ''
												&& /[동|로|가]$/g.test(data.bname)) {
											extraAddr += data.bname;
										}
										// 건물명이 있고, 공동주택일 경우 추가한다.
										if (data.buildingName !== ''
												&& data.apartment === 'Y') {
											extraAddr += (extraAddr !== '' ? ', '
													+ data.buildingName
													: data.buildingName);
										}
										// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										if (extraAddr !== '') {
											extraAddr = ' (' + extraAddr + ')';
										}
										// 조합된 참고항목을 해당 필드에 넣는다.
										document.getElementById("extraAddress").value = extraAddr;

									} else {
										document.getElementById("extraAddress").value = '';
									}

									// 우편번호와 주소 정보를 해당 필드에 넣는다.
									document.getElementById('postcode').value = data.zonecode;
									document.getElementById("address").value = addr;
									// 커서를 상세주소 필드로 이동한다.
									document.getElementById("detailAddress")
											.focus();
								}
							}).open();
				}
			</script>

		</p>
		<p>
			잔고 <input type="text" name="balance" value="0" readonly>(자동입력)
		</p>
		<p>연락처 :
		<p>
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="012">012</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> - <input type="text" maxlength="4" size="4" name="phone2"> -
			<input type="text" maxlength="4" size="4" name="phone3"> <input
				type="button" value="중복검사하기">
		</p>
		<p>
			회원등급<input type="text" name="grade" value="bronze" readonly>(자동입력)
		<p>
			<input type="submit" value="가입하기">
		</p>
		<p>
			<input type="reset" value="다시쓰기">
		</p>
	</form>
</body>
</html>
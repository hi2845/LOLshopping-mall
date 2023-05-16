<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
label {
  display: inline-block;
  width: 100px;
  margin-bottom: 10px;
}

input[type="text"], input[type="email"], input[type="password"] {
  width: 200px;
  padding: 5px;
  margin-bottom: 10px;
  border-radius: 5px;
  border: 1px solid #ccc;
}
</style>
</head>
<body>
	<%request.setCharacterEncoding("utf-8");%>
	<script type="text/javascript">
function check(input){
	var form = document.frm;
	var userId = form.id;
	var userName = form.name;
	var userPw = form.pw;
	var userRepw = form.re_pw;
	var userPhone1 = form.phone1;
	var userPhone2 = form.phone2;
	var userPhone3 = form.phone3;
	var userPhone = userPhone1 + userPhone2 + userPhone3;
	var userEmail1 = form.email1;
	var userEmail2 = form.email2;
	var userEmail = userEmail1 + userEmail2;
	var userdetailAddress = form.detailAddress
	var regExpName = /^[가-힣]*$/;
	var regExpId = /^[a-z0-9]*$/;
	var regExpPw = /^[a-zA-Z0-9!@#$%^&*()?_~]*$/;
	var regExpPhone= /^\d{3}-\d{3,4}-\d{4}$/;
	var regExpEmail= /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	let duplicateButton = document.getElementById('duplicateBtn');
	/* var result = document.getElementById("result"); */
if(userName.value == ""){
	alert("이름을 입력해주세요.");
	userName.focus();
	return false;
}else if(userName.value.indexOf(" ") != -1){
	alert("이름에 공백이 포함되어 있습니다. 다시 입력해주세요.")
	userName.focus();
	return false;
}else if(!regExpName.test(userName.value)){
	alert("이름은 한글만으로 입력해주세요.");
	userName.select();
	return false;
	
}else if(duplicateButton.disabled == false){
	alert("아이디 중복검사를 해주세요.")
	return false;
}else if(userId.value ==""){
	alert("아이디를 입력하세요.");
	 userId.focus();
	 return false;

}else if(userId.value.indexOf(" ") != -1){
	alert("아이디에 공백이 포함되어 있습니다. 다시 입력해주세요.");
	userId.focus();
	return false;
}
else if(userId.value.length < 4 || userId.value.length > 12){
	alert("아이디는 4~12자로 작성해주세요.");
	userId.focus();
	return false;
}else if(!regExpId.test(userId.value)){
	alert("아이디는 영어 소문자와 숫자만 입력 가능합니다.");
	userId.focus();
	return false;
}else if(userPw.value==""){
	alert("비밀번호를 입력하세요.");
	return false;

}else if(userPw.value.indexOf(" ") != -1){
	alert("비밀번호에 공백이 포함되어 있습니다. 다시 입력해주세요.");
	userPw.focus();
	return false;
}else if(!regExpPw.test(userPw.value)){
	alert("비밀번호는 숫자, 소문자, 특수문자로만 입력가능합니다.");
	return false;
}else if(userPw.value !== userRepw.value){
	alert("비밀번호와 비밀번호확인이 일치하지 않습니다. 다시입력해주세요.");
	return false;
}else if(!userPosition.value==""){
	alert("포지션을 선택해주세요.");
	return false;
}else if(!regExpEmail.test(userEmail.value)){
	alert("이메일을 확인해주세요.");
	return false;
}else if(userdetailAddress.value.indexOf(" ") != -1){
	alert("상세주소를 입력해주세요.");
	return false;
}else if(!regExpPhone.test(userPhone.value)){
	alert("연락처 번호를 확인해주세요.");
	return false;

	}
}
function duplicateCheck(){
	
	var child = window.open('duplicate.jsp','child', 'width=500, height=500');
	
	
	let duplicate = false;
	let duplicateButton = document.getElementById('duplicateBtn');
	if(duplicate){
		duplicateButton.disabled = false;
	}else{
		duplicateButton.disabled = true;
	}
}
function resetOn(){
	let duplicateButton = document.getElementById('duplicateBtn');
	let resetButton = document.getElementById('resetBtn')
	duplicateButton.disabled = false;
}
</script>
	<fieldset>
		<legend><h3>회원가입창</h3></legend>
	<form name="frm" method="post" action="register.jsp">
		<p id="ctxt">
		<label for = "name">이름
		<input type="text" name="name" placeholder ="이름을 입력해주세요.">
		
		
			아이디 : <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." readonly> 
				<input type="button" id="duplicateBtn" value="중복검사하기" onclick="duplicateCheck()">
		<p>
			비밀번호 : <input type="password" name="pw"
				placeholder="비밀번호는 6~12자 이내로" size="35">
		<p>
			비밀번호 확인: <input type="password" name="re_pw">

		<p>
			포지션 : <input type="radio" name="position" value="탑">탑 <input
				type="radio" name="position" value="미드">미드 <input
				type="radio" name="position" value="정글">정글 <input
				type="radio" name="position" value="원딜">원딜 <input
				type="radio" name="position" value="서폿">서폿


		<p>
			이메일 : <input type="text" name="email1" size="15">@<select
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

		<p>주소
		<p>
			<input type="text" name="postcode" id="postcode" placeholder="우편번호">
			<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" name="address" id="address" placeholder="주소"><br>
			<input type="text" name="detailAddress" id="detailAddress"
				placeholder="상세주소"> <input type="text" name="extraAddress"
				id="extraAddress" placeholder="참고항목">

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

		<!-- <p>
			잔고 <input type="text" name="balance" value="0" readonly>(자동입력) -->
			<input type="hidden" name="balance" value="0">
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
			<!-- 회원등급<input type="text" name="grade" value="bronze" readonly>(자동입력) -->
			<input type="hidden" name="grade" value="bronze">
			
			</fieldset>
		
		
			<input type="submit" value="가입하기" onclick="return check()">
	
			<input type="reset" value="다시쓰기" id="resetBtn" onclick="resetOn()">
		
	</form>
	</table>
</body>
</html>
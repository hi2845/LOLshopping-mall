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
} /* id���� ctxt�� ����� ���ڵ��� �Ķ������� ó���� */
.p {
	border: 10px groove #06c;
}
</style>
</head>
<body>

	<h3>
		<p id="ctxt">ȸ������â
	</h3>
	<form action="register_process.jsp" name="form" method="post">
		<p>
			�̸� : <input type="text" name="name">
		</p>
		<p>
			���̵� : <input type="text" name="id"><input type="button"
				onclick="check()" value="�ߺ��˻��ϱ�">
		<p>
			��й�ȣ : <input type="text" name="pw">

		</p>
		<p>
			������ : <input type="radio" name="position" value="ž">ž <input
				type="radio" name="position" value="�̵�">�̵� <input
				type="radio" name="position" value="����">���� <input
				type="radio" name="position" value="����">���� <input
				type="radio" name="position" value="����">����

		</p>

		<p>
			�̸��� : <input type="text" name="email1" size="15"> @<select
				name="email2">
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option>
				<option value="google.com">google.com</option>

			</select>
		<p>
			���� : <input type="radio" name="sex" value="����" checked>���� <input
				type="radio" name="sex" value="����">����
		<p>
			������� : <select name="birthYear">
				<%
				int currentyear = java.time.LocalDate.now().getYear();
				for (int year = currentyear; year >= 1950; year--) {
				%>
				<option value="<%=year%>">
					<%=year%>
					<%
					}
					%>
				
			</select> �� <select name="birthMonth">
				<%
				for (int i = 1; i <= 12; i++) {
				%>
				<option value="<%=(i < 10 ? "0" + i : i)%>"><%=(i < 10 ? "0" + i : i)%></option>
				<%
				}
				%>
			</select>�� <select name="birthDay">
				<%
				for (int j = 1; j < 32; j++) {
				%>
				<option value="<%=(j < 10 ? "0" + j : j)%>"><%=(j < 10 ? "0" + j : j)%></option>
				<%
				}
				%>
			</select>��

		</p>
		<p>�ּ�
		<p>
			<input type="text" id="postcode" placeholder="�����ȣ"> <input
				type="button" onclick="execDaumPostcode()" value="�����ȣ ã��"><br>
			<input type="text" id="address" placeholder="�ּ�"><br> <input
				type="text" id="detailAddress" placeholder="���ּ�"> <input
				type="text" id="extraAddress" placeholder="�����׸�">

			<script
				src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				function execDaumPostcode() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

									// �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
									// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
									var addr = ''; // �ּ� ����
									var extraAddr = ''; // �����׸� ����

									//����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
									if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
										addr = data.roadAddress;
									} else { // ����ڰ� ���� �ּҸ� �������� ���(J)
										addr = data.jibunAddress;
									}

									// ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
									if (data.userSelectedType === 'R') {
										// ���������� ���� ��� �߰��Ѵ�. (�������� ����)
										// �������� ��� ������ ���ڰ� "��/��/��"�� ������.
										if (data.bname !== ''
												&& /[��|��|��]$/g.test(data.bname)) {
											extraAddr += data.bname;
										}
										// �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
										if (data.buildingName !== ''
												&& data.apartment === 'Y') {
											extraAddr += (extraAddr !== '' ? ', '
													+ data.buildingName
													: data.buildingName);
										}
										// ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
										if (extraAddr !== '') {
											extraAddr = ' (' + extraAddr + ')';
										}
										// ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
										document.getElementById("extraAddress").value = extraAddr;

									} else {
										document.getElementById("extraAddress").value = '';
									}

									// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
									document.getElementById('postcode').value = data.zonecode;
									document.getElementById("address").value = addr;
									// Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
									document.getElementById("detailAddress")
											.focus();
								}
							}).open();
				}
			</script>

		</p>
		<p>
			�ܰ� <input type="text" name="balance" value="0" readonly>(�ڵ��Է�)
		</p>
		<p>����ó :
		<p>
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="012">012</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> - <input type="text" maxlength="4" size="4" name="phone2"> -
			<input type="text" maxlength="4" size="4" name="phone3"> <input
				type="button" value="�ߺ��˻��ϱ�">
		</p>
		<p>
			ȸ�����<input type="text" name="grade" value="bronze" readonly>(�ڵ��Է�)
		<p>
			<input type="submit" value="�����ϱ�">
		</p>
		<p>
			<input type="reset" value="�ٽþ���">
		</p>
	</form>
</body>
</html>
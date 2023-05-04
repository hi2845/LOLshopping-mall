<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�Խ��� �۾���</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<img src="img/LOL_CMS.jpg" alt="My Image"  width="1000" height="150">
		<h2>�Խ��� �۾���</h2>
		<form action="write.jsp" method="post">
			<div class="form-group">
				<label for="title">����</label> <input type="text"
					class="form-control" id="title" placeholder="���� �Է�(4-100)"
					name="title" maxlength="100" required="required" pattern=".{4,100}">
			</div>
			<div class="form-group">
				<label for="content">����</label>
				<textarea class="form-control" rows="5" id="content" name="content"
					placeholder="���� �ۼ�"></textarea>
			</div>
			<div class="form-group">
				<label for="writer">�ۼ���</label> <input type="text"
					class="form-control" id="writer" placeholder="�ۼ���(2��-10��)"
					name="writer">
			</div>
			<button type="submit" class="btn btn-default">���</button>
		</form>
	</div>
</body>
</html>


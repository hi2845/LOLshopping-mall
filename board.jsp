<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
div {
	width: 90%;
}
</style>
</head>
<body>
	<div class="container">
		<img src="img/board.jpg" alt="My Image" width="100%" height="15%">
		<h2>게시판 글쓰기</h2>
		<form action="boardsucess.jsp" method="post">
			<div class="form-group">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title" placeholder="제목 입력(4-100)"
					name="title" maxlength="100" required="required" pattern=".{4,100}">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" id="content" name="content"
					placeholder="내용 작성" style="resize: none;"></textarea>
			</div>
			<p>
			<div class="form-group">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" id="writer" placeholder="작성자(2자-10자)"
					required="required" name="writer">
			</div>
			<button type="submit" class="btn btn-default">등록</button>
		</form>
		<p>
		<form action="boardwrite.jsp" method="post">
			<button type="submit" class="btn btn-default">취소</button>
		</form>

	</div>
</body>
</html>

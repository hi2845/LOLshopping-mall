<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.time.LocalDateTime"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 32px;
	line-height: 40px;
	justify-content: space-around;
	padding: 0 3px;
	text-align: center;
	width: 150px;
}

.star-rating input {
	display: none;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: gold;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	-webkit-text-fill-color: #fff58c;
}
</style>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	int number = Integer.parseInt(request.getParameter("number"));
	 session.setAttribute("number", number);
	%>
	<div class="container">
		<img src="img/board.jpg" alt="My Image" width="100%" height="15%">
		<h2>게시판 글쓰기</h2>
		<form action="boardchangesuccess.jsp" method="post">
			<div class="form-group">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title" value="<%=title%>" name="title"
					maxlength="100" required="required" pattern=".{4,100}" readonly>
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" id="content" name="content"
					placeholder="내용 작성" style="resize: none;"></textarea>
			</div>
			<p>

				<label for="writer">별점</label>
			<div class="star-rating">
				<input type="radio" id="5-stars" name="rating" value="5" /> <label
					for="5-stars" class="star">&#9733;</label> <input type="radio"
					id="4-stars" name="rating" value="4" /> <label for="4-stars"
					class="star">&#9733;</label> <input type="radio" id="3-stars"
					name="rating" value="3" /> <label for="3-stars" class="star">&#9733;</label>
				<input type="radio" id="2-stars" name="rating" value="2" /> <label
					for="2-stars" class="star">&#9733;</label> <input type="radio"
					id="1-star" name="rating" value="1" /> <label for="1-star"
					class="star">&#9733;</label>
			</div>
			<p></p>
			<button type="submit" class="btn btn-default">등록</button>
		</form>
		<p>
		<form action="boardwrite.jsp" method="post">
			<button type="submit" class="btn btn-default">취소</button>
		</form>

	</div>

</body>
</html>

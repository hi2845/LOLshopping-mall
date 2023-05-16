<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="ch18.com.model.*"%>
<%@ page import="java.util.*"%>
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
<script type="text/javascript">
	function goToBoardChange(title, number) {
		var url = 'boardchange.jsp?title=' + encodeURIComponent(title)
				+ '&number=' + encodeURIComponent(number);
		location.href = url;
	}
</script>
<style>
div {
	width: 90%;
}

.star-rating {
	display: flex;
	font-size: 30px;
	line-height: 25px;
	justify-content: space-around;
	padding: 0 3px;
	text-align: center;
	width: 150px;
}

.star-rating .star {
	color: gray;
}

.star-rating .star.checked {
	color: gold;
}
</style>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	int Number = Integer.parseInt(request.getParameter("title"));
	String id = (String) session.getAttribute("userId");
	String title = "";
	String content = "";
	String writer = "";
	int ratingValue = 0;
	LocalDateTime date = LocalDateTime.now();
	%>
	<%@ include file="dbconn.jsp"%>
	<%
	int num = 1;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	try {

		stmt = conn.prepareStatement("select * from board where titlenum='" + Number + "'");

		rs = stmt.executeQuery();

		while (rs.next()) {
			title = rs.getString("title");
			content = rs.getString("content");
			writer = rs.getString("writer");
			ratingValue = Integer.parseInt(rs.getString("rating"));
			date = rs.getTimestamp("date").toLocalDateTime();
		}

	} catch (Exception excep) {
		excep.printStackTrace();
	} finally {
		try {
			if (rs != null)
		rs.close();
			if (stmt != null)
		stmt.close();
			if (conn != null)
		conn.close();
		} catch (Exception excep) {

		}
	}
	%>
	<%
	if (id == null) {
	%>
	<div style="text-align: right;">
		<h4>로그인 하러가기</h4>
		<h4>
			<a href="loginpage.jsp">로그인</a>
		</h4>
	</div>
	<%
	} else {
	%>
	<div style="text-align: right;">
		<h4><%=id%>님
		</h4>
		<h4>
			<a href="logoutboard.jsp">로그아웃</a>
		</h4>
	</div>
	<%
	}
	if (id == null) {
	id = "";
	}
	%>
	<div class="container">
		<img src="img/board.jpg" alt="My Image" width="100%" height="15%">
		<h2>게시글</h2>
		<table class="table table-hover" border="1">
			<tr>
				<th style="width: 15%; text-align: center;">제목</th>
				<th><%=title%></th>
			</tr>
			<tr>
				<th style="text-align: center;">글쓴이</th>
				<th><%=writer%></th>
			</tr>
			<tr>
				<th style="text-align: center;">내용</th>
				<th style="height: 200px;"><%=content%></th>
			</tr>
			<tr>
				<th style="text-align: center;">별점</th>
				<th>
					<div class="star-rating">
						<span class="star <%=ratingValue >= 1 ? "checked" : ""%>">&#9733;</span>
						<span class="star <%=ratingValue >= 2 ? "checked" : ""%>">&#9733;</span>
						<span class="star <%=ratingValue >= 3 ? "checked" : ""%>">&#9733;</span>
						<span class="star <%=ratingValue >= 4 ? "checked" : ""%>">&#9733;</span>
						<span class="star <%=ratingValue >= 5 ? "checked" : ""%>">&#9733;</span>
					</div>
				</th>
			</tr>
			<tr>
				<th style="text-align: center;">작성일</th>
				<th style="text-align: center;"><%=date.toLocalDate()%></th>
			</tr>

		</table>
		<form action="boardwrite.jsp" method="post">
			<%
			if (id.equals(writer)) {
			%>
			<button type="button" class="btn btn-default"
				onclick="goToBoardChange('<%=title%>', '<%=Number%>')">수정</button>
			<%
			}
			%>
			<button type="submit" class="btn btn-default">뒤로</button>
		</form>
	</div>
</body>
</html>
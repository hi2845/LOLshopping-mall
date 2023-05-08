<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ch18.com.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.*"%>
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

.board-title {
	display: inline-block;
	width: 300px;
	max-width: 300px;
	overflow: hidden;
	text-overflow: ellipsis;
	line-height: 0.9; /* 라인 높이 설정 */
	white-space: nowrap;
}

.board-writer {
	display: inline-block;
	width: 150px;
	max-width: 200px;
	overflow: hidden;
	text-overflow: ellipsis;
	line-height: 0.9; /* 라인 높이 설정 */
	
	white-space: nowrap;
}
</style>
</head>
<body>
	<%@ include file="dbcoon.jsp"%>
	<%
	int num = 1;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	List<BoardInfo> boards = new ArrayList<BoardInfo>();
	try {

		stmt = conn.prepareStatement("select * from board");
		rs = stmt.executeQuery();

		while (rs.next()) {
			BoardInfo board = new BoardInfo();
			board.setTitle(rs.getString("title"));
			board.setContent(rs.getString("content"));
			board.setWriter(rs.getString("writer"));
			board.setRegisterDateTime(rs.getTimestamp("date").toLocalDateTime());

			boards.add(board);
		}
		request.setAttribute("boards", boards);

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

	<div class="container">
		<img src="img/board.jpg" alt="My Image" width="90%" height="15%">
		<h2>게시판</h2>
		<br>
		<form action="board.jsp" method="post">
			<table class="table table-hover"  border="1">
				<%
				for (BoardInfo board : boards) {
				%><tr>
					<th>
						<%
						out.print("<p><span class='board-title'>" + num + "번 <a href='./boardshow.jsp?title=" + board.getTitle() + "'>"
								+ board.getTitle() + "</a></span>");
						out.print(" <span class='board-writer'>글쓴이 " + board.getWriter() + "</span>");
						out.print(" 작성일 " + board.getRegisterDateTime().toLocalDate());
						num++;
						}
						%>
					</th>
				</tr>
				<%

				%>
			</table>
			<p>
				<br>
				<button type="submit" class="btn btn-default">글쓰기</button>
		</form>
	</div>
</body>
</html>
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

		stmt = conn.prepareStatement("select * from board ORDER BY titlenum DESC");
		rs = stmt.executeQuery();

		while (rs.next()) {
			BoardInfo board = new BoardInfo();
			board.setTitle(rs.getString("title"));
			board.setNumber(rs.getInt("titlenum"));
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
		<img src="img/board.jpg" alt="My Image" width="100%" height="15%">
		<h2>게시판</h2>
		<br>
		<form action="board.jsp" method="post">
			<table class="table table-hover" width="90%" border="0">
				<thead>
					<tr>
						<th width="10%">번호</th>
						<th>제목</th>
						<th width="10%">글쓴이</th>
						<th width="10%">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
					// 한 페이지에 보여줄 데이터 개수
					int pageSize = 10;

					// 전체 데이터 개수와 전체 페이지 수 계산
					int totalCount = boards.size();
					int totalPageCount = (int) Math.ceil((double) totalCount / pageSize);

					// 현재 페이지 번호 파라미터 받기 (파라미터가 없으면 기본값 1로 설정)
					int currentPage = 1;
					if (request.getParameter("page") != null) {
						currentPage = Integer.parseInt(request.getParameter("page"));
					}

					// 현재 페이지에 해당하는 데이터 계산
					int start = (currentPage - 1) * pageSize;
					int end = Math.min(start + pageSize, totalCount);
					List<BoardInfo> currentBoards = boards.subList(start, end);
					%>
					<%
					for (BoardInfo board : currentBoards) {
					%>
					<tr>
						<td><a href="./boardshow.jsp?title=<%=board.getNumber()%>"><%=(currentPage - 1) * 10 + num %></a></td>
						<td><a href="./boardshow.jsp?title=<%=board.getNumber()%>"><%=board.getTitle()%></a>
						</td>
						<td><%=board.getWriter()%></td>
						<td><%=board.getRegisterDateTime().toLocalDate()%></td>
					</tr>
					<%
					num++;
					}
					%>

				</tbody>
			</table>
			<%
			if (currentPage > 1) {
				out.print("<a href='boardwrite.jsp?page=" + (currentPage - 1) + "'>&lt; 이전</a>");
			}
			for (int i = 1; i <= totalPageCount; i++) {
				if (i == currentPage) {
					out.print("<a class='active' href='boardwrite.jsp?page=" + i + "'>" + i + "&nbsp</a>");
				} else {
					out.print("<a href='boardwrite.jsp?page=" + i + "'>" + i + "&nbsp</a>");
				}
			}
			if (currentPage < totalPageCount) {
				out.print("<a href='boardwrite.jsp?page=" + (currentPage + 1) + "'>다음 &gt;</a>");
			}
			%>
			<p>
				<br>
				<button type="submit" class="btn btn-default">글쓰기</button>
			</p>
		</form>
	</div>
</body>
</html>
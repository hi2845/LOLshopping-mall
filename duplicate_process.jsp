<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="dbconn.jsp"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
/* function checkDuplicate() {
	  // 입력된 아이디 가져오기
	  var id = opener.document.getElementById('id').value;
	  
  */
</script>


<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String DBid = "";
PreparedStatement pstmt = null;
ResultSet rs = null;
try {
    pstmt = conn.prepareStatement("SELECT id FROM projectdata WHERE id = ?");
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();
    if (rs.next()) {
        DBid = rs.getString("id");
%>       
        <script type="text/javascript">
        alert("이 아이디는 사용하실 수 없습니다.");
        /* window.opener.document.getElementById('id').value = ""; */
        history.go(-1);
        </script>
<% 
        }else{
%>
        	<script type="text/javascript">       
        	//window.opener.document.getElementById('id').value = id;
        	//window.opener.document.getElementById('id').value = "qqqq";
        	alert("사용가능합니다.");
        	///alert(document.getElementById('id').value);
      	  
            window.close();
        	</script>
 <%
        }

} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (rs != null) rs.close();
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
}
%>
 
</body>
</html>
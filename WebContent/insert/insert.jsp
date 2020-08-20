<%@ page contentType="text/html; charset=utf-8"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>

<%
	request.setCharacterEncoding("utf-8");

String memberID = request.getParameter("memberID");
String password = request.getParameter("password");
String name = request.getParameter("name");
String email = request.getParameter("email");

Class.forName("com.mysql.jdbc.Driver");

Connection conn = null;
PreparedStatement pstmt = null;

try {
	String jdbcDriver = "jdbc:mysql://localhost:3306/forjsp?" + "useUnicode=true&characterEncoding=utf8";
	String dbUser = "root";
	String dbPass = "rootroot";

	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	pstmt = conn.prepareStatement("insert into MEMBER values (?, ?, ?, ?)");
	pstmt.setString(1, memberID);
	pstmt.setString(2, password);
	pstmt.setString(3, name);
	pstmt.setString(4, email);

	pstmt.executeUpdate();
} finally {
	if (pstmt != null)
		try {
	pstmt.close();
		} catch (SQLException ex) {
		}
	if (conn != null)
		try {
	conn.close();
		} catch (SQLException ex) {
		}
}
%>
<html>
<head>
<title>삽입</title>
</head>
<body>
<script>
	alert("UserList에 새로운 사용자 추가 성공");
	window.location = '/chap14/index.jsp';
</script>

</body>
</html>

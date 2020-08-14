<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%
	String user_id = request.getParameter("userID");
String user_password = request.getParameter("userPassword");//
%>
<html>
<head>
<title>회원 정보</title>
</head>
<body>

	<%
		Class.forName("com.mysql.jdbc.Driver");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/forjsp?" + "useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPass = "rootroot";
		String query = "select * from member where memberid = '" + user_id + "' and password = '" + user_password + "'";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();

		rs = stmt.executeQuery(query);
		if (rs.next()) {
			
			response.sendRedirect("../index.jsp");
	%>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><%=user_id%></td>
		</tr>
		<tr>
			<td>암호</td>
			<td><%=rs.getString("password")%></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=rs.getString("name")%></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=rs.getString("email")%></td>
		</tr>
	</table>
	<%
		} else {
	%>
	<%=user_id%>에 해당하는 정보가 존재하지 않습니다.
	<%
		}
	} catch (SQLException ex) {
	%>
	에러 발생:
	<%=ex.getMessage()%>
	<%
		} finally {
	if (rs != null)
		try {
			rs.close();
		} catch (SQLException ex) {
		}
	if (stmt != null)
		try {
			stmt.close();
		} catch (SQLException ex) {
		}
	if (conn != null)
		try {
			conn.close();
		} catch (SQLException ex) {
		}
	}
	%>

</body>
</html>

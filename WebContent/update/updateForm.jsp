<%@ page contentType = "text/html; charset=utf-8" %>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
<head>
<%
	if (session.getAttribute("user_id") == null) {
%>
<script>
	window.location = '/chap14/login/loginForm.jsp';
</script>
<%
	}
%>
<title>이름 변경폼</title>
</head>
<%
	String memberID = request.getParameter("memberID");
%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/forjsp?" +
							"useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPass = "rootroot";
		String query = 
		   "select * from MEMBER where MEMBERID = '"+memberID+"'";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		
		rs = stmt.executeQuery(query);
		if( rs.next() ) {
%>
<body>

	<form action="/chap14/update/update.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberID" size="10" value="<%=rs.getString("memberid") %>"></td>
				<td>이름</td>
				<td><input type="text" name="name" size="10"  value="<%=rs.getString("name") %>"></td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="변경"></td>
			</tr>
		</table>
	</form>
</body>

<%
		} else {
%>
<%= memberID %>에 해당하는 정보가 존재하지 않습니다.
<%
		}
	} catch(SQLException ex) {
%>
에러 발생: <%= ex.getMessage() %>
<%
	} finally {
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
%>
</html>

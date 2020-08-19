<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
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

	PreparedStatement pstmt = null;

	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/forjsp?" + "useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPass = "rootroot";
		String query = "select * from member where memberid = '" + user_id + "' and password = '" + user_password + "'";
		/* conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

		stmt = conn.createStatement(); */
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		pstmt = conn.prepareStatement("select * from member where memberid = ? and password = ?");
		pstmt.setString(1, user_id);
		pstmt.setString(2, user_password);

		rs = pstmt.executeQuery();
		/* rs = pstmt.executeQuery(query); */
		if (rs.next()) {
			
			if(user_id.equals(rs.getString("memberid")) && user_password.equals(rs.getString("password")))
			{
				session.setAttribute("user_id", user_id);
				session.setAttribute("user_pw", user_password);
				response.sendRedirect("../index.jsp");
			} else if (user_id.equals(rs.getString("memberid"))) {
				out.println("<script>alert('비밀번호가 틀렸습니다.'); history.back();</script>");
			} else if (user_password.equals(rs.getString("password"))) {
				out.println("<script>alert('아이디가 틀렸습니다.'); history.back();</script>");
			} else {
				out.println("<script>alert('아이디와 비밀번호가 틀렸습니다.'); history.back();</script>");
			}
	%>
	<%
		} else {
	%>

	<script>
		alert("로그인 실패");
		window.location = 'loginForm.jsp';
	</script>


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

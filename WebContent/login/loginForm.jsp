<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<script type="text/javascript">
	var text1 = "123";
	function event123() {
		text1 = document.getElementById("user_ID").value;
		if (text1.includes("-")) {
			alert("인젝션시도하지마라");
		}
	}
</script>
</head>
<body>
	<%
		if (session.getAttribute("user_id") == null) { //세션이 설정되지 않을 경우
	%>
	<form action="/chap14/login/login.jsp" method="post" id="sample_form">
		ID : <input type="text" name="userID" size="20" id="user_ID"> Password : <input type="password" name="userPassword" size="20"> <input type="submit" value="로그인" onclick="event123();">
	</form>
	<%
		}
		else{
			%>
			<script>
		window.location = '../index.jsp?userID='+session.getAttribute("user_id");
	</script>
			<% 
		}
	%>
</body>
</html>
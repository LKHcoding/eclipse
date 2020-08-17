<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>

<script>
var text1 = document.getElementById("userID").value;

if(text1.indexOf("-") != -1){
	alert("인젝션시도하지마라");
}
</script>

</head>
<body>
	<form action="/chap14/login/login.jsp" method="post">
		ID : <input type="text" name="userID" size="20"> Password : <input
			type="password" name="userPassword" size="20"> <input
			type="submit" value="로그인">
	</form>
</body>
</html>
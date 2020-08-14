<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
	String memberID = request.getParameter("userID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main page</title>
</head>
<body>
<button onclick="location.href='viewMemberList.jsp'">전체사용자보기</button>
<button onclick="location.href='viewMember.jsp'">유저검색</button>
<button onclick="location.href='insert/insertForm.jsp'">추가</button>
<button onclick="location.href='update/updateForm.jsp'">수정</button>
<%=memberID %>님 환영합니다.


</body>
</html>
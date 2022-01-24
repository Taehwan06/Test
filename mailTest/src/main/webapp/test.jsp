<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mailTest.MailTest" %>
<%@ page import="java.sql.*" %>
<%@ page import="boardWeb.vo.*" %>
<%@ page import="boardWeb.util.*" %>
<%
	//MailTest.gmailSend();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form name="frm" action="form_result.jsp" method="post" enctype="multipart/form-data">
		<input typ="text" name="writer">
		<textarea name="content"></textarea>
		<input type="file" name="uploadFile">
		<input type="submit" name="submit" value="전송">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.sql.*" %>
<%@ page import="boardWeb.vo.*" %>
<%@ page import="boardWeb.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String systemName = request.getParameter("systemName");
	String originalName = request.getParameter("originalName");
	String content = request.getParameter("content");

	Connection conn = null;
	PreparedStatement psmt = null;
	
	try{
		conn = DBManager.getConnection();
		
		String sql = "insert into image(IIDX,SYSTEMNAME,ORIGINALNAME,BIDX,MIDX) values(iidx_seq.nextval,?,?,1,31)";
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1,systemName);
		psmt.setString(2,originalName);
		int result = psmt.executeUpdate();
		
		response.sendRedirect("list.jsp?content="+content);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBManager.close(psmt,conn);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
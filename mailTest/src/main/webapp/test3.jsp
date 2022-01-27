<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardWeb.vo.*"%>
<%@ page import="boardWeb.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.json.simple.*"%>
<%
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	try{
		conn = DBManager.getConnection();
		
		String sql = "SELECT * from (SELECT COUNT(*) c FROM board WHERE midx=1)";
		
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
	
	int cnt = 0;	
		
	if(rs.next()){
		cnt = rs.getInt("c");
	}
		
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>	
</style>
<script>
	console.log("val="+<%=rs.getInt("c")%>);	

</script>
</head>
<body>
	<%=cnt %>
	
</body>
</html>

<%	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBManager.close(psmt,conn,rs);
	}
	
	
%>
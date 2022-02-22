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
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	try{
		conn = DBManager.getConnection();
		
		String sql = "SELECT * FROM (SELECT ROWNUM r, a.* FROM (SELECT * FROM RANKING_SAMPLE ORDER BY ctotal) a)";
		
		//psmt = conn.prepareStatement(sql);
		//rs = psmt.executeQuery();
				

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
        height: 2000px;
        background-image: url("<%=request.getContextPath() %>/upload/back.png");
        background-repeat : no-repeat;
        background-size : contain;
        background-position: center bottom;
      }
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>순위</th>
				<th>국가</th>
				<th>총점</th>
			</tr>
		</thead>
		<tbody>
		<% 	while(rs.next()){ %>
			<tr>
				<td><%=rs.getInt("r") %></td>
				<td><%=rs.getString("cname") %></td>
				<td><%=rs.getInt("ctotal") %></td>
			</tr>		
		<%-- 	<tr>
				<td><%=rs.getString("systemname")%></td>
				<td><img src="<%=request.getContextPath() %>/upload/<%=rs.getString("systemname")%>"></td>				
			</tr> --%>
			
		<%	}	%>
		</tbody>
	</table>
	<img src="<%=request.getContextPath() %>/upload/213.png">
	
</body>
</html>
<%
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBManager.close(psmt,conn,rs);
		if(rs2!=null){
			rs2.close();
		}
	}
%>
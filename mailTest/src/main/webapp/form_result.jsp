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

    final String saveFolder = "D:/workspace/upload";
    final String encoding = "UTF-8";
	final int maxSize = 10*1024*1024;		//100MB 제한
	
	String systemName = "";
	String originalName = "";
	String type = "";
	int len = 0;
	String writer = "";
	String content = "";
	
	try{
		MultipartRequest multi = new MultipartRequest(request,saveFolder,maxSize,encoding,new DefaultFileRenamePolicy());
		
		systemName = multi.getFilesystemName("uploadFile");
		originalName = multi.getOriginalFileName("uploadFile");
		
		
		
		type = multi.getContentType("uploadFile");
		File f = multi.getFile("uploadFile");
		
		if(f!=null){
			len = (int)f.length();
		}
		writer = multi.getParameter("writer");
		content = multi.getParameter("content");
		
		response.sendRedirect("insertOk.jsp?systemName="+systemName
				+"&originalName="+originalName);
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String value1 = request.getParameter("value1");
	String value2 = request.getParameter("value2");
	String cal = request.getParameter("cal");
	double result = 0;
	
	if(cal.equals("plus")){
		result = Double.parseDouble(value1) + Double.parseDouble(value2);
	}else if(cal.equals("minus")){
		result = Double.parseDouble(value1) - Double.parseDouble(value2);
	}else if(cal.equals("multi")){
		result = Double.parseDouble(value1) * Double.parseDouble(value2);
	}else if(cal.equals("division")){
		result = Double.parseDouble(value1) / Double.parseDouble(value2);
	}else{
		result = 0;
	}
	
	out.print(result);
	
%>
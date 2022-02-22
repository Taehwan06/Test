<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
		</tbody>
	</table>
	<img src="<%=request.getContextPath() %>/upload/test.png">
	
</body>
</html>
<
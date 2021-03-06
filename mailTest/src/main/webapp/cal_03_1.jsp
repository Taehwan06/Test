<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
	<style>
		form{
			border: 1px solid black;
			width: 600px;
			height: 300px;
			margin: auto;
			padding: 30px;
		}
		h2{
			text-align: center;
			margin-bottom: 30px;
		}
		div{
			margin: 20px;
		}
		#calDiv,#buttonDiv{
			padding-left: 80px;
		}
		#minus, #multi, #division{
			margin-left: 10px;
		}
		#submit, #calcel{
			width:  130px;
			margin-right: 10px;
		}
	</style>
	<script>
		
		function submitFn(){
			$.ajax({
				url: "cal_03.jsp",
				type: "post",
				data: $("#calFrm").serialize(),
				success: function(data){
					var result = data.trim();
					console.log(result);
					$("#result").val(result);
				}
			});
		}
	</script>
</head>
<body>
	<form name="calFrm" id="calFrm">
		<h2>계산기</h2>
		<div id="value1Div">
			입력값 1 : 
			<input type="number" name="value1" id="value1">
		</div>
		<div id="value2Div">
			입력값 2 : 
			<input type="number" name="value2" id="value2">
		</div>
		<div id="calDiv">
			<input type="radio" name="cal" id="plus" value="plus">덧셈
			<input type="radio" name="cal" id="minus" value="minus">뺄셈
			<input type="radio" name="cal" id="multi" value="multi">곱셈
			<input type="radio" name="cal" id="division" value="division">나눗셈
		</div>
		<div id="buttonDiv">
			<input type="button" value="계산하기" name="submit" id="submit" onclick="submitFn()">
			<input type="button" value="초기화" name="calcel" id="calcel" onclick="calcelFn()">
		</div>
		<div id="resultDiv">
			계산결과 : 
			<input type="text" name="result" id="result">
		</div>
	</form>

</body>
</html>
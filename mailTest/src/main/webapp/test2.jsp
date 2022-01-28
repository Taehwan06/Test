<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="boardWeb.vo.*"%>
<%@ page import="boardWeb.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>

<style>
@charset "UTF-8";
*{
	margin:0px;
	padding:0px;
}
body{
	width: 800px;	
	min-height: 500px;
	margin: auto;
}
header{
	height:70px;			
	text-align:center;
	position:relative;
}
header>h2{
	padding:20px;
}
header>h2>a{
	text-decoration: none;
	color: black;
}
header>h2>a:hover{
	color: skyblue;
}
nav{
	height: 30px;
	width: 800px;
	background: #EEEEEE;			
	text-align: center;
}		
nav span{
	background: #EEEEEE;	
	color: black;
	height: 27px;
	width: 100px;
	padding-top: 3px;			
	display: inline-block;			
	text-align: center;
}
nav span:hover{
	background: gray;
	color: skyblue;
	cursor: pointer;
}
section{			
	height:70%;
	text-align: center;
	padding: 10px 0px;
	margin: auto;		
}
form{
	margin-top: 70px;
}		
.headSpan{
	width: 120px;
	height: 25px;
	font-size: 15px;
	padding-top: 7px;
	display: inline-block;
	border-right: 1px solid lightgray;
	text-align: center;
}
.border{
	width: 400px;
	border: 1px solid lightgray;
	display: inline-block;
	border-radius: 5px;
}
section input{
	width: 265px;
	height: 32px;
	border: none;
	font-size: 15px;			
}		
.footSpan{
	width: 400px;
	height: 15px;
	color: red;
	margin-bottom: 20px;
	display: inline-block;
	padding-left: 50px;
	text-align: center;
	visibility: visible;
	font-size: 11px;
	visibility: hidden;
}
section input[type=button]{	
	background: lightgray;
	border-radius: 5px;		
}		
section input[name=joinSubmit]{
	width: 400px;
	margin-bottom: 100px;
}
section input[type=button]:hover{
	background: skyblue;
	cursor: pointer;
}
.phone{
	width: 77px;
	text-align: center;
}
#birth{
	width: 395px;
	padding-right: 5px;
}
.birth{
	width: 67px;
	text-align: center;
}
#last{
	margin-top: 30px;
}
input::placeholder{
	font-size: 11px;
}
footer{
	height:50px;
	border-top:1px solid gray;
	text-align: center;
}
footer div{
	margin: 15px;
}
</style>
<script>
var idcheck = false;
function onBlurFn(obj){
	var value = obj.value;
	var span = obj.parentElement.parentElement.getElementsByTagName("span")[1];
	var id = obj.id;
	var reg = "";
	var passValue = document.getElementById("pass").value;
	var ph1Val = document.getElementById("phone1").value;
	var ph2Val = document.getElementById("phone2").value;
	var ph3Val = document.getElementById("phone3").value;
	var ph1Reg = /\d{2,3}/;
	var ph2Reg = /\d{3,4}/;
	var ph3Reg = /\d{4}/;
	var bir1Val = document.getElementById("birth1").value;
	var bir2Val = document.getElementById("birth2").value;
	var bir3Val = document.getElementById("birth3").value;
	var bir1Reg = /\d{4}/;
	var bir2Reg = /\d{1,2}/;
	var bir3Reg = /\d{1,2}/;

	if(id =="id"){			
		reg = /^[a-z]+[a-z0-9]{5,19}$/g;
		$.ajax({
			url: "idcheck.jsp",			
			type: "post",
			data: "value="+value,
			success: function(data){				
				var json = JSON.parse(data.trim());				
				if(json.length != 0){
					span.style.visibility = "visible";
					span.textContent = "중복된 아이디입니다";
					span.style.color = "red";
					idcheck = false;
				}else{
					if(value == ""){
						span.style.visibility = "visible";
						span.textContent = "아이디를 입력하세요";
						span.style.color = "red";
						idcheck = false;
					}else if(!reg.test(value)){
						span.style.visibility = "visible";
						span.textContent = "영문으로 시작하는 6~20자리의 영문or숫자만 가능합니다";
						span.style.color = "red";
						idcheck = false;
					}else{
						span.style.visibility = "visible";
						span.textContent = "사용 가능한 아이디입니다";
						span.style.color = "green";
						idcheck = true;
					}
				}
			}
		});
	}else if(id =="pass"){			
		reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{6,20}$/;
		if(value == ""){
			span.style.visibility = "visible";
			span.textContent = "비밀번호를 입력하세요";
			span.style.color = "red";
		}else if(!reg.test(value)){
			span.style.visibility = "visible";
			span.textContent = "영문, 숫자, 특수문자를 모두 포함한 6~20자리만 가능합니다";
			span.style.color = "red";
		}else{
			span.style.visibility = "visible";
			span.textContent = "사용 가능한 비밀번호입니다";
			span.style.color = "green";
		}
	}else if(id =="passcheck"){	
		if(value == ""){
			span.style.visibility = "visible";
			span.textContent = "비밀번호를 다시 입력하세요";
			span.style.color = "red";
		}else if(value != passValue){
			span.style.visibility = "visible";
			span.textContent = "비밀번호가 다릅니다";
			span.style.color = "red";
		}else{
			span.style.visibility = "visible";
			span.textContent = "비밀번호가 일치합니다";
			span.style.color = "green";
		}
	}else if(id =="name"){
		reg = /[가-힣]{2,20}$/;
		if(value == ""){
			span.style.visibility = "visible";
			span.textContent = "이름을 입력하세요";
			span.style.color = "red";
		}else if(!reg.test(value)){
			span.style.visibility = "visible";
			span.textContent = "2~20자 한글만 입력 가능합니다";
			span.style.color = "red";
		}else{
			span.style.visibility = "visible";
			span.textContent = "올바르게 입력하셨습니다";
			span.style.color = "green";
		}
	}else if(id =="email"){
		reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if(value == ""){
			span.style.visibility = "visible";
			span.textContent = "이메일 주소를 입력하세요";
			span.style.color = "red";
		}else if(!reg.test(value)){
			span.style.visibility = "visible";
			span.textContent = "이메일 주소 형식이 올바르지 않습니다";
			span.style.color = "red";
		}else{
			span.style.visibility = "visible";
			span.textContent = "올바르게 입력하셨습니다";
			span.style.color = "green";
		}
	}

	if(id =="phone1"){
		if(ph1Reg.test(ph1Val) && ph2Reg.test(ph2Val) && ph3Reg.test(ph3Val)){
			span.style.visibility = "visible";
			span.textContent = "올바르게 입력하셨습니다";
			span.style.color = "green";
		}else{
			span.style.visibility = "visible";
			span.textContent = "연락처를 올바르게 입력해주세요";
			span.style.color = "red";
		}
	}
	if(id =="phone2"){
		if(ph1Reg.test(ph1Val) && ph2Reg.test(ph2Val) && ph3Reg.test(ph3Val)){
			span.style.visibility = "visible";
			span.textContent = "올바르게 입력하셨습니다";
			span.style.color = "green";
		}else{
			span.style.visibility = "visible";
			span.textContent = "연락처를 올바르게 입력해주세요";
			span.style.color = "red";
		}
	}
	if(id =="phone3"){
		if(ph1Reg.test(ph1Val) && ph2Reg.test(ph2Val) && ph3Reg.test(ph3Val)){
			span.style.visibility = "visible";
			span.textContent = "올바르게 입력하셨습니다";
			span.style.color = "green";
		}else{
			span.style.visibility = "visible";
			span.textContent = "연락처를 올바르게 입력해주세요";
			span.style.color = "red";				
		}
	}

	if(id =="birth1"){			
		if(bir1Reg.test(bir1Val) && bir2Reg.test(bir2Val) && bir3Reg.test(bir3Val) 
		&& bir1Val!="0000" && bir2Val!="0" && bir2Val!="00" && bir3Val!="0" && bir3Val!="00" 
		&& parseInt(bir2Val)<=12 && parseInt(bir3Val)<=31){
			span.style.visibility = "visible";
			span.textContent = "올바르게 입력하셨습니다";
			span.style.color = "green";
		}else if(value == "0000"){
			span.style.visibility = "visible";
			span.textContent = "0은 입력하실 수 없습니다";
			span.style.color = "red";
		}else{
			span.style.visibility = "visible";
			span.textContent = "생년월일을 올바르게 입력해주세요";
			span.style.color = "red";
		}
	}
	if(id =="birth2"){			
		if(bir1Reg.test(bir1Val) && bir2Reg.test(bir2Val) && bir3Reg.test(bir3Val) 
		&& bir1Val!="0000" && bir2Val!="0" && bir2Val!="00" && bir3Val!="0" && bir3Val!="00" 
		&& parseInt(bir2Val)<=12 && parseInt(bir3Val)<=31){
			span.style.visibility = "visible";
			span.textContent = "올바르게 입력하셨습니다";
			span.style.color = "green";
		}else if(value == "0" || value == "00"){
			span.style.visibility = "visible";
			span.textContent = "0은 입력하실 수 없습니다";
			span.style.color = "red";
		}else if(parseInt(value)>12){
			span.style.visibility = "visible";
			span.textContent = "출생월은 12 이하로 입력하세요";
			span.style.color = "red";
		}else{
			span.style.visibility = "visible";
			span.textContent = "생년월일을 올바르게 입력해주세요";
			span.style.color = "red";
		}
	}
	if(id =="birth3"){
		if(bir1Reg.test(bir1Val) && bir2Reg.test(bir2Val) && bir3Reg.test(bir3Val) 
		&& bir1Val!="0000" && bir2Val!="0" && bir2Val!="00" && bir3Val!="0" && bir3Val!="00" 
		&& parseInt(bir2Val)<=12 && parseInt(bir3Val)<=31){
			span.style.visibility = "visible";
			span.textContent = "올바르게 입력하셨습니다";
			span.style.color = "green";
		}else if(value == "0" || value == "00"){
			span.style.visibility = "visible";
			span.textContent = "0은 입력하실 수 없습니다";
			span.style.color = "red";
		}else if(parseInt(value)>31){
			span.style.visibility = "visible";
			span.textContent = "출생일은 31 이하로 입력하세요";
			span.style.color = "red";
		}else{
			span.style.visibility = "visible";
			span.textContent = "생년월일을 올바르게 입력해주세요";
			span.style.color = "red";
		}
	}
}

function joinSubmitFn(){
	var result = true;

	var value = document.getElementById("id").value;
	var span = document.getElementById("idSpan");
	var reg = /^[a-z]+[a-z0-9]{5,19}$/g;
		
	if(idcheck == false){
		result = false;
	}

	value = document.getElementById("pass").value;
	span = document.getElementById("passSpan");
	reg = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{6,20}$/;
	if(value == ""){
		span.style.visibility = "visible";
		span.textContent = "비밀번호를 입력하세요";
		span.style.color = "red";
		result = false;
	}else if(!reg.test(value)){
		span.style.visibility = "visible";
		span.textContent = "영문, 숫자, 특수문자를 모두 포함한 6~20자리만 가능합니다";
		span.style.color = "red";
		result = false;
	}else{
		span.style.visibility = "hidden";
		span.textContent = "";
	}

	value = document.getElementById("passcheck").value;
	span = document.getElementById("passcheckSpan");
	passValue = document.getElementById("pass").value;
	if(value == ""){
		span.style.visibility = "visible";
		span.textContent = "비밀번호를 다시 입력하세요";
		span.style.color = "red";
		result = false;
	}else if(value != passValue){
		span.style.visibility = "visible";
		span.textContent = "비밀번호가 다릅니다";
		span.style.color = "red";
		result = false;
	}else{
		span.style.visibility = "hidden";
		span.textContent = "";
	}

	value = document.getElementById("name").value;
	span = document.getElementById("nameSpan");
	reg = reg = /[가-힣]{2,20}$/;
	if(value == ""){
		span.style.visibility = "visible";
		span.textContent = "이름을 입력하세요";
		span.style.color = "red";
		result = false;
	}else if(!reg.test(value)){
		span.style.visibility = "visible";
		span.textContent = "한글만 입력 가능합니다";
		span.style.color = "red";
		result = false;
	}else{
		span.style.visibility = "hidden";
		span.textContent = "";
	}

	value = document.getElementById("email").value;
	span = document.getElementById("emailSpan");
	reg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if(value == ""){
		span.style.visibility = "visible";
		span.textContent = "이메일 주소를 입력하세요";
		span.style.color = "red";
		result = false;
	}else if(!reg.test(value)){
		span.style.visibility = "visible";
		span.textContent = "이메일 주소 형식이 올바르지 않습니다";
		span.style.color = "red";
		result = false;
	}else{
		span.style.visibility = "hidden";
		span.textContent = "";
	}

	span = document.getElementById("phoneSpan");
	var ph1Val = document.getElementById("phone1").value;
	var ph2Val = document.getElementById("phone2").value;
	var ph3Val = document.getElementById("phone3").value;
	var ph1Reg = /\d{2,3}/;
	var ph2Reg = /\d{3,4}/;
	var ph3Reg = /\d{4}/;		
	if(ph1Reg.test(ph1Val) && ph2Reg.test(ph2Val) && ph3Reg.test(ph3Val)){
		span.style.visibility = "hidden";
		span.textContent = "";
	}else{
		span.style.visibility = "visible";
		span.textContent = "연락처를 올바르게 입력해주세요";
		span.style.color = "red";
		result = false;
	}

	span = document.getElementById("birthSpan");
	var bir1Val = document.getElementById("birth1").value;
	var bir2Val = document.getElementById("birth2").value;
	var bir3Val = document.getElementById("birth3").value;
	var bir1Reg = /\d{4}/;
	var bir2Reg = /\d{1,2}/;
	var bir3Reg = /\d{1,2}/;
	if(bir1Reg.test(bir1Val) && bir2Reg.test(bir2Val) && bir3Reg.test(bir3Val) 
		&& bir1Val!="0000" && bir2Val!="0" && bir2Val!="00" && bir3Val!="0" && bir3Val!="00" 
		&& parseInt(bir2Val)<=12 && parseInt(bir3Val)<=31){
		span.style.visibility = "hidden";
		span.textContent = "";
	}else if(bir1Val=="0000" || bir2Val=="0" || bir2Val=="00" || bir3Val=="0" || bir3Val=="00"){
		span.style.visibility = "visible";
		span.textContent = "0은 입력하실 수 없습니다";
		span.style.color = "red";
		result = false;
	}else if(parseInt(bir2Val)>12){
		span.style.visibility = "visible";
		span.textContent = "출생월은 12 이하로 입력하세요";
		span.style.color = "red";
		result = false;
	}else if(parseInt(bir3Val)>31){
		span.style.visibility = "visible";
		span.textContent = "출생일은 31 이하로 입력하세요";
		span.style.color = "red";
		result = false;
	}else{
		span.style.visibility = "visible";
		span.textContent = "생년월일을 올바르게 입력해주세요";
		span.style.color = "red";
		result = false;
	}

	if(result){
		document.joinFrm.method = "post";
		document.joinFrm.action = "joinOk.jsp";
		document.joinFrm.submit();
	}
}
</script>
</head>
<body>
	<%@ include file="/loginHeader.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<div>
			<form name="joinFrm">
				<div>
					<div class="border">
						<label for="id"><span class="headSpan">아이디</span></label>
						<input type="text" name="id" id="id" onblur="onBlurFn(this)"
						placeholder="영문시작 6~20자리의 영문or숫자">
					</div>
					<div>
					<label for="id"><span class="footSpan" id="idSpan">아이디를 입력하세요</span></label>
					</div>
				</div>
				<div>
					<div class="border">
						<label for="pass"><span class="headSpan">비밀번호</span></label>
						<input type="password" name="pass" id="pass" onblur="onBlurFn(this)"
						placeholder="영문, 숫자, 특수문자 모두 포함 6~20자리">
					</div>
					<div>
					<label for="pass"><span class="footSpan" id="passSpan">비밀번호를 입력하세요</span></label>
					</div>
				</div>
				<div>
					<div class="border">
						<label for="passcheck"><span class="headSpan">비밀번호 확인</span></label>
						<input type="password" name="passcheck" id="passcheck" onblur="onBlurFn(this)"
						placeholder="비밀번호를 다시 입력하세요">
					</div>
					<div>
					<label for="passcheck"><span class="footSpan" id="passcheckSpan">비밀번호를 다시 입력하세요</span></label>
					</div>
				</div>
				<div>
					<div class="border">
						<label for="name"><span class="headSpan">이름</span></label>
						<input type="text" name="name" id="name" onblur="onBlurFn(this)"
						placeholder="한글로 입력하세요">
					</div>
					<div>
					<label for="name"><span class="footSpan" id="nameSpan">이름을 입력하세요</span></label>
					</div>
				</div>
				<div>
					<div class="border">
						<label for="email"><span class="headSpan">이메일</span></label>
						<input type="text" name="email" id="email" onblur="onBlurFn(this)"
						placeholder="이메일 주소를 입력하세요">
					</div>
					<div>
					<label for="email"><span class="footSpan" id="emailSpan">이메일을 입력하세요</span></label>
					</div>
				</div>
				<div>
					<div class="border">
						<label for="phone1"><span class="headSpan">연락처</span></label>
						<input type="text" name="phone1" id="phone1" class="phone" onblur="onBlurFn(this)"
						placeholder="2~3자리"> -
						<input type="text" name="phone2" id="phone2" class="phone" onblur="onBlurFn(this)"
						placeholder="3~4자리"> -
						<input type="text" name="phone3" id="phone3" class="phone" onblur="onBlurFn(this)"
						placeholder="4자리">
					</div>
					<div>
					<label for="phone1"><span class="footSpan"  id="phoneSpan">연락처를 입력하세요</span></label>
					</div>
				</div>
				<div>
					<div class="border" id="birth">
						<label for="birth1"><span class="headSpan">생년월일</span></label>
						<input type="text" name="birth1" id="birth1" class="birth" onblur="onBlurFn(this)"
						placeholder="4자리">년
						<input type="text" name="birth2" id="birth2" class="birth" onblur="onBlurFn(this)"
						placeholder="1~2자리">월
						<input type="text" name="birth3" id="birth3" class="birth" onblur="onBlurFn(this)"
						placeholder="1~2자리">일
					</div>
					<div>
					<label for="birth1"><span class="footSpan" id="birthSpan">생년월일을 입력하세요</span></label>
					</div>
				</div>
			</form>
			<div id="last">
				<input type="button" name="joinSubmit" value="회원가입" onclick="joinSubmitFn()">
			</div>
		</div>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>
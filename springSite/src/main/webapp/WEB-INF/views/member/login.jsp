<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="shortcut icon" href="/resources/common/images/icon.png">
<link rel="apple-touch-icon" href="/resources/common/images/icon.png">
<script type="text/javascript" src="/resources/include/js/html5shiv.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/login.js"></script>
<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}"/>';
		if (errCode != "") {
			switch (parseInt(errCode)) {
			case 1:
				alert("아이디 또는 비밀번호가 일치하지 않거나 존재하지 않는 \n 회원입니다. 다시 로그인 해주세요.");
				break;
			case 2:
				alert("회원탈퇴에 문제가 있어 정상 처리하지 못하였습니다. \n 다시 시도해주세요.");
				break;
			case 6:
				alert("5번 이상 로그인 시도로 30초 동안 로그인 할 수 없습니다. \n 담시 후 다시 시도해주세요.");
				break;
			}
		} 
	}
</script>
</head>
<body>
	<div class="contentContainer">
	<div class="well">
	<c:if test="${login.userId == null or login.userId==''}">
	<form id="loginForm" class="form-horizontal">
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">아 이 디</label>
			<div class="col-sm-4">
			<input type="text" id="userId" name="userId"
			class="form-control" placeholder="ID">
			</div>
			<p class="form-control-static error"></p>
		</div>
		<div class="form-group">
			<label for="userPw" class="col-sm-2 control-label">비밀번호</label>
			<div class="col-sm-4">
			<input type="password" id="userPw" name="userPw"
			class="form-control" placeholder="Password">
			</div>
			<p class="form-control-static error"></p>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-6">
				<input type="button" value="로그인" id="loginBtn" class="btn btn-default"/>
				<input type="button" value="회원가입" id="joinBtn" class="btn btn-default"/>
			</div>
		</div>
	</form>	
	</c:if>
	<c:if test="${login.userId != null and login.userId != ''}">
		<fieldset id="loginAfter">
		<legend><strong>[${login.userName}]님 반갑습니다.</strong></legend>
		<span id="memberMenu" class="tac">
			<a href="/member/logout.do">로그아웃</a>&nbsp;&nbsp;&nbsp;
			<a href="/member/modify.do">정보수정(비밀번호 변경)</a>&nbsp;&nbsp;&nbsp;
			<a href="/member/delete.do">회원탈퇴</a>
		</span>
		</fieldset>
	</c:if>
	</div>
	</div>
</body>
</html>
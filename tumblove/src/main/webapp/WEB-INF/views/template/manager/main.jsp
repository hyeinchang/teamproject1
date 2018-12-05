<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#manager_nav {
	padding-left: 23.6%;
}
#manager_nav_ul li a {
	color: white;
}
#manager_nav_ul li a:hover {
	color: orange;
}
#manager_login {
	margin: 10px auto;
	border: 1px solid black;
	width: 1000px;
	height: 300px;
	text-align: center;
	padding-top: 100px;
	background: rgba(0,0,0,0.4);
	color: white;
	font-weight: bolder;
	border-radius: 5px;
}
#manager_login_button {
	background: linear-gradient(to bottom, rgba(100,100,180,1) 0%, rgba(20,20,50,0.7) 100%);
	width: 150px;
	height: 30px;
	border-radius: 2px;
	border: 1px solid rgba(20,20,50,1);
}
#manager_login_modal {
	padding-top: 202px;
}
#manager_login_form {
	margin: 0 auto;
	width: 500px;
}
#manager_login_label{
	font-weight: bold;
	color: white;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
</script>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/client_main.css">
<title><tiles:getAsString name="title" /></title>
</head>
<body role="document">
	<header>
		<tiles:insertAttribute name="header" />
	</header>
	<section>
		<div id="manager_login">
			<p>관리자 로그인이 필요한 영역입니다.</p><br>
			<button type="button" id="manager_login_button" data-toggle="modal" data-target="#manager_login_modal"
			data-whatever="@mdo">Manager Login</button>
			
			<div class="modal fade" id="manager_login_modal" tabindex="-1" role="dialog" aria-labelledby="manager_login_label"
			aria-hidden="true">
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="manager_login_label">관리자 로그인</h4>
				</div>
				<div class="modal-body">
					<form id="manager_login_form" name="manager_login_form">
						<div class="form-group">
							<label for="manager_id" class="control-label">ID</label>
							<input type="text" class="form-control" name="manager_id" maxlength="30">
						</div>
						<div class="form-group">
							<label for="manager_password" class="control-label">Password</label>
							<input type="password" class="form-control" name="manager_password" maxlength="32">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismis="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="managerLoginBtn">로그인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>

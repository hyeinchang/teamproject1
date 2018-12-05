<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>     
 <!-- Bootstrap core CSS -->
    <link href="/resources/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="/resources/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/bootstrap/css/theme.css" rel="stylesheet">
    <link href="/resources/bootstrap/css/sticky-footer-navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/bootstrap/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">Tumblove</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="/">Home</a></li>
            <li><a href="/member/loginSession">로그인</a></li>
            <li><a href="/member/join/joinForm">회원가입</a></li>
            <li><a href="/cart/list">장바구니</a></li>
            <li><a href="/">배송조회</a></li>
            <li><a href="/mypage/mypage">마이페이지</a></li>
            <li class="dropdown">
              <a href="/" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객센터 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="/notice/noticeList">공지사항</a></li>
                <li><a href="/faq/faqList">자주 묻는 질문</a></li>
                <li><a href="/qna/qna">Q&A</a></li>
                <li class="divider"></li>
                <li><a href="/manager/main/mainList">Manager</a></li>
              </ul>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container theme-showcase" role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>☆ Tumblove ★</h1>
      </div>
   
     <nav class="navbar navbar-inverse">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand"><strong>Brand</strong></a>
          </div>
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="/product/productList/starbucks">Starbucks</a></li>
              <li><a href="/product/productList/coffeebeen">Coffee Been</a></li>
              <li><a href="/product/productList/locknlock">Lock&Lock</a></li>
              <li><a href="/product/productList/kakaofriends">Kakao Friends</a></li>
              <li><a href="/product/productList/staley">Stanley</a></li>
              <li><a href="/product/productList/mosh">Mosh</a></li>
              <li><a href="/product/productList/kinto">Kinto</a></li>
              <li><a href="/product/productList/corksicle">Corksicle</a></li>
              <li><a href="/product/productList/theroms">Thermos</a></li>
              <li><a href="/product/productList/bluebottl">Blue Bottle</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </nav>
    </div> <!-- /container -->
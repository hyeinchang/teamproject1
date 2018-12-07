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
#product_list li:first-child {
	margin-top: 10px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		var orderForm = $("#orderForm");
		$("#order_sales").on("click",function(e){
			e.preventDefault();
			orderForm.find("input[name='order']").val("p_sales_volume");
			orderForm.submit();
		});
		$("#order_grade").on("click",function(e){
			e.preventDefault();
			orderForm.find("input[name='order']").val("p_grade");
			orderForm.submit();
		});
		$("#order_latest").on("click",function(e){
			e.preventDefault();
			orderForm.find("input[name='order']").val("p_date");
			orderForm.submit();
		});
	});
</script>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/client_main.css">
<title><tiles:getAsString name="title" /></title>
</head>
<body role="document">
	<header>
		<tiles:insertAttribute name="header" />
	</header>

	<div id="product_list_wrapper">
		<h1>『인기상품』</h1>
		<c:forEach items="${popularList}" var="popularProduct">
			<ul id="product_list">
				<li id="product_li1">
					<div id="thumbnail_area">
						<div id="thumbnail_image">
							<a
								href="https://smartstore.naver.com/speedstores/products/3829317851"
								target="_blank"> 
								<img alt="상품사진"
								src="/resources/image/c8750790dd9a36480533d36eb48545b9_11611558_450.jpg">
						</div>
						<div id="thumbnail_text">${popularProduct.p_name}<strong>
								<fmt:formatNumber value=" ${popularProduct.p_price}"
									pattern="#,###,###" />원
							</strong>
						</div></a>
				</li>
			</ul>
		</c:forEach>
	</div>

	<div id="new_product_div">
		<br> <br>
		<!-- <h1>『신상품』</h1> -->
		<div id="thumbnail_area_new">
			<div id="new_product_img_div">
				<img alt="상품사진"
					src="/resources/image/c8750790dd9a36480533d36eb48545b9_11611558_450.jpg"
					width="400px">
			</div>
			<span id="new_product">New Product</span>
			<c:forEach items="${newProduct}" var="newP">
			<ul id="new_product_ul">
				<li>상품명 <input type="text" id="product_name"
					readonly="readonly" name="product_name" value="${newP.p_name}"></li>
				<li>가격 <input type="text" id="product_price"
					readonly="readonly" name="product_price" value="<fmt:formatNumber value=" ${newP.p_price}"
									pattern="#,###,###" />원"></li>
				<li>브랜드 <input type="text" id="product_category"
					readonly="readonly" name="product_category" value="${newP.p_category}"></li>
				<li>용량 <input type="text" id="product_capacity"
					readonly="readonly" name="product_capasity" value="${newP.p_capacity}"></li>
				<li>재질 <input type="text" id="product_material"
					readonly="readonly" name="product_material" value="${newP.p_material}"></li>
				<li><button type="button" id="new_product_button">상세보기</button></li>
			</ul>
			</c:forEach>
		</div>
	</div>
	<c:choose>
		<c:when test="${empty productList }">
			<div id="list_null_div">등록된 상품이 없습니다.</div>
		</c:when>
		<c:when test="${!empty productList }">
			<div id="product_list_wrapper">
				<br> <br>
				<div id="product_list_order">
					<span>『상품리스트』</span> <a href="/" id="order_sales">판매량 높은 순</a> | <a href="/" id="order_grade">평점 높은 순</a> | <a href="/" id="order_latest">최신
						등록 순</a>
				</div>
				<c:forEach items="${productList}" var="product">
				<form id="orderForm" action="/">
					<input type="hidden" name="order">
				</form>
					<ul id="product_list">
						<li id="product1_4x4">
							<div id="thumbnail_area">
								<div id="thumbnail_image">
									<a
										href="https://smartstore.naver.com/speedstores/products/3829317851"
										target="_blank"> <img alt="상품사진"
										src="/resources/image/c8750790dd9a36480533d36eb48545b9_11611558_450.jpg">
								</div>
								<div id="thumbnail_text">${product.p_name}<strong>
										<fmt:formatNumber value=" ${product.p_price}"
											pattern="#,###,###" />원
									</strong>
								</div>
							</div> </a>
						</li>
					</ul>
				</c:forEach>
			</div>
		</c:when>
	</c:choose>
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>

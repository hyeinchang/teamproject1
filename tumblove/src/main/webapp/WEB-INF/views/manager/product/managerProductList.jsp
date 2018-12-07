<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리 - 상품리스트</title>
<link rel="stylesheet" href="/resources/css/client_main.css">
<link rel="stylesheet" href="/resources/css/manager_productList.css">
<link rel="stylesheet" href="/resources/css/manager_main.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		$(".page-item a").on("click", function(e) {
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		$("#search_button").click(function() {
		var keyword = $("#search_product_material_input").val();
		var p_category = $("#search_option_category").val();
		var p_material = $("#search_option_material").val();
		var p_sub_category = "";
		$(".check").each(function() {
		if ($(this).is(":checked")) {p_sub_category += $(this).val()+ "";}
		});
		searchForm.find("input[name='p_category']").val(p_category);
		searchForm.find("input[name='p_sub_category']").val(p_sub_category);
		searchForm.find("input[name='p_material']").val(p_material);
		searchForm.find("input[name='keyword']").val(keyword);
		searchForm.submit();
		});
		
		/* var detailForm = $("#detailForm");
		$("#goDetail").on("click", function(e){
			e.preventDefault();
			datailForm.attr("action",($(this).attr("href")));
			detailForm.submit();
		}); */
	});
</script>
</head>
<body>
	<c:choose>
		<c:when test="${empty productList }">
			<div id="list_null_div">등록된 상품이 없습니다.</div>
		</c:when>
		<c:when test="${!empty productList }">
			<div id="product_list_wrapper">
				<br><span id="product_label_span">『상품리스트』</span>
				<div id="manager_search_product">
					<div id="checkbox_div">
					<input type="checkbox" id="p_sub_category01" name="p_sub_category"
						checked="checked" value="일반" class="check"> 
					<label for="p_sub_category01">일반</label> 
					<input type="checkbox" id="p_sub_category02" name="p_sub_category" value="손잡이" class="check"> 
					<label for="p_sub_category02">손잡이</label> 
					<input type="checkbox" id="p_sub_category03" name="p_sub_category" value="빨대" class="check"> 
					<label for="p_sub_category03">빨대</label>
					<input type="checkbox" id="p_sub_category04" name="p_sub_category" value="물병" class="check"> 
					<label for="p_sub_category04">물병</label>
					<input type="checkbox" id="p_sub_category05" name="p_sub_category" value="보온" class="check"> 
					<label for="p_sub_category05">보온</label>	
					</div>
					<select id="search_option_category" name="p_category">
						<option value="starbucks">Starbucks</option>
						<option value="coffeebean">Coffee Been</option>
						<option value="locknlock">Lock&Lock</option>
						<option value="kakaofriends">Kakao Friends</option>
						<option value="staley">Stanley</option>
						<option value="mosh">Mosh</option>
						<option value="kinto">Kinto</option>
						<option value="corksicle">Corksicle</option>
						<option value="theroms">Thermos</option>
						<option value="bluebottl">Blue Bottle</option>
					</select> 	
					<select id="search_option_material" name="p_material">
						<option value="plastic">플라스틱</option>
						<option value="stainless">스테인레스</option>
					</select> 
					<input type="text" class="form-control" placeholder="Product Name" id="search_product_material_input">
					<button type="button" id="search_button" class="btn btn-default">Search</button>
					<button type="button" id="register_button" class="btn btn-primary">Register</button>
					<form id="searchForm" action="/manager/product/search" method="get">
						<input type="hidden" name="p_category"> 
						<input type='hidden' name='p_sub_category'> 
						<input type='hidden' name='p_material'> 
						<input type='hidden' name='keyword'>
					</form>
				</div>
				<br>
				<c:forEach items="${productList}" var="product">
					<form id="actionForm" action="/manager/product/productList" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					</form>
					<ul id="product_list">
						<li id="product1_4x4">
							<div id="thumbnail_area">
								<div id="thumbnail_image">
									<!-- <a id="goDetail" href="/manager/product/detail" target="_blank">  -->
									<img alt="상품사진" src="/resources/image/c8750790dd9a36480533d36eb48545b9_11611558_450.jpg">
								</div>
								<div id="thumbnail_text">${product.p_name} 
								<strong>
								<fmt:formatNumber value=" ${product.p_price}" pattern="#,###,###" />원
								</strong>
								<form id="detailForm" name="detailForm">
									<input type="hidden" name="p_num" value="${product.p_num}">
								</form>
								</div>
							</div><!-- </a> -->
						</li>
					</ul>
				</c:forEach>
			</div>
			<br>
			<nav aria-label="Page navigation example" id="paging_nav">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class='page-item previouce' id="prev"><a
							class="page-link" href="${pageMaker.startPage - 1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li
							class='page-item ${pageMaker.cri.pageNum == num ? "active":""}'
							id="active"><a class="page-link" href="${num}">${num}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li class='page-item next' id="next"><a class="page-link"
							href="${pageMaker.endPage + 1}" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a></li>
					</c:if>
				</ul>
			</nav>
		</c:when>
	</c:choose>
</body>
</html>


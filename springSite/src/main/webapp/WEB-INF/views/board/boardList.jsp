<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="tag" uri="../../tld/custom_tag.tld" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
<link rel="stylesheet" type="text/css"
href="/resources/include/css/common.css"/>
<link rel="stylesheet" type="text/css"
href="/resources/include/css/board.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
	$(function(){
		var word = "<c:out value='${data.keyword}'/>";
		var value="";
		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");
			
			if ($("#search").val()!='b_content') {
				if ($("#search").val()=='b_title')
					value = "#list tr td.goDetail";
				else if ($("#search").val()=='b_name')
					value = "#list tr td.name";
				$(value+":contains('"+word+"')").each(function(){
					var regex = new RegExp(word,'gi');
					$(this).html($(this).text().replace(regex,
							"<span class='required'>"+word+"</span>"));
				});
			}
		}
		
		if (" <c:out value='${data.pageSize}'/>"!="") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}
		
		$("#search").change(function() {
			if ($("#search").val()=="all") {
				$("#keyword").val("전체 데이터 조회합니다.");
			} else if ($("#search").val()!="all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		$("#searchData").click(function() {
			if ($("#search").val()!="all") {
				if(!chkSubmit($('#keyword'),"검색어를")) return;
			}
			goPage(1);
		});
		
		$(".order").click(function() {
			var order_by = $(this).attr("data-value");
			console.log("선택값 : " + order_by);
			
			$("#order_by").val(order_by);
			if ($("#order_sc").val() == 'DESC'){
				$("#order_sc").val('ASC');
			} else {
				$("#order_sc").val('DESC');
			}
			goPage(1);
		});
		
		$("#pageSize").change(function() {
			goPage(1);
		});
		
		$("#insertFormBtn").click(function(){
			location.href="/board/writeForm.do";
		});
		$(".goDetail").click(function(){
			var b_num = $(this).parents("tr").attr("data-num");
			$("#b_num").val(b_num);
			console.log("글번호 : " + b_num);
			$("#detailForm").attr({
				"method":"get",
				"action":"/board/boardDetail.do"
			});
			$("#detailForm").submit();
		});
	});
	function goPage(page) {
		if($("#search").val()=="all"){
			$("#keyword").val("");
		} 
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/board/boardList.do"
		});
		$("#f_search").submit();
	}
</script>
</head>
<body>
<div class="contentContainer">
<div class="contentTit"><h3>게시판 리스트</h3></div>
<form name="detailForm" id="detailForm">
	<input type="hidden" name="b_num" id="b_num">
	<input type="hidden" name="page" value="${data.page}">
	<input type="hidden" name="pageSize" value="${data.pageSize}">
</form>
<div id="boardSearch">
	<form id="f_search" name="f_search">
	<input type="hidden" id="page" name="page" value="${data.page}">
	<input type="hidden" id="order_by" name="order_by" value="${data.order_by}"/>
	<input type="hidden" id="order_sc" name="order_sc" value="${data.order_sc}"/>
		<table summary="검색">
			<colgroup>
				<col width="70%"/>
				<col width="30%"/>
			</colgroup>
			<tr>
				<td id="btd1">
				<label>검색조건</label>
				<select id="search" name="search">
					<option value="all">전체</option>
					<option value="b_title">제목</option>
					<option value="b_content">내용</option>
					<option value="b_name">작성자</option>
				</select>
				<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요.">
				<input type="button" value="검색" id="searchData"/>
				</td>
				<td id="btd2">한페이지에
				<select id="pageSize" name="pageSize">
					<option value="1">1줄</option>
					<option value="2">2줄</option>
					<option value="3">3줄</option>
					<option value="5">5줄</option>
					<option value="7">7줄</option>
					<option value="10">10줄</option>
				</select>
				</td>
			</tr>
		</table>
	</form>
</div>
<div id="boardList">
	<table summary="게시판 리스트">
		<colgroup>
		<col width="10%"/>
		<col width="62%"/>
		<col width="15%"/>
		<col width="13%"/>
		</colgroup>
		<thead>
		<tr>
			<th data-value="b_num" class="order">글번호
			<c:choose>
				<c:when test="{data.order_by=='b_num' and data.order_sc=='ASC'}">▲</c:when>
				<c:when test="{data.order_by=='b_num' and data.order_sc=='DESC'}">▼</c:when>
				<c:otherwise>▲</c:otherwise>
			</c:choose>
			</th>
			<th>글제목</th>
			<th data-value="b_date" class="order">작성일
			<c:choose>
				<c:when test="${data.order_by=='b_date' and data.order_sc=='ASC'}">▲</c:when>
				<c:when test="${data.order_by=='b_date' and data.order_sc=='DESC'}">▼</c:when>
				<c:otherwise>▲</c:otherwise>
			</c:choose>
			</th>
			<th class="borcle">작성자</th>
		</tr>
		</thead>
		<tbody id="list">
		<c:choose>
		<c:when test="${not empty boardList}">
			<c:forEach var="board" items="${boardList}" varStatus="status">
			<tr class="tac" data-num="${board.b_num}">
			<td>${count - status.index}</td>
			<td class="goDetail tal">
			${board.b_title}</td>
			<td>${board.b_date}</td>
			<td class="name">${board.b_name}</td>
			</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
			</tr>
		</c:otherwise>
		</c:choose>
		</tbody>
	</table>
</div>
<div class="contentBtn">
	<input type="button" value="글쓰기" id="insertFormBtn">
</div>
<div id="boardPage">
	<tag:paging page="${param.page}" total="${total}" list_size="${data.pageSize}"/>
</div>
</div>
</body>
</html>
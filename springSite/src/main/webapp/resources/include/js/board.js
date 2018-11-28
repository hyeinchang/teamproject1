var keyword = "", search = "", start_date = "", end_date = "";
$(function() {
	if (search = "b_date") {
		$("#dateCheck").hide();
		var date = getDateFormat(new Date());
		$("#start_date").val(date);
		$("#end_date").val(date);
	} else {
		$("#search").val(search);
		$("#textCheck").hide();
		$("#start_date").val(start_date);
		$("#end_date").val(end_date);
	}
	
	if (keyword!="") {
		$("#search").val(search);
		$("#keyword").val(keyword);
	}
	
	$("#searchBtn").click(function() {
		if ($("#search").val()!="b_date") {
			if (!chkSubmit($("#keyword"),"검색어를")) return;
		} else if ($("#search").val()=="b_date") {
			if (!chkSubmit($("#start_date"),"시작날짜를")) return;
			else if (!chkSubmit($("#end_date"),"종료날짜를")) return;
			else if ($("#start_date").val()>$("#end_date").val()) {
				alert("시작날짜가 종료날짜보다 더 클 수 없습니다.");
				return;
			}
		}
		goPage(1);
	});
	
	$("#allSearchBtn").click(function() {
		$("#search > option:selected").val("");
		$("#keyword").val("");
		$("#start_date").val("");
		$("#end_date").val("");
		goPage(1);
	});
	
	$("#search").change(function() {
		if ($("#search").val()!="b_date") {
			$("#dateCheck").hide();
			$("#textCheck").show();
		} if ($("#search").val()=="b_date") {
			$("#textCheck").hide();
			$("#dateCheck").show();
		}
	});
	
	$("#excelDownBtn").click(function() {
		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/board/boardExcel.do"
		});
		$("#f_search").submit();
	});
});

function goPage(page) {
	$("#page").val(page);
	$("#f_search").attr({
		"method" : "get",
		"action" : "/admin/board/boardList.do"
	});
	$("#f_search").submit();
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scal=1.0,
maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrom=1"/> -->
<title>갤러리 리스트</title>
<link rel="stylesheet" type="text/css" href="/resources/include/css/common.css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/css/lightbox.css"/>
<script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script>
<script type="text/javascript">
	$(function() {
		listData();
		$("#galleryInsertBtn").click(function() {
			if (!checkForm($('#g_name'),"작성자를")) return;
			else if (!checkForm($('#g_subject'),"글제목을")) return;
			else if (!checkForm($('#g_content'),"간단한 내용을")) return;
			else if (!checkForm($('#file'),"등록할 이미지를")) return;
			else if (!chkFile($('#file'))) return;
			else if (!checkForm($("#g_pwd"),"비밀번호를")) return;
			else {
				$("#f_writeForm").ajaxForm({
					url : "/gallery/galleryInsert.do",
					type : "post",
					enctype : "multipart/form-data",
					dataType : "text",
					error : function() {
						alert("시스템 오류입니다. 관리자에게 문의하세요.");
					},
					success : function(data) {
						console.log(data);
						if (data == "성공") {
							resetData();
							$("#galleryModal").modal("hide");
							listData();
						} else {
							alert("["+data+"]\n등록에 문제가 있어 완료하지 못하였습니다. 잠시 후 다시 시도해주세요.");
							resetData();
						}
					}
				});
				$("#f_writeForm").submit();
			}
		});
	});
	
	function resetData() {
		$("#f_writeForm").each(function() {
			this.reset();
		});
	}
	
	function listData() {
		$("#accordion").html("");
		$.getJSON("/gallery/galleryData.do", function(data){
			console.log(data.length);
			$(data).each(function(index){
				var g_name = this.g_name;
				var g_subject = this.g_subjext;
				var g_content = this.g_content;
				var g_thumb = this.g_thumb;
				var g_file = this.g_file;
				var g_date = this.g_date;
				console.log("index : " + index);
				newRecord(g_name, g_subject, g_content, g_thumb, g_file, g_date, index);
			});
		}).fail(function() {
			alert("목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해주세요.");
		});
	}
	
	function newRecord(g_name, g_subject, g_content, g_thumb, g_file, g_date, index) {
		var panel = $("<div>");
		panel.addClass("panel panel-default");
		
		var panel_heading = $("<div>");
		panel_heading.addClass("panel-heading");
		panel_heading.attr({role:"tab", id:"heading"+index});
		
		var panel_title = $("<h4>");
		panel_title.addClass("panel-title");
		
		var title = $("<a>");
		title.attr({"data-toggle" : "collapse",
			"data-parent" : "#accordion",
			"href" : "#collapse"+index, 
			"aria-controls" : "collapse" + index
		});
		if (index == 0) {
			title.attr({"aria-expanded" : "true"});
		} else {
			title.attr({"aria-expanded" : "false"});
			title.addClass("collapsed");
		}
		title.html(g_subject);
		var panel_body = $("<div>");
		panel_body.addClass("panel-collapse collapse");
		if(index == 0) {
			panel_body.addClass("in");
		}
		panel_body.attr({
			id : 'collapse' + index,
			role : 'tabpanel',
			"aria-labelledby" : "heading" + index
		});
		var body = $("<div>");
		body.addClass("panel-body");
		var thumb_img_area = $("<div>");
		thumb_img_area.addClass("col-md-2");
		
		var lightbox_a = $("<a>");
		lightbox_a.attr({
			"href" : "/uploadStorage/gallery/" +g_file,
			"data-lightbox" : "roadtrip"
		});
		
		var thumb_img = $("<img>");
		thumb_img.attr("src",
				"/uploadStorage/gallery/thumbnail/" + g_thumb);
		thumb_img.addClass("img-thumbnail");
		
		var date = $("<p>");
		date.addClass("form-control-static");
		date.html(g_date);
		
		var con = $("<p>");
		con.addClass("form-control-static");
		con.html(g_content);
		
		body.append(thumb_img_area.append(lightbox_a.append(thumb_img)));
		body.append(date).append(con);
		
		panel.append(panel_heading.append(panel_title.append(title)));
		panel.append(panel_body.append(body));
		$("#accordion").append(panel);
	}
</script>
</head>
<body>
<div class="contentContainer">
	<p class="tar">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#galleryModal"
		data-whatever="@mdo">갤러리 등록</button>
	<p>
	
	<div class="panel-group" id="accordion" role="tablist"
	aria-multiselectable="true"></div>

	
	<div class="modal fade" id="galleryModal" tabindex="-1" role="dialog" 
	aria-labelledby="galleryModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
			</button>
			<h4 class="modal-title" id="galleryModalLabel">갤러리 등록</h4>
			</div>
			<div class="modal-body">
			<form id="f_writeForm" name="f_writeForm">
				<div class="form-group">
				<label for="g_name" class="control-label">작성자</label>
				<input type="text" class="form-control" name="g_name" id="g_name" maxlength="5"/>
				</div>
				<div class="form-group">
				<label for="g_subject" class="control-label">글제목</label>
				<input type="text" class="form-control" name="g_subject" id="g_subject" maxlength="50"/>
				</div>
				<div class="form-group">
				<label for="g_content" class="form-control">글내용</label>
				<textarea class="form-control" name="g_content" id="g_content"></textarea>
				</div>
				<div class="form-group">
				<label for="file" class="control-label">이미지</label>
				<input type="file" name="file" id="file">
				</div>
				<div class="form-group">
				<label for="g_pwd" class="control-label">비밀번호</label>
				<input type="password" class="form-control" name="g_pwd" id="g_pwd">
				</div>
			</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismis="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="galleryInsertBtn">등록</button>
			</div>
		</div>
	</div>
	</div>
</div>
</body>
</html>
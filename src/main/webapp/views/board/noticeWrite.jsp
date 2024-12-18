<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
	<meta charset="utf-8"/>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/root.css" />
	<link rel="stylesheet" href="resources/richtexteditor/res/style.css" />
	<link rel="stylesheet" href="resources/richtexteditor/rte_theme_default.css" />
	<link rel="stylesheet" href="resources/richtexteditor/runtime/richtexteditor_content.css" />
	<script type="text/javascript" src="resources/richtexteditor/rte.js"></script>
	<script type="text/javascript" src='resources/richtexteditor/plugins/all_plugins.js'></script>	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://kit.fontawesome.com/6282a8ba62.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
	.dashboard-body{
	    margin-left: 15vw;
	    width: 85vw;
	    margin-top: 7vh;
	    flex-wrap: wrap;
	    padding: 2vh;
	    color: var(--primary-color);
	    height: 92%;
	    display: flex;
	    flex-direction: column;
	    align-content: center;
	    align-items: flex-start;
	    justify-content: center;
	}
	.maintext{
		display: flex;
		margin: 10px;
	}
	.document{
		color: var(--secondary-color);
		margin-right: 30px !important;
	}
	.formBorder{    
		display: flex;
	    align-items: center;
	    justify-content: center;
	    width: 55rem;
	    height: 40rem;
	    border: 2px solid var(--primary-color);
	    border-radius: 10px;
	}
	form{
	    width: 47vw;
	}
	table{
		border-radius: 10px;
	}
	th, td{
		border: none !important;
	}
	input[type="text"]{
		width: 47%;
		border: 1px solid lightgray;
		font-size: 14px;
	}
	input[name="name"]{
	    all: unset;
	    -webkit-appearance: none;
	    -moz-appearance: none;
	    appearance: none;
	    pointer-events: none;
	}
	input::placeholder {
	    color: var(--primary-color) !important;
	    font-size: 14px;
	    opacity: 1;
	}
	label{
		color : var(--accent-color) !important;
	}
	label, input[type="checkbox"]{
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    user-select: none;
	}
	#check{
	    width: 10px;
    	height: 10px;
	}
	#div_editor{
	    height: 55vh;
	}
	rte-content{
		border-radius: 10px;
	}
	rte-bottom{
		display: none !important;
	}
	input[type="button"]{
		width:100%;
		height: 30px;
		background-color: var(--secondary-color);
		border: none;
		border-radius: 5px;
		color: white;
	}
	input[type="button"]::hover{
		background-color: var(--accent-color);
	}
   </style>
</head>
<body class="bg-theme bg-theme1">
 <jsp:include page="../main/header.jsp"></jsp:include>
 	<div class="dashboard-body">
 		<div class="maintext">
			<h3 class="document">게시판</h3>
			<h3>>&nbsp;&nbsp;공지 작성</h3>
		</div>
		<div class="formBorder">
			<form action="noticeWrite.do" method="POST">
			<table>
				<tr>
					<td>제목 : <input type="text" name="subject" placeholder="제목을 입력 하세요! 20자 이내 작성" maxlength="20"/></td>
				</tr>
				<tr>
					<td>
						<label for="check">★ 중요 공지로 등록하려면 체크박스를 선택하세요</label>
						<input type="checkbox" id="check" name="importance">
					</td>
				</tr>
				<tr>
					<td>작성자 : <input type="text" name="name" value="에이스" readonly/></td>
				</tr>
				<tr>
					<td>
						<div id="div_editor">
						</div>
						<input type="hidden" name="content"/>
					</td>
				</tr>
				<tr>
					<th><input type="button" value="공지 등록하기" onclick="save()"/></th>
				</tr>
			</table>
			</form>
		</div>
 	</div>
</body>
<script>
var config = {}
config.editorResizeMode = "none";
//config.toolbar = "basic";

//data:imgae - 이미지를 base64 형태로 문자열화 한것이다.
//장점 : 별도의 파일처리 없이 파일을 다룰 수 있다. 사용이 간단하다.
//단점 : 용량제어가 안되며, 기존파일보다 용량이 커진다. 
config.file_upload_handler = function(file,pathReplace){ // 파일객체, 경로변경 함수, 자바스크립트는 함수를 매개변수로 넘길수있음
	console.log(file);

	if(file.size>(1*1024*1024)){
		alert('2MB이상의 파일은 올릴 수 없습니다.');
		pathReplace('/img/noimage.png');
	}
}

var editor = new RichTextEditor("#div_editor", config);

function save() {
    var content = editor.getHTMLCode();
    console.log(content);
    console.log("전체 문서의 크기 :" + (content.length / 1024 / 1024) + "MB");

    // 체크박스 상태에 따라 importance 값 설정
    if ($('#check').prop('checked')) {
        $('input[name="importance"]').val('true');
    } else {
        $('input[name="importance"]').val('false');
    }

    if (content.length > 100 * 1024 * 1024) {
        alert("100MB이상 크기는 전송이 불가능 합니다.");
    } else {
        $('input[name="content"]').val(content);
        $('form').submit();
    }
}
// 500자 제한
$(document).on('input', '#div_editor', function() {
    var maxLength = 500;
    var text = $(this).text();
    if (text.length > maxLength) {
        $(this).text(text.substring(0, maxLength));
    }
});
</script>
</html>

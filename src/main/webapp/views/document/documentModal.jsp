<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/root.css" />
<script src="resources/js/document-modal.js"></script>
<style>
.docnav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 0 48px;
	padding: 0 5px;
}

.opt {
    width: 35%;
	display: flex;
	justify-content: space-between;
}

.opt a{
	color: var(--secondary-color);
}

.opt div {
	display: flex;
	align-content: center;
	align-items: center;
	font-size: 20px;
	font-weight: bold;
	height: 60px;
}

.opt div span {
	color: var(--accent-color);
	margin-left: 5px;
}

.searchbox {
	width: 25%;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.search {
	position: relative;
	display: inline-block;
}

.search input {
	border-radius: 10px;
	padding-left: 10px;
	border: 1px solid var(--primary-color);
}

.search i {
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%);
	font-size: 18px;
	pointer-events: none;
	color: var(--accent-color);
}

.editbtn {
	color: white;
	background-color: var(--accent-color);
	border-radius: 10px;
	width: 70px;
}
/* 모달 기본 스타일 */
.custom-modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
	z-index: 1000;
}
/* 모달 내용 */
.custom-modal-content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 355px;
	height: auto;
	background-color: var(--background-color);
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	padding: 10px 0 0 10px;
}

.docSearch input {
	color: var(--primary-color);
	font-weight: bold;
}

.modal-input {
	width: 160px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.modal-list {
	list-style: none;
	padding: 0;
}

.modal-item {
	padding: 0 0 10 40px !important;
	cursor: pointer;
	border-radius: 4px;
}

.modal-item:hover {
	background-color: var(--secondary-color);
	color: white;
}

/* 모달 */
.modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1000;
    pointer-events: none;
}
.modal div,
.modal table{
    pointer-events: none;
}
/* 모달 내용 */
.modal-content {
    border: 2px solid var(--primary-color);
	transform: scale(0.8) !important;
    background-color: white;
    padding: 15px;
    border-radius: 5px;
    width: 44vw;
    position: relative;
}
.modal-content input, 
.modal-content textarea, 
.modal-content button,
.close-btn {
	pointer-events: auto;
}
.modal-box{
	margin-bottom: 20px;
}
input[name="doc_subject"]{
    width: 360px;
}
.modal-btn{
    margin-right: 5px;
}
/* 닫기 버튼 */
.close-btn {
    position: absolute;
    top: 5px; /* 위치 조정 */
    right: 5px; /* 위치 조정 */
    cursor: pointer;
    font-size: 14px; /* 글자 크기 줄이기 */
}

</style>
</head>
<body>
	<div class="docnav">
		<div class="opt">
			<div>
				<a href="documentBoard.go">진행중<span>12</span></a>
			</div>
			<div>
				<a href="documentApproved.go">완료</a>
			</div>
			<div>
				<a href="documentDraft.go">임시저장<span>3</span></a>
			</div>
			<div>
				<a href="documentReject.go">반려문서<span>3</span></a>
			</div>
		</div>
		<div class="searchbox">
			<div class="search">
				<input type="text" name=""><i class="fas fa-search"></i>
			</div>
			<button class="editbtn">
				<i class="far fa-edit"></i>작성
			</button>
		</div>
	</div>
	<!-- 모달 -->
	<div id="customModal" class="custom-modal">
		<div class="custom-modal-content">
			<i class="far fa-arrow-alt-circle-left"></i>
			<!-- 입력 필드 -->
			<div class="search docSearch">
				<input type="text" class="modal-input" name="item"
					placeholder="양식 검색"> <i class="fas fa-search"></i>
			</div>
			<hr />
			<!-- 항목 리스트 -->
			<ul class="modal-list">
				<li class="modal-item" onclick="documentForm('연차신청서')">연차신청서</li>
				<li class="modal-item" onclick="documentForm('시말서')">시말서</li>
				<li class="modal-item" onclick="documentForm('사유서')">사유서</li>
				<li class="modal-item" onclick="documentForm('업무')">업무 보고서</li>
			</ul>
		</div>
	</div>
</body>
<script>

$(document).ready(function() {
	// 작성 버튼 클릭 시 모달 열기
	$(".editbtn").click(function() {
		$("#customModal").fadeIn(); // 모달 열기 (fade 효과)
	});

	// 화살표 뒤로가기
	$(".far.fa-arrow-alt-circle-left").click(function() {
		$("#customModal").fadeOut(); // 뒤로가기 기능 실행
	});

});

function documentForm(form_subject) {
	
    $.ajax({
        type: 'GET',
        url: 'getForm.ajax',
        data: { form_subject: form_subject },
        dataType: 'text',
        success: function(response) {
        	console.log("Response HTML: ", response);  // 서버에서 받은 HTML 확인
            openModal(response); 
        },
        error: function(xhr, status, error) {
            console.error('문서 요청 실패:', error);
        }
    });
}
//모달 열기
function openModal(content) {
    var modalId = 'modal-' + new Date().getTime(); // 유니크한 ID 생성

    // 모달 HTML 생성
    var modalHtml = 
        '<div id="' + modalId + '" class="modal" style="display: none;">' +
        '  <div class="modal-content">' +
        '    <div class="modal-box">' +
        '      <button class="modal-btn Approve" onclick="btnAction(\'기안\')">기안</button>' +
        '      <button class="modal-btn save" onclick="btnAction(\'임시저장\')">임시저장</button>' +
        '      <button class="modal-btn append" onclick="button3Action(\'결재선\')">결재선 추가</button>' +
        '      <span class="close-btn" data-modal-id="' + modalId + '">X</span>' +
        '    </div>' +
        '    <div class="content" contenteditable="true">' + content + '</div>' +
        '  </div>' +
        '</div>';

    // body에 추가
    $('body').append(modalHtml);

    // 모달 표시
    $('#' + modalId).show();

    // 닫기 버튼 이벤트 등록 (이벤트 위임)
    $(document).on('click', '.close-btn', function() {
        var targetModalId = $(this).data('modal-id');
        $('#' + targetModalId).remove();
    });
}

// 결재 기안, 임시저장
function btnAction(actionType) {

	console.log("봐라 "+actionType);
	var doc_subject = $('input[name="doc_subject"]').val();
	console.log("제목 "+doc_subject);
	
	// textarea에 입력된 값을 가져옵니다
	var textareaValue = $('.modal-content:last-child textarea').val(); 

	// modal-content의 HTML을 가져옵니다
	var updatedHtml = $('.modal-content:last-child').html();

	// HTML에서 <input name="doc_subject"> 부분 찾아서 그 안의 값을 doc_subject로 변경
	updatedHtml = updatedHtml.replace(
	    /<input([^>]*name=["']doc_subject["'][^>]*)>/,
	    '<input$1 value="' + doc_subject + '">'
	);

	// HTML에서 <textarea> 부분을 찾아서 그 안의 값을 textareaValue로 변경합니다
	updatedHtml = updatedHtml.replace(
	    /<textarea[^>]*>.*?<\/textarea>/,  // 기존 textarea 태그와 그 안의 내용을 찾아냄
	    '<textarea>' + textareaValue + '</textarea>'  // textarea 값을 새로 덮어씌움
	);

	// 수정된 HTML을 다시 modal-content에 적용
	$('.modal-content:last-child').html(updatedHtml);
	var doc_content = $('.modal-content:last-child .content').html();
	console.log("최종"+ doc_content);
	$.ajax({
        url: 'formType.ajax',
        method: 'POST',
        data: { 
        	action: actionType,
        	doc_subject: doc_subject,
        	doc_content: doc_content	
        },
        success: function(response) {
        	alert(response.message);  // 예: "기안 완료" 메시지
            closeModal();  // 모달 닫기
            if (response.success) {
                // 성공 처리
            } else {
                // 실패 처리
            }
        }
    });
}

function closeModal() {
    // 모달을 닫는 로직
    $('.modal').hide(); // 예시: modal 클래스를 가진 요소 숨기기
    $('.modal-content').empty(); // 모달 내용을 비우기
}

</script>
</html>
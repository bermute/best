<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
  <meta charset="utf-8"/>
  <script src="https://kit.fontawesome.com/6282a8ba62.js" crossorigin="anonymous"></script>
  <link href="https://cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/main.min.css" rel="stylesheet">
  <script src="resources/js/index.global.js"></script>
  
  <style>
  :root{
      --primary-color: #30005A;
      --secondary-color: #8B6AA7;
      --accent-color: #E9396B;
      
   }

    .dashboard-body{
       margin-left: 14vw;
       width: 85vw;
       margin-top: 7vh;
       flex-wrap: wrap;
       padding: 2vh;
       color: var(--primary-color);
       border: 1px solid #00000000;
       height: 857px;
       display: flex;
       flex-direction: column;
       align-content:center;
       justify-content: center;
   }
  /* 시계 스타일 */
  #clock {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
    text-align: center; 
  }
    .container-meetingRoom {
      display: flex;
      width: 46%;
      height: 73%;
      margin: 4% 1% 0 0;
    }

    #calendar-container {
      flex: 2;
      background-color: #8b6aa700;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      border:2px solid #30005A;
      margin: 0 0 0 0;
    }
    #calendar-room {
    	height: 100%;
    	max-height: 84%;
    	width: 100%;
    }
	
	/* 캘린더 날짜 색 */
	.fc-daygrid-day-number{
		color: black;
	}
	
	/* 캘린더 이벤트 등록된 배경색 */
	.fc-event-main {
	  background-color: #3788d8; /* 원하는 배경색 */
	  color: white; /* 텍스트 색상 */
	  border: none; /* 테두리를 제거하려면 */
	  border-radius: 5px; /* 둥근 모서리 */
	}

/* 캘린더 설정  */
.fc a[data-navlink]{
	color: black;
}
/* a 태그 비활성화 */
.fc-col-header-cell-cushion {
  pointer-events: none; /* 클릭 비활성화 */
  cursor: default; /* 커서를 기본 모양으로 변경 */
}
/* 회의실 예약 */
.meeting-add{
	position: absolute;
	top: 200px;
}
/* 회의실 정보,예약 */
.btninfo{
	margin: 0 0 50px 0;
}	
.btnadd {
	margin: 0 0 13px 1px;
}	

/* 회의실 예약 모달 */
.meetingmodal {
    display: none; /* 초기 상태는 숨김 */
    position: fixed;
    top: 8%;
    left: 3%;
    transform: translate(0%, 0%);
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    z-index: 1000;
    max-height: 700px;
    overflow-y:auto;
    width: 22%;
}

.roomModal-content {
    width: 100%;
    max-width: 500px;
    height: 100%;
    border: 1px solid black;
    border: 1px solid #00000030;
    padding: 10px;
    border-radius: 10px;
}
.la {
	color: black;
}
#start-time {
    max-height: 100px; /* 드롭다운 최대 높이 */
    overflow-y: auto;  /* 스크롤바 활성화 */
}
#start-time option,#end-time option{
	background-color: white; 
}
.groupbtn{
	margin: 0 0 0 64%;
}
/* 미팅룸 img */
#room-image {
	width: 335px;
	margin: 0 0 0 0;
	border-radius: 10px;
	display: none; 
	height: 228px;
	padding: 16px;
}
.form-group{
	margin: 2% 0 0 0;
}

/* 예약자 */
.emp-name{
	display: contents;
}
.room-box{
	background-color: white;
}
/* 모달 제목 라인 */
.box-line{
	width: 100%;
	height: 1px;
	background-color: rgb(0 0 0 0); 
}
.room-btn-container {
    display: flex; /* 버튼 정렬을 위해 flex 사용 */
    flex-wrap: wrap;
    gap: 10px; /* 버튼 간격 */
    margin: 10px;
}
.room-btn {
	width: calc(30% - 10px); /* 5개씩 나열 (100% / 5개 - 간격값) */
	border-radius: 10px;
}
#room-name {
	display: contents;
}
/* .thing{
	list-style: none; 
	display: flex;	
	gap: 10px; 
	padding: 0px;
}
.thing li {
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	text-align: center;
}
.thing-box{
	display: inline-flex;
} */

/* 캘린더 이벤트 폰트색상 */
.fc-event-time,.fc-event-title {
	color: black;
}
.fc-list-event-title {
	color: black;
}
.fc-list-event-time {
	color: black;
}

/* 캘린더 이벤트 폰트색 */
.fc-event-main {
	color: black !important;
}
.fc-event span {
	color: black !important;
}
.fc-event b {
	color: black !important;
}
.event-box {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    box-sizing: border-box;
    background-color: #688eec;
    border-radius: 10px;
    text-overflow: ellipsis; /* 넘치는 텍스트를 ...으로 표시 */
    overflow: hidden; /* 넘치는 부분 숨김 */
    white-space: nowrap; /* 한 줄로 표시 */
    
}

.event-box span {
    display: block; /* 인라인 요소를 블록 요소처럼 만듦 */
    margin: 5px 0;
}
.fc-event.fc-event-draggable.fc-event-resizable.fc-event-start.fc-event-end.fc-event-today.fc-daygrid-event.fc-daygrid-dot-event {
	width: 100%;
}


/* 회의실 예약 현황  */
        .table-container {
            border: 2px solid #30005A;
            border-radius: 10px;
            padding: 20px;
            background-color: #fdf8fc00;
            width: 28%;
            height: 34%;
            position: relative;
            top:21px;
            overflow-y: auto;
        }
        .table-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: white;
            font-size: 18px;
            font-weight: bold;
            background-color: #30005A;
            border-radius: 10px;
        }
        .table-row {
            display: flex;
            padding: 0px;
            border-bottom: 1px solid #8B6AA7;
        }
        .table-row.header {
            background-color: #8B6AA7;
            color: #30005A;
            font-weight: bold;
        }
        .table-row div {
            flex: 1;
            text-align: center;
            padding: 5px;
        }

		.table-row-point:hover {
		    background-color: #f0f8ff; 
		    color: #000000;
		    cursor: pointer;
		}
        
/*   예약 상세   */
        .detail-table-container {
            border: 2px solid #30005A;
            border-radius: 10px;
            padding: 10px;
            background-color: #fdf8fc00;
            width: 28%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            position: relative;
            top: 44px;
        }
        .detail-table-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #30005A;
            font-size: 18px;
            font-weight: bold;
            background-color: #30005A;
            color: white;
            border-radius: 10px;
        }
        .detail-table {
            width: 100%;
            border-collapse: collapse;
        }
        .detail-table th, .detail-table td {
            padding: 4px;
            text-align: left;
            border-bottom: 1px solid #8B6AA7;
        }
        .detail-table th {
            width: 25%;
            background-color: #8B6AA7;
            color: #30005A;
            font-weight: bold;
        }
        .detail-table td {
            color: #333;
        }
        .detail-table tr:last-child td {
            border-bottom: none;
        }
        
/* 회의실 헤더 */
	.title-name{
		display: block;
		position: absolute;
		top: 12%;
		left: 17%;
		width: 79%;
	}
	.title-line{
		width: 100%;
		height: 1px;
		background-color: #100f0f4a;
	}
	
/* 회의실 모달 기자재 css */
#room-material {
	border: 2px solid #30005A;
	padding: 3px;
	border-radius: 10px;
	display: table;
	margin: 6px 0 0 83px;
}	
.material-add {
	margin: 0 0 0 0;
	border: 1px solid black;
	border-radius: 10px;
}
/* 추가 기자재들 css*/
.equipment-label {
	color: black;
}
/* 회의실 수용 인원 css*/
.max-capacity {
	display: none;
}
#room-capacity {
	display:contents;
}

  </style>
  
</head>
<body class="bg-theme bg-theme1">
 <jsp:include page="../main/header.jsp"></jsp:include>
  	<div class="title-name">
	    <h3>회의실 예약</h3>
	    <div class="title-line"></div>
	</div>
 	<div class="dashboard-body">
		  <div class="container-meetingRoom">
				<!-- <h2 class="meeting-add">회의실 예약</h2> -->
		    <div id="calendar-container">
				<button class="btnadd btn-primary" onclick="openModal()">예약하기</button>
				<div id='calendar-room'></div>
		    </div>
		  </div>
		    <div class="table-container" id="table-container">
		        <h2>회의실 예약 현황</h2>
		        <!-- Header Row -->
			        <div class="table-row header">
			            <div>시간</div>
			            <div>회의실</div>
			            <div>회의 부서</div>
			            <div>직급</div>
			            <div>예약자</div>
			        </div>
			        <!-- Data Rows -->
		        <div id="reservation-list">
					<div class="table-row" >
						선택하신 날짜가 없습니다.
					</div>
		        </div>
		    </div>
		    <div class="detail-table-container">
		        <h2>예약 상세</h2>
		        <table class="detail-table">
		            <tr>
		                <th>시간</th>
		                <td></td>
		            </tr>
		            <tr>
		                <th>회의실</th>
		                <td></td>
		            </tr>
		            <tr>
		                <th>회의 부서</th>
		                <td></td>
		            </tr>
		            <tr>
		                <th>회의 목적</th>
		                <td></td>
		            </tr>
		            <tr>
		                <th>예약자</th>
		                <td></td>
		            </tr>
		            <tr>
		                <th>기자재</th>
		                <td></td>
		            </tr>
		        </table>
		    </div>

 	</div>
 	
 	
 	
 	
 	
 	
 	
<div class="meetingmodal">
  <div class="roomModal-content">
	<h3>회의실 예약</h3>
	<div class="box-line"></div>
	<div class="room-btn-container">
		<c:forEach var="room" items="${roomList}">
			<button value="${room.room_idx}" class="btn-primary room-btn" data-photo="${room.photo}" data-name="${room.name}" data-capacity="${room.max_capacity}">${room.name}</button>
		</c:forEach>
	</div>
		<div id="room-image-container">
		    <img id="room-image" src="" alt="회의실 이미지"/>
		</div>
    <form>
	<input type="hidden" id="emp_idx" value="1" >
	
    
      <div class="form-group">
        <label class="la" for="room">회의실:</label>
		<p id="room-name"></p>
 		<input id="hidden-room-idx" value="" name="room_idx" type="hidden">
      </div>
      
      <div class="form-group max-capacity">
        <label class="la" for="room">회의실 수용 인원:</label>
		<p id="room-capacity"></p>
      </div>
      
      <!-- 회의실 기자재 동적 추가 -->
      <div class="form-group" id="room-material-List">

      </div>

	<!-- 추가 기자재 동적 생성 -->
	<div class="equipment-section">
	    <div class="equipment-title">
	        <button class="btn-primary material-add" type="button" onclick="addMaterial()">+ 기자재 추가</button>
	    </div>
	    <div id="equipment-list" class="equipment-list">
		
	    </div>
	</div>
      
      
      
      
      <div class="form-group">
        <label class="la" for="date">예약자:</label>
        <p class="emp-name">사원 이름 부서</p> 
      </div>
      
      <div class="form-group">
        <label class="la" for="date">날짜:</label>
        <input type="date" id="date" name="date" min="">
      </div>
      
		<div class="form-group">
			  <label class="la" for="start-time">시작 시간:</label>
			  <select id="start-time" name="start-time">
			  	<option value="">선택</option>
			  	<option>01:00</option>
			  	<option>02:00</option>
			  	<option>03:00</option>
			  	<option>04:00</option>
			  	<option>05:00</option>
			  	<option>06:00</option>
			  	<option>07:00</option>
			  	<option>08:00</option>
			  	<option>09:00</option>
			  	<option>10:00</option>
			  	<option>11:00</option>
			  	<option>12:00</option>
			  	<option>13:00</option>
			  	<option>14:00</option>
			  	<option>15:00</option>
			  	<option>16:00</option>
			  	<option>17:00</option>
			  	<option>18:00</option>
			  	<option>19:00</option>
			  	<option>20:00</option>
			  	<option>21:00</option>
			  	<option>22:00</option>
			  	<option>23:00</option>
			  	<option>24:00</option>
			  </select>
			
			  <label class="la" for="end-time">종료 시간:</label>
			  <select id="end-time" name="end-time">
			  	<option value="">선택</option>
			  	<option>01:00</option>
			  	<option>02:00</option>
			  	<option>03:00</option>
			  	<option>04:00</option>
			  	<option>05:00</option>
			  	<option>06:00</option>
			  	<option>07:00</option>
			  	<option>08:00</option>
			  	<option>09:00</option>
			  	<option>10:00</option>
			  	<option>11:00</option>
			  	<option>12:00</option>
			  	<option>13:00</option>
			  	<option>14:00</option>
			  	<option>15:00</option>
			  	<option>16:00</option>
			  	<option>17:00</option>
			  	<option>18:00</option>
			  	<option>19:00</option>
			  	<option>20:00</option>
			  	<option>21:00</option>
			  	<option>22:00</option>
			  	<option>23:00</option>
			  	<option>24:00</option>
			  </select>
		</div>
      <p class="sometext"></p>
      <div class="form-group">
        <label class="la" for="title">회의 제목:</label>
        <input type="text" id="title" name="title">
      </div>
      <div class="groupbtn">
      <button type="submit">예약</button>
      <button class="modalClose" type="button" onclick="closeModal()">취소</button>
      </div>
    </form>
  </div>
</div>
</body> 
<script>
let calendar;
document.addEventListener('DOMContentLoaded', function loadEvt() {
    var calendarEl = document.getElementById('calendar-room');


    calendar = new FullCalendar.Calendar(calendarEl, {
    	locale:"ko",
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,listMonth'
        },
        initialView: 'dayGridMonth',
        initialDate: new Date(),
/*        slotMinTime: '09:00:00', // 캘린더 시작 시간
        slotMaxTime: '18:00:00', // 캘린더 종료 시간
        businessHours: {
            daysOfWeek: [1, 2, 3, 4, 5], // 월~금
            startTime: '09:00',
            endTime: '18:00',
        }, */
        weekends: true,
        allDaySlot: false,
        editable: true,
        selectable: true,
        dateClick: function (info) {
            console.log("클릭된 날짜:", info.dateStr);

            // 캘린더의 모든 이벤트 가져오기
            const events = calendar.getEvents();
            console.log("캘린더에 로드된 이벤트:", events);

            if (events.length === 0) {
                console.error("캘린더에 로드된 이벤트가 없습니다.");
            }

            // 클릭된 날짜의 이벤트 필터링
            const filteredEvents = events.filter(event => {
                const eventDate = new Date(event.start.getTime() + 9 * 60 * 60 * 1000) // 9시간 더하기
                    .toISOString()
                    .split('T')[0]; // ISO 형식으로 변환 후 날짜 부분만 추출
                return eventDate === info.dateStr; // 클릭된 날짜와 비교
            });

            console.log("해당 날짜의 이벤트:", filteredEvents);

            // 회의실 예약 현황 리스트 업데이트
            const listContainer = document.querySelector('#reservation-list'); // 리스트 컨테이너 div
            listContainer.innerHTML = ""; // 기존 리스트 초기화

            filteredEvents.forEach(event => {
                const row = document.createElement('div'); // 각 행을 나타낼 div
                row.classList.add('table-row'); // 스타일링을 위해 클래스 추가
                row.classList.add('table-row-point'); // 스타일링을 위해 클래스 추가

                // 각 열을 나타내는 div 생성 및 추가
                const timeDiv = document.createElement('div');
                timeDiv.textContent = event.start.toLocaleTimeString('ko-KR', { 
                    hour: '2-digit', 
                    minute: '2-digit', 
                    hour12: false // 24시간 형식
                }) + ' ~ ' + 
                event.end.toLocaleTimeString('ko-KR', { 
                    hour: '2-digit', 
                    minute: '2-digit', 
                    hour12: false // 24시간 형식
                });
                row.appendChild(timeDiv);

                const roomDiv = document.createElement('div');
                roomDiv.textContent = event.extendedProps.room_name || '정보 없음';
                row.appendChild(roomDiv);

                const departDiv = document.createElement('div');
                departDiv.textContent = event.extendedProps.depart_name || '정보 없음';
                row.appendChild(departDiv);

                const rankDiv = document.createElement('div');
                rankDiv.textContent = event.extendedProps.rank_name || '정보 없음';
                row.appendChild(rankDiv);

                const reserverDiv = document.createElement('div');
                reserverDiv.textContent = event.extendedProps.name || '정보 없음';
                row.appendChild(reserverDiv);


                // 리스트 컨테이너에 추가
                listContainer.appendChild(row);

                // 클릭 이벤트 추가
                row.addEventListener('click', () => {
                    const detailTable = document.querySelector('.detail-table-container .detail-table');

                    // 디테일 컨테이너 업데이트
                    detailTable.innerHTML = 
                        '<tr>' +
                            '<th>시간</th>' +
                            '<td>' + event.start.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit', hour12: false }) + 
                            ' ~ ' + event.end.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit', hour12: false }) + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<th>회의실</th>' +
                            '<td>' + (event.extendedProps.room_name || '정보 없음') + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<th>회의 부서</th>' +
                            '<td>' + (event.extendedProps.depart_name || '정보 없음') + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<th>회의 목적</th>' +
                            '<td>' + (event.title || '정보 없음') + '</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<th>예약자</th>' +
                            '<td>' + (event.extendedProps.name || '정보 없음') + 
                            ' (' + (event.extendedProps.rank_name || '직급 없음') + ')</td>' +
                        '</tr>' +
                        '<tr>' +
                            '<th>추가 기자재</th>' +
                            '<td>' + (event.extendedProps.material || '정보 없음') + '</td>' +
                        '</tr>';

                    // 디테일 컨테이너 표시
                    document.querySelector('.detail-table-container').style.display = 'block';
                });
            });

            // 데이터가 없을 경우 메시지 표시
            if (filteredEvents.length === 0) {
                const row = document.createElement('div');
                row.classList.add('table-row'); // 스타일 추가
                row.textContent = "해당 날짜에 예약된 회의가 없습니다.";
                listContainer.appendChild(row);
            }
        },
/*         eventClick: function(arg) {
            if (confirm('일정을 삭제하시겠습니까?')) {
                const reserveIdx = arg.event.id; // FullCalendar 이벤트의 ID (reserve_idx)
                
                // 서버로 삭제 요청
                $.ajax({
                    url: 'removeCalendarEvents.ajax',
                    method: 'POST',
                    data: { reserve_idx: reserveIdx },
                    success: function(response) {
                        if (response.success) {
                            arg.event.remove(); // 캘린더에서 이벤트 제거
                        } else {
                            alert('일정 삭제에 실패했습니다.');
                        }
                    },
                    error: function() {
                        alert('삭제 요청 중 오류가 발생했습니다.');
                    }
                });
            }
        }, */
        events: function(info, successCallback, failureCallback) {
            $.ajax({
                url: 'getCalendarEvents.ajax',
                method: 'GET',
                data: {
                    start: info.start.toISOString(), // ISO 형식으로 변환된 시작 날짜
                    end: info.end.toISOString()     // ISO 형식으로 변환된 종료 날짜
                },
                success: function(response) {
                    console.log("서버 응답 데이터: ", response);

                    // FullCalendar 형식으로 데이터 변환
                    const events = response.map(event => {
                        console.log("이벤트 데이터 변환: ", event); // 여기서 각 이벤트 데이터를 확인
                        return {
                            id: event.id,
                            title: event.title,
                            start: event.start,
                            end: event.end,
                            extendedProps: {
                                room_idx: event.room_idx,
                                room_name: event.room_name,
                                name: event.name,
                                rank_idx: event.rank_idx,
                                rank_name: event.rank_name,
                                depart_idx: event.depart_idx,
                                depart_name: event.depart_name,
                                emp_idx: event.emp_idx,
                                material: event.material_quantities
                            }
                        };
                    });

                    console.log("변환된 이벤트 목록: ", events); // 변환된 배열 전체를 확인
                    successCallback(events); // FullCalendar에 전달
                },

                error: function() {
                    console.error("이벤트 데이터를 가져오는 데 실패했습니다.");
                    failureCallback(); // 실패 처리
                }
            });
        },
        eventContent: function(arg) {
            console.log("전체 이벤트 객체 확인:", arg.event);
            console.log("extendedProps 데이터 확인 (from _def):", arg.event._def.extendedProps);

            // `_def.extendedProps`에서 데이터 가져오기
            const extendedProps = arg.event._def.extendedProps;

            // 시간 포맷 설정
            const startTime = arg.event.start.toLocaleTimeString('ko-KR', {
                hour: '2-digit',
                minute: '2-digit'
            });

            const endTime = arg.event.end.toLocaleTimeString('ko-KR', {
                hour: '2-digit',
                minute: '2-digit'
            });
            console.log("startTime :", startTime);
            console.log("endTime :", startTime);
            console.log("extendedProps :", extendedProps);

            const roomName = extendedProps.room_name || '정보 없음';
            const reserverName = extendedProps.name || '알 수 없음';
            const rankName = extendedProps.rank_name || '직급 없음';

            console.log("렌더링 데이터 확인:", { roomName, reserverName, rankName, startTime, endTime });

            return {
                html: 
                    '<div class="event-box">' +
                        '<span>회의실: ' + roomName + '</span>' +
                        '<span>시간: ' + startTime + ' - ' + endTime + '</span>' +
                    '</div>'
            };
        }

    });

    calendar.render();
});

/* 
function saveCall(){
	
	
	
	$.ajax({
	    url: "your_url", // 요청을 보낼 서버의 URL
	    method: "GET", // 요청 방식 (GET, POST 등)
	    data: {
	        // 서버로 전송할 데이터 (key-value 형식)
	        param1: "value1",
	        param2: "value2"
	    },
	    success: function(response) {
	        // 요청이 성공했을 때 실행되는 함수
	        console.log(response); // 서버에서 받은 응답 데이터
	    },
	    error: function(xhr, status, error) {
	        // 요청이 실패했을 때 실행되는 함수
	        console.error(error);
	    }
	});
} */
function openModal() {
    document.querySelector('.meetingmodal').style.display = 'block';
}
function closeModal() {
    document.querySelector('.meetingmodal').style.display = 'none';
    document.getElementById('room-image').style.display='none';
    document.getElementById('room-name').innerHTML = '';
    document.getElementById('room-capacity').innerHTML= '';
    document.querySelector('.max-capacity').style.display = 'none';
    document.getElementById('hidden-room-idx').innerHTML = '';
    document.getElementById('room-material-List').innerHTML = '';


}

$(document).ready(function () {
	  const $startTimeSelect = $("#start-time");
	  const $endTimeSelect = $("#end-time");
	  const $form = $("form");
	  

	  $startTimeSelect.on("change",function(){
		    const startTime = $startTimeSelect.val();
		    const endTime = $endTimeSelect.val();
		  if (startTime >= endTime ) {
			  $(".sometext").text('시작시간은 종료시간보다 작아야 합니다.');
			  $startTimeSelect.val("01:00");			  
		}else{
			  $(".sometext").text('');
			  $endTimeSelect.val("01:00");			  

		}
		  
	  });
	  
	  
	  // 종료 시간 선택 시 검증
	  $endTimeSelect.on("change", function () {
	    const startTime = $startTimeSelect.val();
	    const endTime = $endTimeSelect.val();

	    if (endTime <= startTime) {
		  $(".sometext").text('종료 시간은 시작 시간보다 커야 합니다.');
	    }else{
			$(".sometext").text('');
	    }
	  });

	  // 폼 제출 시 검증
	  $form.on("submit", function (e) {
	    const startTime = $startTimeSelect.val();
	    const endTime = $endTimeSelect.val();

	    if (endTime <= startTime) {
	      e.preventDefault(); // 폼 제출 방지
	      alert("종료 시간이 시작 시간보다 커야 합니다.");
	    }
	  });
	});
	
$(document).ready(function () {
	  const $form = $("form");

	  $form.on("submit", function (e) {
	    e.preventDefault(); // 폼 기본 제출 방지

	    // FormData 객체 생성
	    const formMaterial = new FormData();

	    // 폼 데이터 가져오기 및 FormData에 추가
	    formMaterial.append("emp_idx", $("#emp_idx").val());
	    formMaterial.append("room_idx", $("#hidden-room-idx").val());
	    formMaterial.append("subject", $("#title").val());
	    formMaterial.append("startTime", $("#start-time").val());
	    formMaterial.append("endTime", $("#end-time").val());
	    formMaterial.append("date", $("#date").val());
	    
        // 필수 항목 폼 데이터 유효성 검사
		if (!$("#emp_idx").val()) {
		    alert("직원 번호를 입력해주세요.");
		    return;
		}
		if (!$("#hidden-room-idx").val()) {
		    alert("회의실 번호를 입력해주세요.");
		    return;
		}
		if (!$("#title").val()) {
		    alert("제목을 입력해주세요.");
		    return;
		}
		if (!$("#start-time").val()|| "") {
		    alert("시작 시간을 입력해주세요.");
		    return;
		}
		if (!$("#end-time").val()|| "") {
		    alert("종료 시간을 입력해주세요.");
		    return;
		}
		if (!$("#date").val()) {
		    alert("날짜를 입력해주세요.");
		    return;
		}
        
        
        const checkboxes = document.querySelectorAll('.material-checkbox:checked');
        if (checkboxes.length === 0) {
        	console.log("체크박스가 선택되지 않았습니다.");
		}else{
		    checkboxes.forEach(function(checkbox) {
		        const materialIdx = checkbox.value;
		        const quantityInput = document.querySelector('input[name="quantity_' + materialIdx + '"]');
		        const quantity = quantityInput.value;

		        formMaterial.append("materialIdxList", materialIdx);
		        formMaterial.append("quantityList", quantity);
		    });
		}
        
	    console.log(formMaterial);
	    // 서버에 데이터 저장
	    $.ajax({
	      url: "saveCalendar.ajax", // 서버의 엔드포인트 URL
	      method: "POST",
	      data:formMaterial,
	      processData: false,  
	      contentType: false,  
	      success: function (response) {
	        alert(response.msg);
	        
	        // 저장 후 캘린더에 이벤트 추가
	        closeModal(); // 모달 닫기
	        calendar.refetchEvents(); // 캘린더 새로고침
	      },
	      error: function (error) {
	        alert("저장 중 오류가 발생했습니다: " + error);
	      }
	    });
	  });
	});

/* 회의실 버튼 클릭 이미지 변동 구현 */
document.querySelectorAll('.room-btn').forEach(button => {
    button.addEventListener('click', function() {
        // 클릭된 버튼에서 data-photo 값 가져오기
        const photoUrl = this.getAttribute('data-photo');
        const roomName = this.getAttribute('data-name');
        const roomIdx = this.value;
        const roomCapacity = this.getAttribute('data-capacity');
        // 이미지 요소 가져오기
        const imageElement = document.getElementById('room-image');
        const ptagElement = document.getElementById('room-name');
        const ptagRoomCapacity= document.getElementById('room-capacity');
        document.querySelector('.max-capacity').style.display = 'block';
        document.getElementById('hidden-room-idx').value = roomIdx;

        if (photoUrl) {
        	ptagElement.textContent = roomName;
        	ptagRoomCapacity.textContent = roomCapacity;        
        	
            // 이미지 URL 설정
            imageElement.src ="/photo/"+photoUrl;
            imageElement.style.display = 'block'; // 이미지 표시
            
        } else {
            // 이미지 숨기기
            imageElement.style.display = 'none';
        }

        
	    $.ajax({
		      method: "POST",
		      url: "getRoomMaterial.ajax", 
		      data: {
		    	  "roomIdx" : roomIdx
		      },
		      dataType: 'json',
		      success: function (data) {
		        if (!data.msg) {
					drawRoomMaterialList(data.materialList);
                    //날짜 선택 조건

/* 			        const dateInput = document.getElementById("date");

			        // 날짜 선택 이벤트 리스너 등록
			        dateInput.addEventListener("change", function () {
			            if (dateInput.value) {
			                console.log("선택된 날짜:", dateInput.value);
			                selectDateOption(data.reserveList); // 날짜 선택 후 실행
			            }
			        }); */
			        console.log("날짜가 선택될 때까지 대기 중...");
                }else{
					alert(data.msg);
				}
		      },
		      error: function (error) {
		        alert("저장 중 오류가 발생했습니다: " + error);
		      }
		    });
    });
});

/* function selectDateOption(reserveList){
	
	
    const startTimeSelect = document.getElementById("start-time");
    const endTimeSelect = document.getElementById("end-time");
    const dateInput = document.getElementById("date");
    
    // 모든 옵션 초기화
    Array.from(startTimeSelect.options).forEach(option => option.disabled = false);
    Array.from(endTimeSelect.options).forEach(option => option.disabled = false);

    // 선택된 날짜 가져오기
    const selectedDate = dateInput.value; // 형식: YYYY-MM-DD
    
    
    // 예약된 시간에 따라 옵션 비활성화
    reserveList.forEach(reservation => {
        const reserveStart = new Date(reservation.start_datetime);
        const reserveEnd = new Date(reservation.end_datetime);

        Array.from(startTimeSelect.options).forEach(option => {
            const [hour, minute] = option.value.split(":").map(Number);

            // 옵션의 시간에 선택된 날짜를 추가하여 `Date` 객체 생성
            const optionTime = new Date(`${selectedDate}T${option.value}:00`);

            // 예약된 시간 범위에 포함되면 비활성화
            if (optionTime >= reserveStart && optionTime < reserveEnd) {
                option.disabled = true;
            }
        });

        Array.from(endTimeSelect.options).forEach(option => {
            const [hour, minute] = option.value.split(":").map(Number);

            // 옵션의 시간에 선택된 날짜를 추가하여 `Date` 객체 생성
            const optionTime = new Date(`${selectedDate}T${option.value}:00`);

            // 예약된 시간 범위에 포함되면 비활성화
            if (optionTime > reserveStart && optionTime <= reserveEnd) {
                option.disabled = true;
            }
        });
    });
	
} */

function drawRoomMaterialList(materialList) {
    const roomMaterialListDiv = document.getElementById("room-material-List");
    roomMaterialListDiv.innerHTML = '<label class="la">회의실 기자재:</label>';

    materialList.forEach(function(material) {
        roomMaterialListDiv.innerHTML += 
            '<span id="room-material">' + material.material_name + ' (' + material.quantity + ')' + '</span>';
    });
}

/* 기자재 추가 버튼 클릭시 기자재 추가 내용 내용 생성 */
function addMaterial(){
    const equipmentList = document.getElementById("equipment-list");
   
	if (equipmentList.children.length > 0) {
		 equipmentList.innerHTML = '';
		 return;
	}
	
    $.ajax({
	      method: "POST",
	      url: "getMaterial.ajax", 
	      data: {},
	      dataType: 'json',
	      success: function (data) {
	        if (!data.msg) {
				drawMaterialList(data.materials);
			}else{
				alert(data.msg);
			}
	      },
	      error: function (error) {
	        alert("오류가 발생했습니다: " + error);
	      }
	    });
}

function drawMaterialList(materials) {
    const equipmentList = document.getElementById("equipment-list");
    equipmentList.innerHTML = '';
    materials.forEach(function(material) {
    	equipmentList.innerHTML += 
    	    '<div class="equipment-item">' +
    	        '<label class="equipment-label">' +
    	            '<input type="checkbox" name="selectedMaterials" value="' + material.material_idx + '" class="material-checkbox">' +
    	            material.material_name + ' (잔여 수량: ' + material.remain_quantity + ')' +
    	        '</label>' +
    	        '<input type="number" name="quantity_' + material.material_idx + '" min="0" max="' + material.remain_quantity + '" placeholder="수량 입력" class="quantity-input">' +
    	    '</div>';
    });
}

// 시간 제약 조건 현재 날짜 이후만 예약 가능
document.addEventListener("DOMContentLoaded", function () {
  const dateInput = document.getElementById("date");
  const startTimeSelect = document.getElementById("start-time");
  const endTimeSelect = document.getElementById("end-time");

  // 현재 시간 객체 생성
  const now = new Date();

  // 한국 시간으로 조정 (UTC + 9시간)
  now.setHours(now.getHours());
  console.log("now: ", now);

  // 'YYYY-MM-DD' 형식으로 변환된 오늘 날짜
  const today = now
    .toLocaleDateString("ko-KR", {
      year: "numeric",
      month: "2-digit",
      day: "2-digit",
    })
    .replace(/\. /g, "-")
    .replace(/\./g, "");
  console.log("today", today);

  // 날짜 입력 필드에 최소 날짜 설정
  dateInput.setAttribute("min", today);

  // 날짜 선택 이벤트
  dateInput.addEventListener("change", function () {
    const selectedDate = dateInput.value;

    // 현재 시간 객체 생성 및 KST로 조정
    const currentTime = new Date();
    currentTime.setHours(currentTime.getHours());
    console.log("currentTime: ", currentTime);

    // 오늘 날짜인 경우만 필터링
    if (selectedDate === today) {
      const currentHour = currentTime.getHours(); // 현재 시간 (시)
      const currentMinute = currentTime.getMinutes(); // 현재 시간 (분)

      // 모든 옵션을 순회하며 활성화/비활성화
      Array.from(startTimeSelect.options).forEach((option) => {
        const [hour, minute] = option.value.split(":").map(Number);

        // 현재 시간 이후의 옵션만 활성화
        if (hour > currentHour || (hour === currentHour && minute > currentMinute)) {
          option.disabled = false; // 활성화
        } else {
          option.disabled = true; // 비활성화
        }
      });

      // 유효한 옵션이 없을 경우 초기값 선택
      if (!Array.from(startTimeSelect.options).some((opt) => !opt.disabled)) {
        startTimeSelect.value = "";
      }
    } else {
      // 오늘 날짜가 아닌 경우 모든 옵션 활성화
      Array.from(startTimeSelect.options).forEach((option) => {
        option.disabled = false;
      });
    }
  });

  // 시작 시간 선택 이벤트
  startTimeSelect.addEventListener("change", function () {
    const selectedStartTime = startTimeSelect.value; // 선택된 시작 시간

    if (!selectedStartTime) {
      // 시작 시간이 선택되지 않은 경우 모든 종료 시간 옵션 비활성화
      Array.from(endTimeSelect.options).forEach((option) => {
        option.disabled = true;
      });
      endTimeSelect.value = ""; // 종료 시간 초기화
      return;
    }

    const [selectedHour, selectedMinute] = selectedStartTime
      .split(":")
      .map(Number);

    // 종료 시간 옵션 활성화/비활성화
    Array.from(endTimeSelect.options).forEach((option) => {
      const [hour, minute] = option.value.split(":").map(Number);

      // 선택된 시작 시간 이후의 옵션만 활성화
      if (hour > selectedHour || (hour === selectedHour && minute > selectedMinute)) {
        option.disabled = false; // 활성화
      } else {
        option.disabled = true; // 비활성화
      }
    });

    // 유효한 옵션이 없을 경우 초기값 선택
    if (!Array.from(endTimeSelect.options).some((opt) => !opt.disabled)) {
      endTimeSelect.value = "";
    }
  });
});


</script>
</html>

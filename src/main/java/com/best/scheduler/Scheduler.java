package com.best.scheduler;

import java.time.LocalDate;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.best.alarm.AlarmService;
import com.best.attendance.AttendanceService;
import com.best.calendar.CalendarService;
import com.best.leave.LeaveService;

@EnableScheduling
@Component
public class Scheduler {
	
	Logger logger = LoggerFactory.getLogger(getClass());
    private final CalendarService calendarService;
    private final AttendanceService attendanceService;
    private final LeaveService leaveService;
    @Autowired private AlarmService alarmService;

    public Scheduler(CalendarService calendarService,AttendanceService attendanceService,LeaveService leaveService) {
        this.calendarService = calendarService;
    	this.attendanceService = attendanceService;
    	this.leaveService = leaveService;
    }
	
	@Scheduled(cron = "0 0 0 1 1 *")//매년 1월 1일 00:00:00 에 실행 휴일 데이터 저장하기
	public void insertHolidays() {
		calendarService.insertHolidays();
	}
	
	 
    //@Scheduled(cron = "*/10 * * * * *")
    @Scheduled(cron = "0 0 6 ? * MON-FRI")
	public void executeExcludingHolidays() {
	    LocalDate today = LocalDate.now();
	    List<LocalDate> holidays = calendarService.getHolidayCalculate();
	    // 출근 행 늘리기
	    if (!holidays.contains(today)) {
	    	attendanceService.insertAttendance(today);
	    }
	    
	}
	
	// 연차 체크
    //@Scheduled(cron = "*/10 * * * * *")
    @Scheduled(cron = "0 0 0 * * ?") 
    public void leaveCheck() {
    	leaveService.updateLeave();
    }
    
    // 결근 체크 한시 고정
    //@Scheduled(cron = "*/10 * * * * *")
    @Scheduled(cron = "0 0 13 ? * MON-FRI")
	public void checkAttendance() {
	    LocalDate today = LocalDate.now();
	    List<LocalDate> holidays = calendarService.getHolidayCalculate();
	    if (!holidays.contains(today)) {
	    	attendanceService.updateAbsent(today);
	    }
	}
	

    // 1분마다 실행 스케쥴 알림
    private boolean isRunning = false; // 중복 실행 방지 플래그

    @Scheduled(cron = "0 * * * * ?")
    public synchronized void checkForUpcomingEvents() {
        if (isRunning) {
            return; // 실행 중이면 종료
        }
        isRunning = true; // 실행 플래그 설정

        try {
            alarmService.sendUpcomingEventAlarms();
        } finally {
            isRunning = false; // 실행 플래그 해제
        }
    }
	
	// 결재 승인시 연차 소진로직 테스트용
//    @Scheduled(cron = "*/10 * * * * *")
//    public void ssssss() {
//    	leaveService.addLeaveHistory("1122");
//    }
	
	

}

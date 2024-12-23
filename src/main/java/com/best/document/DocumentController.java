package com.best.document;

import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DocumentController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired DocumentService documentService;

	// 전자결재 대기 리스트
	@RequestMapping(value="/documentPending.go")
	public String documentPending() {
		return "document/documentPending";
	}
	// 전자결재 진행중 리스트
	@RequestMapping(value="/documentBoard.go")
	public String documentBoard() {
		return "document/documentBoard";
	}
	// 전자결재 완료 리스트
	@RequestMapping(value="/documentApproved.go")
	public String documentApproved() {
		return "document/documentApproved";
	}
	// 전자결재 반려 리스트
	@RequestMapping(value="/documentReject.go")
	public String documentReject() {
		return "document/documentReject";
	}		
	// 전자결재 참조 리스트
	@RequestMapping(value="/documentReference.go")
	public String documentReference() {
		return "document/documentReference";
	}		
	// 전자결재 임시저장 리스트
	@RequestMapping(value="/documentDraft.go")
	public String documentDraft() {
		return "document/documentDraft";
	}
	
	
	// 전자결재 리스트 ajax
	@GetMapping(value="/documentList.ajax")
	@ResponseBody
	public Map<String, Object> inProgressList(String text, String page, String cnt) {
	    int page_ = Integer.parseInt(page);
	    int cnt_ = Integer.parseInt(cnt);
	    String status = "";
	    
	    switch (text) {
	        case "대기":
	            status = "상신";
	            return documentService.pendingList(page_, cnt_, status);
	        case "진행중":
	            status = "진행중";
	            return documentService.inProgressList(page_, cnt_, status);
	        case "완료":
	        	status = "완료";
	        	return documentService.approvedList(page_, cnt_, status);
	        case "반려":
	        	status = "반려";
	        	return documentService.rejectList(page_, cnt_, status);
	        case "참조":
	        	status = "참조";
	        	return documentService.referenceList(page_, cnt_, status);
	        case "임시저장":
	        	status = "임시저장";
	        	return documentService.draftList(page_, cnt_, status);
	        default:
	            logger.warn("알 수 없는 상태", text);
	            return new HashMap<String, Object>(); // 기본값 반환
	    }
	}
	
	
	// 임시저장 상세보기
	@GetMapping(value="/draftDetail.ajax")
	@ResponseBody
	public String draftDetail(String doc_idx) {
		String Detail = documentService.draftDetail(doc_idx);
		return Detail;		
	}
	// 임시저장 삭제
	@PostMapping(value="/documentDelete.ajax")
	@ResponseBody
	public Map<String, Object> draftDelete(String doc_idx) {
		Map<String, Object> response = new HashMap<>();
	    
		int row = documentService.draftDelete(doc_idx);
		if(row>0) {			
			response.put("success", true);
		}
	    return response;
	}

	
	// 전자결재 양식 불러오기
	@GetMapping(value="/getForm.ajax")
	@ResponseBody
	public String getForm(String form_subject) {
	    // 양식 내용 가져오기
	    String responseContent = documentService.getForm(form_subject);
	    
	    return responseContent;
	}
	
	// 결재 라인 추가하기
	@GetMapping(value = "/orgChartGet.ajax")
    @ResponseBody
    public String loadOrgChart(HttpServletRequest request, HttpServletResponse response) {
        try {
            // ByteArrayOutputStream을 사용하여 응답 내용을 캡처
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            PrintWriter writer = new PrintWriter(outputStream);

            // orgChart.jsp 페이지를 직접 include하여 처리
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/emp/orgChart.jsp");
            dispatcher.include(request, response);

            // ByteArrayOutputStream에 포함된 결과를 String으로 변환
            String htmlContent = new String(outputStream.toByteArray(), StandardCharsets.UTF_8);

            // 필요한 부분만 추출 (예: userbox만)
            String resultHtml = extractUserBox(htmlContent);
            return resultHtml;
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred";
        }
    }

    // 매개변수에 final 외의 수식어를 사용하지 않도록 수정
    private String extractUserBox(String html) {
        // HTML에서 userbox 부분만 추출하는 로직
        int startIndex = html.indexOf("<div class='userbox'>");
        int endIndex = html.indexOf("</div>", startIndex) + "</div>".length();
        return html.substring(startIndex, endIndex);
    }
    
    
    
	// 결재 기안, 임시저장
	@GetMapping(value="/formType.ajax")
	@ResponseBody
	public ResponseEntity<Map<String, String>> formType(String form_idx,
			String action, String doc_subject, String doc_content,
	        @RequestParam(required = false) String start_date,
	        @RequestParam(required = false) String end_date) {
		Map<String, String> response = new HashMap<String, String>();
		
		int emp_idx = 1;
		// 요청에 따른 처리 로직
		if ("기안".equals(action)) {
			// 기안 처리 로직
			response.put("message", "기안 완료");
		} else if ("임시저장".equals(action)) {
			logger.info("doc cont : {}", doc_content);
			documentService.formSave(form_idx, doc_subject, doc_content, emp_idx, "임시저장");
			response.put("message", "임시저장 완료");
		} 
		
		return ResponseEntity.ok(response);
	}	
	
	// 임시저장문서 수정
	@PostMapping(value="/formUpdate.ajax")
	@ResponseBody
	public ResponseEntity<Map<String, String>> formUpdate(String form_idx,
			String doc_subject, String doc_content,
	        @RequestParam(required = false) String start_date,
	        @RequestParam(required = false) String end_date, String doc_idx) {
		
		Map<String, String> response = new HashMap<String, String>();
		documentService.formUpdate(doc_subject, doc_content, doc_idx);
		response.put("message", "수정 완료");
		
		return ResponseEntity.ok(response);
	}
	
}

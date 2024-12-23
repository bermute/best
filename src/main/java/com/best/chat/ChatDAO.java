package com.best.chat;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.best.emp.EmployeeDTO;

@Mapper
public interface ChatDAO {

	void insertChat(ChatDTO chatDTO);

	void insertParty(PartyDTO loginPartyDTO);

	List<Map<String, Object>> chatList(Integer emp_idx);

	List<EmployeeDTO> getEmployeeList();

	void message(MessageDTO message);

	List<Map<String, Object>> getMessagesByChatIdx(int chatIdx);

	String getEmployeeName(int emp_idx);

	int checkEnterMessageExists(int chat_idx, String content);

	void insertParty(int chat_idx, int emp_idx);

	void insertEnterMessage(MessageDTO messageDTO);

	int checkPartyExists(int chat_idx, int emp_idx);

	List<Integer> getAllChatIdx();

	List<String> getParticipantNames(Integer chat_idx, Integer emp_idx);

	List<Map<String, Object>> getChatParticipants(int chat_idx);



}

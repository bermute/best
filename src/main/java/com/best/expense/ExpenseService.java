package com.best.expense;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExpenseService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ExpenseDAO expenseDao;
	
}

package com.user.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.DAO.AccountDAO;
import com.user.entity.Account;

@Service
public class AccountService {
	@Autowired
	private AccountDAO accountDAO;
	
	public void save(Account account) throws Exception {
		account.setCreated(new Date().getTime());
		accountDAO.save(account);
	}
	
	public void delete(Account account) throws Exception {
		accountDAO.delete(account);
	}

	public void update(Account account) throws Exception {
		accountDAO.update(account);
	}
	
	public void updateState(Account account) throws Exception {
		accountDAO.updateState(account);
	}
	
	public long count(String tj){
		return accountDAO.count(tj);
	}
	
	public Account findById(long id) throws Exception {
		return accountDAO.findById(id);
	}
	
	public List<Account> findByHQL(Account account, long startTime, long endTime) throws Exception {
		return accountDAO.findByHQL(account, startTime, endTime);
	}
}

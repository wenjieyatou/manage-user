package com.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.user.entity.Account;
import com.user.service.AccountService;
@Controller
@RequestMapping("/account")
public class AccountController {
	@Autowired
	private AccountService accountService;
	
	/**
	 * 添加
	 * @param account
	 * @return
	 */
	@RequestMapping("/save")
	public @ResponseBody Map<String, Object> save(@ModelAttribute("account") Account account){
		Map<String, Object> map = new HashMap<String, Object>();
		int state = 0;
		try {
			if(accountService.count(" and Coding='" + account.getCoding() + "'") > 0){
				state = -1;
				map.put("errormessage", "编码已存在");
			}else{
				accountService.save(account);
				state = 1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("errormessage", e.getMessage());
		}
		map.put("state", state);
		return map;
	}
	
	@RequestMapping("/index")
	public @ResponseBody String a(){
		return "indexsss";
	}
	/**
	 * 删除
	 * @param account
	 * @return
	 */
	@RequestMapping("/delete")
	public @ResponseBody Map<String, Object> delete(@ModelAttribute("account") Account account){
		Map<String, Object> map = new HashMap<String, Object>();
		int state = 0;
		try {
			if(account != null && account.getId() > 0){
				accountService.delete(account);
				state = 1;
			}
			state = 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("errormessage", e.getMessage());
		}
		map.put("state", state);
		return map;
	}
	
	/**
	 * 修改
	 * @param account
	 * @return
	 */
	@RequestMapping("/update")
	public @ResponseBody Map<String, Object> update(@ModelAttribute("account") Account account){
		Map<String, Object> map = new HashMap<String, Object>();
		int state = 0;
		try {
			if(account != null && account.getId() > 0){
				accountService.update(account);
				state = 1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("errormessage", e.getMessage());
		}
		map.put("state", state);
		return map;
	}
	
	/**
	 * 修改状态
	 * @param account
	 * @return
	 */
	@RequestMapping("/updateState")
	public @ResponseBody Map<String, Object> updateState(@ModelAttribute("account") Account account){
		Map<String, Object> map = new HashMap<String, Object>();
		int state = 0;
		try {
			if(account != null && account.getId() > 0){
				accountService.updateState(account);
				state = 1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("errormessage", e.getMessage());
		}
		map.put("state", state);
		return map;
	}
	
	/**
	 * 根据Id查询
	 * @param id
	 * @return
	 */
	@RequestMapping("/findById")
	public @ResponseBody Map<String, Object> findById(@RequestParam(defaultValue="0")long id){
		Map<String, Object> map = new HashMap<String, Object>();
		int state = 0;
		try {
			if(id > 0){
				Account account = accountService.findById(id);
				map.put("obj", account);
				state = 1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("errormessage", e.getMessage());
		}
		map.put("state", state);
		return map;
	}
	
	/**
	 * 查询列表
	 * @param account
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@RequestMapping("/findAll")
	public @ResponseBody Map<String, Object> findAll(@ModelAttribute("account")Account account, 
			@RequestParam(value = "startTime", defaultValue = "0")long startTime, @RequestParam(value = "endTime", defaultValue = "0")long endTime){
		Map<String, Object> map = new HashMap<String, Object>();
		int state = 0;
		try {
			List<Account> objs = accountService.findByHQL(account, startTime, endTime);
			map.put("objs", objs);
			state = 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("errormessage", e.getMessage());
		}
		map.put("state", state);
		return map;
	}
}

package com.user.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 账户
 * 
 * @author Administrator
 * 
 */
@Entity
@Table(name = "account")
public class Account {

	private long id;
	private String coding; // 编码
	private String name; // 名称
	private String remarks; // 备注
	private int state; // 状态
	private long created; // 创建时间
	private long lastLogin; // 最后登录时间
	private int type; // 账号类型
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "increment")
	@Column(name = "Id", unique = true, nullable = true, length = 50)
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	@Column(name = "Coding", unique = true, nullable = true, length = 50)
	public String getCoding() {
		return coding;
	}

	public void setCoding(String coding) {
		this.coding = coding;
	}

	@Column(name = "Name", length = 50)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "Remarks", length = 200)
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Column(name = "State", length = 4)
	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Column(name = "Created", length = 20)
	public long getCreated() {
		return created;
	}

	public void setCreated(long created) {
		this.created = created;
	}

	@Column(name = "LastLogin", length = 20)
	public long getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(long lastLogin) {
		this.lastLogin = lastLogin;
	}

	@Column(name = "Type", length = 4)
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}

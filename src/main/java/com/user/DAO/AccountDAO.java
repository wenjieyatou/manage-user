package com.user.DAO;

import java.math.BigInteger;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.user.entity.Account;

@Repository("accountDAO")
public class AccountDAO {
	@Resource
	public SessionFactory sessionFactory;

	public Session getSession() {
		Session session = sessionFactory.getCurrentSession();
		if (session == null) {
			session = sessionFactory.openSession();
		}
		return session;
	}

	public void save(Account account) throws Exception {
		this.getSession().save(account);
	}
	
	public long count(String tj){
		Query query = this.getSession().createSQLQuery("select count(id) from account where 1=1" + tj);
		return ((BigInteger)query.uniqueResult()).longValue();
	}
	
	public void delete(Account account) throws Exception {
		this.getSession().delete(account);
	}

	public void update(Account account) throws Exception {
		Query query = this.getSession().createQuery("update Account set name=?, state=?, type=?, remarks=? where id=?");
		query.setString(0, account.getName());
		query.setInteger(1, account.getState());
		query.setInteger(2, account.getType());
		query.setString(3, account.getRemarks());
		query.setLong(4, account.getId());
		query.executeUpdate();
	}
	
	public void updateState(Account account) throws Exception {
		Query query = this.getSession().createQuery("update Account set state=? where id=?");
		query.setInteger(0, account.getState());
		query.setLong(1, account.getId());
		query.executeUpdate();
	}
	
	public Account findById(long id) throws Exception {
		String hql = "from Account where id=?";
		Query query = this.getSession().createQuery(hql);
		query.setLong(0, id);
		return (Account) query.uniqueResult();
	}
	
	public List<Account> findByHQL(Account account, long startTime, long endTime) throws Exception {
		String sql = "from Account where 1=1";
		if(StringUtils.isNotEmpty(account.getCoding())){
			sql += " and Coding like '%" + account.getCoding() + "%'";
		}
		if(StringUtils.isNotEmpty(account.getName())){
			sql += " and Name like '%" + account.getName() + "%'";
		}
		if(account.getType() > 0){
			sql += " and Type=" + account.getType();
		}
		if(startTime > 0){
			sql += " and Created>=" + startTime;
		}
		if(endTime > 0){
			sql += " and Created<" + endTime;
		}
		Query query = this.getSession().createQuery(sql);
		return query.list();
	}
}

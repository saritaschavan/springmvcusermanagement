package com.jspiders.springmvcuser1.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.jspiders.springmvcuser1.pojo.UserPojo;

@Repository
public class UserRepository {
	
	private static EntityManagerFactory factory;
	private static EntityManager manager;
	private static EntityTransaction transaction;
	private static Query query;
	private static String queryjpql;
	
	private static void openConnection() {
		
		factory=Persistence.createEntityManagerFactory("user");
		manager=factory.createEntityManager();
		transaction=manager.getTransaction();
	}
	
	private static void closeConnection() {
		if(factory!=null) {
			factory.close();
		}
		if(manager!=null) {
			manager.close();
		}
		if(transaction.isActive()) {
			transaction.rollback();
		}
	}

	public UserPojo add(String name, String email, long contact, String city, String username, String password) {
		openConnection();
		transaction.begin();
		UserPojo pojo=new UserPojo();
		pojo.setName(name);
		pojo.setEmail(email);
		pojo.setContact(contact);
		pojo.setCity(city);
		pojo.setUsername(username);
		pojo.setPassword(password);
		manager.persist(pojo);
		transaction.commit();
		closeConnection();
		return pojo;
	}

	public UserPojo login(String username, String password) {
		openConnection();
		transaction.begin();
		queryjpql = "from UserPojo " + "where username = '" + username + "' " + "and password ='" + password + "'";
		query = manager.createQuery(queryjpql);
		List<UserPojo> list = query.getResultList();
		for(UserPojo pojo: list) {
			
			transaction.commit();
			closeConnection();
			return pojo;
		}
		transaction.commit();
		closeConnection();

		return null;
	}

	public UserPojo search(int id) {
		openConnection();
		transaction.begin();
		UserPojo pojo=manager.find(UserPojo.class, id);
		System.out.println(pojo);
		transaction.commit();
		closeConnection();
		return pojo;
	}

	public List<UserPojo> searchAll() {
		openConnection();
		transaction.begin();
		queryjpql="from UserPojo";
		query=manager.createQuery(queryjpql);
		List<UserPojo> pojo =query.getResultList();
		transaction.commit();
		closeConnection();
		return pojo;
	}

	public UserPojo remove(int id) {
		openConnection();
		transaction.begin();
		UserPojo pojo=manager.find(UserPojo.class, id);
		if(pojo !=null) {
		manager.remove(pojo);
		}
		transaction.commit();
		closeConnection();
		return pojo;
	}

	public UserPojo update(int id, String name, String email, long contact, String city, String username,
			String password) {
		openConnection();
		transaction.begin();
		UserPojo pojo=manager.find(UserPojo.class, id);
		pojo.setName(name);
		pojo.setEmail(email);
		pojo.setContact(contact);
		pojo.setCity(city);
		pojo.setUsername(username);
		pojo.setPassword(password);
		manager.persist(pojo);
		transaction.commit();
		closeConnection();
		 
		return pojo;
	}
	

}

package com.jspiders.springmvcuser1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspiders.springmvcuser1.pojo.UserPojo;
import com.jspiders.springmvcuser1.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
    private UserRepository repository;

	public UserPojo add(String name, String email, long contact, String city, String username, String password) {
		UserPojo pojo=repository.add(name,email,contact,city,username,password);
		return pojo;
	}

	public UserPojo login(String username, String password) {
		UserPojo pojo=repository.login(username, password);
		return pojo;
	}

	public UserPojo search(int id) {
		UserPojo pojo=repository.search(id);
		return pojo;
	}

	public List<UserPojo> searchAll() {
		List<UserPojo> pojos=repository.searchAll();
				return pojos;
	}

	public UserPojo remove(int id) {
		UserPojo pojo=repository.remove(id);
		return pojo;
	}

	public UserPojo update(int id, String name, String email, long contact, String city, String username,
			String password) {
		UserPojo pojo=repository.update(id, name, email, contact, city , username ,password);
		return pojo;
	}
	
}

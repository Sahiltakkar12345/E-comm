package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.User;
import com.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserRepository userRepo;
	
	@Override
	public User save(User s) {
		// TODO Auto-generated method stub
		return userRepo.save(s);
	}
	
	@Override
	public User findByEmail(String email) {
		
		return userRepo.findByEmail(email);
	}
		
}
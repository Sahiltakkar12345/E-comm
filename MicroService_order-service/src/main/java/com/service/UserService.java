package com.service;

import com.model.User;

public interface UserService {	
		public User save(User s);
		public User findByEmail(String s);
}

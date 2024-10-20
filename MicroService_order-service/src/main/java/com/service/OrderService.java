package com.service;

import java.util.List;

import com.model.Order;

public interface OrderService {	
		public Order save(Order s);
		public Order get(int oid);
		public List<Order> getAll();
		public void delete(int oid);
		public Order update(Order s);
}

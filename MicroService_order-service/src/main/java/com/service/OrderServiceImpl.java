package com.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.Order;
import com.model.Product;
import com.repository.OrderRepository;

@Service
public class OrderServiceImpl implements OrderService {
	
	
	  private final List<Order> orderList = new ArrayList<>(); // In-memory storage

		@Autowired
		OrderRepository orderRepository;
		
		@Override
		public Order save(Order s) {
			// TODO Auto-generated method stub
			return orderRepository.save(s);
		}

		@Override
		public Order get(int oid) {
			// TODO Auto-generated method stub
			 Optional<Order> userOptional = orderList.stream()
					.filter(Order -> Order.getId() == oid)
		            .findAny();
//		Optional<Order> obj=orderRepository.findById(oid);	
			return userOptional.orElse(null);
		}

		@Override
		public List<Order> getAll() {
			// TODO Auto-generated method stub
			return orderRepository.findAll();
		}

		@Override
		public void delete(int id) {
			 orderList.removeIf(Order -> Order.getId() == id);
			// TODO Auto-generated method stub
//			orderRepository.deleteById(id);
		}

		 @Override
		    public Order update(Order updatedOrder) {
		        Order existingOrder = get(updatedOrder.getId());
		        if (existingOrder != null) {
		            existingOrder.setName(updatedOrder.getName());
		            existingOrder.setAddress(updatedOrder.getAddress());
		            existingOrder.setProducts(updatedOrder.getProducts());// Update the product list
		        }
				return orderRepository.save(updatedOrder);
		    }
		
//		@Override
//		public Order update(Order s) {
//			// TODO Auto-generated method stub
//			 Order existingUser = get(Order.getId());
//		        if (existingUser != null) {
//		            existingUser.setName(Order.getName());
//		            existingUser.setAddress(user.getAddress());
//		        }
//			//			return orderRepository.save(s);
//		}
}

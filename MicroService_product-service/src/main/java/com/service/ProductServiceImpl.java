package com.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.Product;
import com.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {
	
		@Autowired
		ProductRepository productRepository;
		
		@Override
		public Product save(Product s) {
			// TODO Auto-generated method stub
			return productRepository.save(s);
		}

		@Override
		public Product get(int id) {
			// TODO Auto-generated method stub
		Optional<Product> obj=productRepository.findById(id);	
			return obj.get();
		}

		@Override
		public List<Product> getAll() {
			// TODO Auto-generated method stub
			return productRepository.findAll();
		}

		@Override
		public void delete(int id) {
			// TODO Auto-generated method stub
			productRepository.deleteById(id);
		}

		@Override
		public Product update(Product s) {
			// TODO Auto-generated method stub
			return productRepository.save(s);
		}
	}

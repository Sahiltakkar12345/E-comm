package com.service;

import java.util.List;

import com.model.Product;

public interface ProductService {	
		public Product save(Product s);
		public Product get(int id);
		public List<Product> getAll();
		public void delete(int id);
		public Product update(Product s);
}

package com.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Component
@Entity
@Table(name = "orders")
public class Order {

    @Id
    private int oid;
    private String name;
    private String address;
   
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    List<Product> products=new ArrayList<>();

	public int getId() {
		return oid;
	}

	public void setId(int id) {
		this.oid = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "Order [id=" + oid + ", name=" + name + ", address=" + address + ", products=" + products + "]";
	}

	public Order(int id, String name, String address, List<Product> products) {
		super();
		this.oid = id;
		this.name = name;
		this.address = address;
		this.products = products;
	}

	public Order() {
		super();
	}
}
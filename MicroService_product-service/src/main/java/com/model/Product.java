package com.model;

import java.beans.Transient;
import java.math.BigDecimal;
import java.util.Base64;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "products")
public class Product {	
	
    @Id
    private int id;
    private String name;
    private String description;
    private BigDecimal price;
    private int oid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", description=" + description + ", price=" + price + ", oid="
				+ oid + "]";
	}
	public Product(int id, String name, String description, BigDecimal price, int oid) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.oid = oid;
	}
	public Product() {
		super();
	}


}
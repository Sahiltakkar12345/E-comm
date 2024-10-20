package com.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;

import com.model.Product;
import com.repository.ProductRepository;
import com.service.ProductService;

import java.util.List;

@Controller
@RequestMapping("/api/product")
@RequiredArgsConstructor
public class ProductController {
	
	@Autowired
    private ProductService productService;
	
	@Autowired
	private ProductRepository productRepo;
    
	    @PostMapping
	    public Product createProduct(@RequestBody Product pro) {
	        return productRepo.save(pro);
	    }
	    
	    @GetMapping("/{id}") 
		  public Optional<Product> getStudent(@PathVariable int id) {
		  return productRepo.findById(id); }
	    
		@GetMapping("/") // for getting all products
		public List<Product> getall()
		{
			return productRepo.findAll();
		}
		

		
		  @DeleteMapping("/{id}") 
		  public void deleteProduct(@PathVariable int id) {
		  productRepo.deleteById(id); }
		 
		 
	   

	    @PutMapping("/{id}")
	    public Product updateProduct(@PathVariable int id, @RequestBody Product updatedProduct) {
	        updatedProduct.setId(id); // Set the ID to update the existing student
	        return productRepo.save(updatedProduct);
	    }


	    
	    @GetMapping("/editProduct{id}") 
		  public String editProduct(@PathVariable("id") Integer id,ModelMap model) {
		  Optional<Product> productOptional = productRepo.findById(id);
		  Product product = productOptional.get();
	      model.addAttribute("product", product);
		  return "editProduct";}
		 
	  @GetMapping("/UpdateProduct")
	 public String updateProduct(@RequestParam(value = "id") Integer id,
                  @RequestParam("name") String name,
                  @RequestParam("description") String description,
                  @RequestParam("price") BigDecimal price,
                  ModelMap model) {
		  if (id != null) {
			  Product existingOrder = productRepo.findById(id)
					  .orElseThrow(() -> new IllegalArgumentException("Invalid order ID"));
			  existingOrder.setName(name);
			  existingOrder.setDescription(description);
			  existingOrder.setPrice(price);
			  productRepo.save(existingOrder);
			  model.addAttribute("order", existingOrder);
		//	  return ""; // Redirect to the orders listing page
		  } else {
			  // Handle the case when oid is not provided (e.g., show an error page)
 return "errorPage"; // Adjust this to your actual error page
}
		  List<Product> product = productService.getAll();
	      model.addAttribute("product", product);
		  return "ListAllProduct";
	  }
	  
	  @GetMapping("/ListAllProducts") // for getting all products
		public String getallProducts(Model model)
		{
		  List<Product> product = productService.getAll();
	      model.addAttribute("product", product);
			return "ListAllProduct";
		}
	  
	  @GetMapping("/AddNewProduct")
	  public String AddNewProduct()
	  {
		  return "AddNewProduct";
	  }

	  @PostMapping("/saveProduct")
	    public String createProduct(
	            @RequestParam("id") int id,
	            @RequestParam("name") String name,
	            @RequestParam("description") String description,
	            @RequestParam("price") BigDecimal price,
	            @RequestParam("oid") int oid,
	            Model model) {

		  Product pro = new Product();
	        pro.setId(id);
	        pro.setName(name);
	        pro.setDescription(description);
	        pro.setPrice(price);
	        pro.setOid(oid);

	        productRepo.save(pro);
	        List<Product> product = productService.getAll();
		      model.addAttribute("product", product);
	         return "ListAllProduct";
	    }	 

	  @PostMapping("/DeleteProduct{id}") 
		  public String deleteProduct(@PathVariable("id") Integer id, Model model) {
		  productRepo.deleteById(id); 
		  List<Product> orders = productService.getAll();
	      model.addAttribute("orders", orders);
		  return "ListAllProduct";}
	  
	  @GetMapping("/BacktoOrders")
	  public String backtoOrders()
	  {
		  return "redirect:http://localhost:8080/api/order/ViewAllOrders";
	  }
	}
package com.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;


import com.model.Order;
import com.model.User;
import com.model.Product;
import com.repository.OrderRepository;
import com.repository.UserRepository;
import com.service.OrderService;

import java.util.List;

@Controller
@RequestMapping("/api/order")
@RequiredArgsConstructor
public class OrderController {
	
	@Autowired
    private OrderService orderService;
	
	@Autowired
	private OrderRepository orderRepo;
	
	@Autowired
	private UserRepository userRepository;
	

	  
	  @GetMapping("/login") 
	  public String Login() {
	  return "login"; }
	  
	  @GetMapping("/register") 
	  public String Register() {
	  return "register"; }
	  
	  @PostMapping("/processRegForm")
	    public String processRegForm(
	            @RequestParam String firstName,
	            @RequestParam String lastName,
	            @RequestParam String username,
	            @RequestParam String password,
	            @RequestParam String email,
	            @RequestParam String address) {
		  	User user = new User();
	        user.setFirstName(firstName);
	        user.setLastName(lastName);
	        user.setUsername(username);
	        user.setPassword(password);
	        user.setEmail(email);
	        user.setAddress(address);

	        userRepository.save(user);
	        // Save the user to the database
	        return "index"; // Redirect to a success page
	  }

	  
	  @PostMapping("/processLoginForm")
	    public String processLoginForm(@RequestParam("email") String email,
	                                   @RequestParam("password") String password,
	                                   HttpSession session,
	                                   Model model) {
	        // Validate user credentials against the database
	        User user = userRepository.findByEmail(email);
	        if (user != null && user.getPassword().equals(password)) {
	            // Valid credentials
	            session.setAttribute("user", user); // Store user in session (optional)
	            List<Order> orders = orderService.getAll();
	  	      model.addAttribute("orders", orders);
	            return "ViewDetails"; 
	        } else {
	            // Invalid credentials
	            model.addAttribute("loginError", "Invalid email or password");
	            return "login"; // Redirect back to login page with error message
	        }
	    }
	  
	  @GetMapping("/OrderRegistration") 
	  public String OrderReg() {
	  return "OrderRegistration"; }	  
	  	  
	  @PostMapping("/AddOrder")
	    public String createOrder(@RequestParam("oid") int oid,
                @RequestParam("name") String name,
                @RequestParam("address") String address) {
	    	 Order order = new Order();
	         order.setId(oid);
	         order.setName(name);
	         order.setAddress(address);
	         orderRepo.save(order);
	       //  return "dashboard";
	         return "ViewDetails";
	    }	  
	

	  	  
	  @GetMapping("/ViewAllOrders")
	  public String viewAllOrders(ModelMap model) {
	      List<Order> orders = orderService.getAll();
	      model.addAttribute("orders", orders);
	      return "ViewDetails"; // Return the JSP view name
	  }

	  @GetMapping("/SearchforView") 
	  public String SearchforView() {
	  return "SearchforView"; }
	  
	  @GetMapping("/SearchById")
	  public String searchForView(@RequestParam("oid") int orderId, ModelMap model) {
	      Optional<Order> orderOptional = orderRepo.findById(orderId);
	          Order order = orderOptional.get();
	          model.addAttribute("order", order);
	          return "ViewById";
	  }

	  
	  @GetMapping("/SearchforUpdate") 
	  public String SearchforUpdate() {
	  return "SearchforUpdate"; }


	  @PostMapping("/UpdateOrder")
	  public String updateOrder(@RequestParam(value = "oid") Integer oid,
	                           @RequestParam("name") String name,
	                           @RequestParam("address") String address,
	                           ModelMap model) {
	      if (oid != null) {
	          Order existingOrder = orderRepo.findById(oid)
	                  .orElseThrow(() -> new IllegalArgumentException("Invalid order ID"));
	          existingOrder.setName(name);
	          existingOrder.setAddress(address);
	          orderRepo.save(existingOrder);
	          model.addAttribute("order", existingOrder);
	          List<Order> orders = orderService.getAll();
		      model.addAttribute("orders", orders);
	          return "ViewDetails"; // Redirect to the orders listing page
	      } else {
	          // Handle the case when oid is not provided (e.g., show an error page)
	          return "errorPage"; // Adjust this to your actual error page
	      }
	  }
	  @PostMapping("/editOrder{oid}") 
		  public String editOrder(@PathVariable("oid") Integer id,ModelMap model) {
		  Optional<Order> orderOptional = orderRepo.findById(id);
          Order order = orderOptional.get();
          model.addAttribute("order", order);
		  return "editOrder";}

	
	  @GetMapping("/SearchforDelete") 
	  public String SearchforDelete() {
	  return "SearchforDelete"; }

	  @GetMapping("/DeleteOrder{oid}") 
	  public String deleteOrder(@PathVariable("oid") Integer id, Model model) {
	  orderRepo.deleteById(id); 
	  List<Order> orders = orderService.getAll();
      model.addAttribute("orders", orders);
	  return "ViewDetails";}
	  	  
	  @GetMapping("/editProduct{id}") 
	  public String editProduct(@PathVariable("id") Integer id,ModelMap model) {
	  return "redirect:http://localhost:8081/api/product/editProduct{id}";}
	
	  @GetMapping("/getProduct") 
	  public String editProducts() {
	  return "redirect:http://localhost:8081/api/product/";}
	
	  @GetMapping("/ListAllProducts") 
	  public String ListAllProducts() {
	  return "redirect:http://localhost:8081/api/product/ListAllProducts";}

// this is working in postman	  

	    @GetMapping("/{oid}") 
		  public Optional<Order> getOrder(@PathVariable int oid) {
		  return orderRepo.findById(oid); }
	    
		@GetMapping("/ViewDetails") // for getting all students
		public String getall()
		{
			List<Order> orders = orderService.getAll();

			return "ViewDetails";
		}
		

		
		  @DeleteMapping("/{oid}") 
		  public void deleteProduct(@PathVariable int id) {
		  orderRepo.deleteById(id); }
		 
		 
	   

	    @PutMapping("/{oid}")
	    public Order updateProduct(@PathVariable int oid, @RequestBody Order updatedOrder) {
	        updatedOrder.setId(oid); // Set the ID to update the existing student
	        return orderRepo.save(updatedOrder);
	    }

	}

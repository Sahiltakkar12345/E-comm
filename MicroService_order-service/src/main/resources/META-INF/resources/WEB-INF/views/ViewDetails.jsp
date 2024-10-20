 <%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
         <link rel="stylesheet"
        href=
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
 
 
     .btn {
            background-color: sky;
            border: 0px;
            padding: 12px 16px;
            font-size: 16px;
        }
          .btn:hover {
            background-color: ;
        }
    
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
             display: flex;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-top: 10px;
        }
        table {
        width: 90%;
            margin: 5px auto;
            border-collapse: collapse;
        }
         .split right {
    	margin-top: 20px;
  		}
  		table, th, td {
  border: 0;
}
        th, td {
            padding: 8px;
        /*     border: 1px solid #ccc; */
            text-align: center;
        }
         tr:nth-child(even) {
            background-color: #e0ebe3;
        }
        tr:nth-child(odd) {
 		 background-color: #ffffff;
		}
        th {
            background-color: #f2f2f2;
        }
  
        p {
            margin: 5px 0;
        }

  .sidenav {
            height: 100%; /* 100% Full-height */
            width: 250px; /* Set the width of the side navigation */
            position: fixed; /* Stay in place */
            z-index: 1; /* Stay on top */
            top: 0; /* Stay at the top */
            left: 0; /* Position on the left side */
            background-color: sky ; /* Black background */
            overflow-x: hidden; /* Disable horizontal scroll */
            padding-top: 50px; /* Place content 60px from the top */
            transition: 0.5s; /* Transition effect to slide in the sidenav */
        }
  .sidenav a {
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 25px;
            color: sky;
            display: block;
            transition: 0.3s;
        }

        /* When you mouse over the navigation links, change their color */
        .sidenav a:hover {
            color: sky;
        }
          .sidenav .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 100px;
        }
         #main {
            transition: margin-left 0.5s;
            padding: 40px;
          }
            .split {
            height: 100%;
            width: 10%;
            position: fixed;
            z-index: 1;
            top: 0;
            overflow-x: hidden;
            padding-top: 60px;
        }

        /* Control the left side (navigation) */
        .left {
            left: 0;
            background-color: #374957;
             width: 200px;
   			 height: 100vh;
    		overflow: auto;
    		padding-top: 20px;
        }

        /* Control the right side (data) */
        .right {
            right: 0;
              width: 90%; 
            background-color: #f8f8f8;
        }        
        
        
        
        
        
        
        
        /* Dropdown Button */
.dropbtn {
   /*  background-color: sky;
    color: White;
    */
     padding: 16px;
    font-size: 18px;
    border: none;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: relative;
    background-color: sky;
    min-width: 10px;
    text-color: white;
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
    z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
    color: white;
    padding: 8px 8px;
    text-decoration: none;
    display: block;
    font-size: 20px;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
    background-color: sky;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
    background-color: sky;
}
        
        
        
    </style>
   <!-- Add any necessary CSS or other resources here -->

</head>
<body>
<div class="split left">
<div id="mySidenav" class="sidenav">

<div class="dropdown">
    <button class="dropbtn">Orders</button>
    <div class="dropdown-content">
        <a href="OrderRegistration">Add Order</a>
        <a href="SearchforView">Search By Id</a>
        <a href="ViewAllOrders">ViewAllOrder</a>
    </div>
</div><br>
<div class="dropdown">
    <button class="dropbtn">Products</button>
    <div class="dropdown-content">
        <a href="ListAllProducts">ViewAllProduct</a>
    </div>
</div>




</div></div>
<div class=main-content>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <div class="split right">
<table border="1">
    <tr>
        <th>Order ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Products</th>
  		<th>operations</th>
    </tr>
    <c:forEach items="${requestScope.orders}" var="order">
        <tr>
            <td><c:out value="${order.getId()}" /></td>
            <td><c:out value="${order.getName()}" /></td>
            <td><c:out value="${order.getAddress()}" /></td>
            <td>
            <c:forEach items="${order.products}" var="product">
         <a href="editProduct${product.id}" >
         			<p>Product Id: <c:out value="${product.id}" /></p> </a>
                    <p>Name: <c:out value="${product.name}" /></p>
                    <p>Description: <c:out value="${product.description}" /></p>
                    <p>Price: <c:out value="${product.price}" /></p>
                    <br/>
            </c:forEach>
            </td>
            <td>
      <div>         
    <form action="editOrder${order.id}" method="post" >
    <button type="submit" class="btn"><i class="fa fa-pencil"></i></button>
   </form>
               
    <form action="DeleteOrder${order.id}" onclick="showConfirmation()">
    <button type="submit" class="btn"><i class="fa fa-trash"></i></button>
    
    <script>
      function showConfirmation() {
          var result = confirm("Are you sure you want to delete this employee?");
          if (result) {
        	  window.location.href='DeleteOrder${order.id }';
          }
          return false; 
      }
  </script>
	</form>
  </div>              
            </td>
        </tr>
    </c:forEach>
</table>
</div></div>
</body>
</html>
 

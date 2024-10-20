<%@page import="com.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
        }
        h1 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }
        table {
        width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 0px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
            color: sky;
 			padding: 8px;
  			text-align: center;
        }
        table, th, td {
 		 border: 0;
		}
        tr:nth-child(even) {
            background-color: #f8f8f8;
        }
        tr:nth-child(odd) {
 		 background-color: #ffffff;
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
            padding-top: 60px; /* Place content 60px from the top */
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
        }

        /* Control the right side (data) */
        .right {
            right: 0;
              width: 90%; 
            background-color: sky;
        }        
        img
        {
        	height:40px;
        	width:60px;
        }
        
        
        
        
        
        
              
       /* Dropdown Button */
.dropbtn {
  /*   background-color: sky;
    color: White; */
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
/* .dropbtn:after {
    content: "	↓";
}

    */     
    </style>
     
  
             
    </head>
<body>
<div class="navbar">
<div class="split left">
<div id="mySidenav" class="sidenav">

<div class="dropdown">
    <button class="dropbtn">Orders</button>
    <div class="dropdown-content">
        <a href="BacktoOrders">ViewAllOrder</a>
    </div>
</div><br>
<div class="dropdown">
    <button class="dropbtn">Products</button>
    <div class="dropdown-content">
     <a href="AddNewProduct">Add Product</a>
        <a href="ListAllProducts">View All Product</a>
    </div>
</div>
</div>

  
</div></div>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <div class="main-content">
   <div class="split right">
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!--  <form action="BacktoOrders" style="float: left;">
    <button type="submit">Back to Order Details</button>
   </form>
     <form action="AddNewProduct" style="margin-top:1px;  float: right;">
    <button type="submit">Add New Product</button>
   </form> -->
<table border="">
    <tr>
        <th>Product ID</th>
<!--         <th>Image</th> -->
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
  		<th>operations</th>
    </tr>
    <c:forEach items="${requestScope.product}" var="product">
        <tr>
            <td><c:out value="${product.getId()}" /></td>
    <%--         <td><img src="${product.getImage()}"></td> 
          <%--   <td><img src="data:image/jpg;base64,${product.getImageBase64()}"></td> --%>
            <td><c:out value="${product.getName()}" /></td>
            <td><c:out value="${product.getDescription()}" /></td>
            <td><c:out value="${product.getPrice()}" /></td>        
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

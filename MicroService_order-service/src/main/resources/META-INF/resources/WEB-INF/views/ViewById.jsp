<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Details</title>
    <style>
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
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f8f8f8;
        }
        p {
            margin: 5px 0;
        }
    </style>
    
</head>
<body>
    <h1>Order Details</h1>
    <table border="1">
        <tr>
            <th>Order ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Products</th>
        </tr>
        <tr>
            <td><c:out value="${order.id}" /></td>
            <td><c:out value="${order.name}" /></td>
            <td><c:out value="${order.address}" /></td>
            <td>
            <c:forEach items="${order.products}" var="product">
                    <p>Product Id: <c:out value="${product.id}" /></p>
                    <p>Name: <c:out value="${product.name}" /></p>
                    <p>Description: <c:out value="${product.description}" /></p>
                    <p>Price: <c:out value="${product.price}" /></p>
                    <br/>
            </c:forEach>
            </td>
             
        </tr>
    </table>
</body>
</html>
 
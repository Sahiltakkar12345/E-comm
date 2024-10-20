<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

    <style>
       #header a {
       margin: 80px;
       padding: 50px;
    font-family: Arial, sans-serif;
    font-size: 16px;
    color: #333;
    text-decoration: none;
    margin-right: 20px; 
    margin-top: 50px;
    margin-bottom: 0px;
}

        #header a:hover {
    color: #007bff; /* Change color on hover */
}
#header {
    padding: 8px 0; /* Add padding to top and bottom */
    margin-bottom: 10px; /* Add some space below the header */
}

#header {
            text-align: center;
            background-color: lightgreen;
            padding: 10px 0;
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
        }
        #header a.active {
    	font-weight: bold;
		}
	#header a:hover {
    background-color: lime;
	}

    </style>



</head>
<body>
<div id="header">
    <a href="OrderRegistration">Order Registration</a>
    <a href="SearchforDelete">Delete Data</a>
    <a href="SearchforUpdate">Update Data</a> 
    <a href="SearchforView">View Data By Id</a>
    <a href="ViewAllOrders">View All Data</a>
    <a href="AddNewProduct">Add New Product</a>
</div>

</body>
</html>
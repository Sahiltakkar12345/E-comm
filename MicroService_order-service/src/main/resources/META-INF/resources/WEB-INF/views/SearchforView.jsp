<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
 .update {
            width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 2px solid #ccc;
            border-radius: 10px;
            background-color: #bfebec;
        }
        /* CSS styles for input fields */
        .input-field {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            background-color: #0074d9;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
<link rel="stylesheet" href="Css/Style.css" />

</head>
<body>
<div class="update">
<h2>View Product Details</h2>
	<form action="SearchById" method="Get">
		<label for="oid">Order ID</label>
		<input type="number" name="oid">
		
		<input type="submit">
	</form>
	</div>
</body>
</html>
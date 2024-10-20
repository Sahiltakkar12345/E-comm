<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Product</title>
    <style>
        /* Style for the form container */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        /* Style for the form itself */
        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Style for input fields */
        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        /* Style for submit button */
        button[type="submit"] {
            background-color: #3CBC8D;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #2E9E6D;
        }
    </style>
</head>
<body>
    <h1>Add New Product</h1>
    <form action="saveProduct" method="post" enctype="multipart/form-data">
        <label for="id">Product ID:</label>
        <input type="text" id="id" name="id" required>
         
        <label for="name">Product Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="description">Product Description:</label>
        <textarea id="description" name="description" rows="4" required></textarea>

        <label for="price">Product Price:</label>
        <input type="number" id="price" name="price" step="0.01" required>

        <label for="oid">Order Id:</label>
        <input type="number" id="oid" name="oid" required>

 
       
        <button type="submit">Save Product</button>
    </form>
</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="ISO-8859-1">
    <title>Registration Form</title>
    <style>
        /* CSS styles for the registration form container */
        .registration-container {
            width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 2px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        /* CSS styles for input fields */
        .input-field {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
        }
    </style>
   
</head>
<body>
    <div class="registration-container">
        <h2>Registration Form</h2>
        <form action="AddOrder" method="post">
            <label for="oid">Order ID:</label>
            <input type="number" id="oid" name="oid" class="input-field" required><br>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" class="input-field" required><br>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" class="input-field" required><br>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Registration Form</title>
   <!-- Include Bootstrap CSS -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   <!-- Include Font Awesome -->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
   <style>
       /* Additional custom styles */
       .registration-container {
           max-width: 600px;
           margin: 30px auto;
           padding: 20px;
           border: 1px solid #ccc;
           border-radius: 15px;
           background-color: #f9f9f9;
       }
       .form-control {
           height: auto;
           padding: 10px;
       }
       .form-group {
           margin-bottom: 15px;
       }
       .btn-primary {
           width: 100%;
           padding: 10px;
       }
       .btn-primary:hover {
           background-color: #0056b3;
       }
   </style>
</head>
<body>
    <div class="container">
        <div class="registration-container">
            <h2 class="text-center">Registration Form</h2>
            <form action="AddOrder" method="post">
                <div class="form-group">
                    <label for="oid"><i class="fas fa-receipt"></i> Order ID:</label>
                    <input type="number" id="oid" name="oid" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="name"><i class="fas fa-user"></i> Name:</label>
                    <input type="text" id="name" name="name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="address"><i class="fas fa-address-card"></i> Address:</label>
                    <input type="text" id="address" name="address" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary">Register</button>
            </form>
        </div>
    </div>

    <!-- Include Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
 
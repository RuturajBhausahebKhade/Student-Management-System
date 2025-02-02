<%@page import="com.ruturaj.studentmanagement.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Admin Details</title>
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap")
	;

body {
	font-family: "Poppins", sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	
}

.nav {
	width: 100%;
	background-color: #333;
	padding: 15px 0;
	text-align: center;
	color: white;
	font-size: 25px;
	/* font-weight: bold; */
	position: absolute;
	top: 0;
}

.container {
	max-width: 400px;
	margin: 150px auto;
	background: white;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	color: #333;
	text-align: center;
	margin-bottom: 30px;
	font-weight: 500;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	color: #555;
	font-weight: 300;
}

input[type="text"], input[type="email"], input[type="password"] {
	width: 100%;
	padding: 12px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 16px;
}

input[readonly] {
	background-color: #f8f9fa;
	cursor: not-allowed;
}

.button-group {
	display: flex;
	gap: 15px;
	margin-top: 25px;
	justify-content: center;
}

.btn {
	padding: 12px 30px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	transition: opacity 0.3s;
}

.btn-primary {
	background-color: #009879;
	color: white;
}

.btn-secondary {
	background-color: #607D8B;
	color: white;
	text-decoration: none;
	display: inline-block;
	text-align: center;
}

.btn-primary:hover{
	background-color: #006a54 ;
}


.btn-secondary:hover{
	background-color: #546E7A;
}

</style>
</head>
<body>
	<div class="nav">Student Management System</div>
	<div class="container">
		<h1>Edit Admin Details</h1>
		<%
		Admin admin = (Admin) request.getAttribute("admin");
		%>
		<form action="./update-admin" method="post">
			<div class="form-group">
				<label for="adminId">Admin ID</label> <input type="text"
					id="adminId" name="id" value="<%=admin.getId()%>" readonly
					class="id-field">
			</div>

			<div class="form-group">
				<label for="email">Email Address</label> <input type="email"
					id="email" name="email" value="<%=admin.getEmail()%>"
					placeholder="Enter updated email">
			</div>

			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					id="password" name="password" value="<%=admin.getPassword()%>"
					placeholder="Enter new password">
			</div>

			<div class="button-group">
				<a href="home" class="btn btn-secondary">Back to Home</a>
				<button type="submit" class="btn btn-primary">Update Admin</button>
				
			</div>
		</form>
	</div>
</body>
</html>
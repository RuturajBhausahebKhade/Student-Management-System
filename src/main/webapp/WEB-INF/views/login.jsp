<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login Page</title>

<!-- Font Awesome CDN link for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<style>
/* Importing Google Fonts - Poppins */
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

body {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	padding: 10px;
	background: #f2f7fa;
	overflow: hidden;
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

.wrapper {
	max-width: 450px;
	width: 100%;
	background: #fff;
	border-radius: 5px;
	box-shadow: 0px 4px 10px 1px rgba(0, 0, 0, 0.1);
}

.wrapper .title {
	height: 120px;
	background: #fff;
	border-radius: 5px 5px 0 0;
	color: #0e0e0e;
	font-size: 30px;
	font-weight: 600;
	display: flex;
	align-items: center;
	justify-content: center;
}

.wrapper form {
	padding: 25px 35px;
}

.wrapper form .row {
	height: 50px;
	margin-top: 15px;
	position: relative;
}

.wrapper form .row input {
	height: 100%;
	width: 100%;
	outline: none;
	padding-left: 70px;
	border-radius: 5px;
	border: 1px solid lightgrey;
	font-size: 18px;
	transition: all 0.3s ease;
}

form .row input:focus {
	border-color: #16a085;
}

form .row input::placeholder {
	color: #999;
}

.wrapper form .row i {
	position: absolute;
	width: 55px;
	height: 100%;
	color: #fff;
	font-size: 22px;
	background: #009879;
	border: 1px solid #009879;
	border-radius: 5px 0 0 5px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.wrapper form .pass {
	margin-top: 12px;
}

.wrapper form .pass a {
	color: #999;
	font-size: 17px;
	text-decoration: none;
}

.wrapper form .pass a:hover {
	text-decoration: underline;
}

.wrapper form .button input {
	margin-top: 20px;
	color: #fff;
	font-size: 18px;
	font-weight: 300;
	padding-left: 0px;
	background: #009879;
	border: 1px solid #009879;
	cursor: pointer;
}

form .button input:hover {
	background: #005b48;
}

.wrapper form .signup-link {
	text-align: center;
	margin-top: 45px;
	font-size: 17px;
}

.wrapper form .signup-link a {
	color: #009879;
	text-decoration: none;
}

form .signup-link a:hover {
	text-decoration: underline;
}

/* Message Styling */
.message {
	text-align: center;
	font-size: 18px;
	font-weight: 500;
	color: #FF4B2B; /* Highlight color */
	margin-top: 15px;
	padding: 10px;
	
</style>

</head>
<body>
	<div class="nav">Student Management System</div>
	<div class="wrapper">
		<div class="title">
			<span>Login Form</span>
		</div>
		<form action="./auth-admin" method="post">
			<div class="row">
				<i class="fas fa-user"></i> <input type="text" name="email"
					placeholder="Email" required />
			</div>
			<div class="row">
				<i class="fas fa-lock"></i> <input type="password" name="password"
					placeholder="Password" required />
			</div>
			<div class="pass">
				<a href="#">Forgot password?</a>
			</div>
			<div class="row button">
				<input type="submit" value="Login" />
			</div>
			<div class="signup-link">
				Not a member? <a href="sign-up-page">Signup now</a>
			</div>
		</form>
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<div class="message"><%=message%></div>
		<%
		}
		%>
	</div>
</body>
</html>
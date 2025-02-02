<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Font Awesome CDN link for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<title>Login & Sign Up</title>
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap")
	;

* {
	box-sizing: border-box;
}

body {
	background: #f6f5f7;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-family: "Poppins", sans-serif;
	height: 100vh;
	margin: -20px 0 50px;
}

.nav {
	width: 100%;
	background-color: #333;
	padding: 15px 0;
	text-align: center;
	color: white;
	font-size: 25px;
	position: absolute;
	top: 0;
}

h1 {
	font-weight: 600;
	margin: 0;
	margin-bottom: 20px;
}

.hel {
	font-weight: bold;
	margin: 0;
	position: relative;
	top: 0px;
}

h2 {
	text-align: center;
}

.txt {
	font-size: 17px;
	font-weight: 100;
	line-height: 20px;
	letter-spacing: 0.5px;
	margin: 20px 0 30px;
}

span {
	font-size: 12px;
}

a {
	color: #999;
	font-size: 17px;
	text-decoration: none;
	margin: 15px 0;
}

button {
	border-radius: 20px;
	border: 1px solid #009879;
	background-color: #009879;
	color: #FFFFFF;
	font-size: 17px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

button:active {
	transform: scale(0.95);
}

button:focus {
	outline: none;
}

button.ghost {
	background-color: transparent;
	border-color: #FFFFFF;
	position: relative;
	top: -10px;
}

form {
	background-color: #FFFFFF;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	text-align: center;
}


.container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	position: relative;
	overflow: hidden;
	width: 768px;
	max-width: 100%;
	min-height: 480px;
}

.form-container {
	position: absolute;
	top: 0;
	height: 100%;
	transition: all 0.6s ease-in-out;
}

.sign-in-container {
	left: 0;
	width: 50%;
	z-index: 2;
}

.container.right-panel-active .sign-in-container {
	transform: translateX(100%);
}

.sign-up-container {
	left: 0;
	width: 50%;
	opacity: 0;
	z-index: 1;
}

.container.right-panel-active .sign-up-container {
	transform: translateX(100%);
	opacity: 1;
	z-index: 5;
	animation: show 0.6s;
}

@
keyframes show { 0%, 49.99% {
	opacity: 0;
	z-index: 1;
}

50


%
,
100


%
{
opacity


:


1
;


z-index


:


5
;


}
}
.overlay-container {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: hidden;
	transition: transform 0.6s ease-in-out;
	z-index: 100;
}

.container.right-panel-active .overlay-container {
	transform: translateX(-100%);
}

.overlay {
	background: #FF416C;
	background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C);
	background: linear-gradient(to right, #FF4B2B, #FF416C);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 0 0;
	color: #FFFFFF;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
	transform: translateX(50%);
}

.overlay-panel {
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 40px;
	text-align: center;
	top: 0;
	height: 100%;
	width: 50%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.overlay-left {
	transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
	transform: translateX(0);
}

.overlay-right {
	right: 0;
	transform: translateX(0);
}

.container.right-panel-active .overlay-right {
	transform: translateX(20%);
}

.overlay-panel p {
	position: relative;
	top: 3px;
}

form .row {
	height: 50px;
	margin-top: 15px;
	position: relative;
}

form .row input {
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

form .row i {
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

.message {
	text-align: center;
	font-size: 18px;
	font-weight: 500;
	color: #FF4B2B; /* Highlight color */
	margin-top: 15px;
	padding: 10px;
}
</style>
</head>
<body>
	<div class="nav">Student Management System</div>
	<div class="container" id="container">
		<div class="form-container sign-in-container">
			<form action="./add-admin" method="post">
				<h1>Sign in</h1>
				<div class="row">
					<i class="fas fa-user"></i> <input type="text" name="email"
						placeholder="Email" required />
				</div>
				<div class="row">
					<i class="fas fa-lock"></i> <input type="password" name="password"
						placeholder="Password" required />
				</div>
				<a href="#">Forgot your password?</a>
				<button type="submit">Sign In</button>
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
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-right">
					<h1 class="hel">Hello!</h1>
					<p class="txt">Enter your personal details and start journey
						with us</p>
					<p class="text">Already have an account?</p>
					<a href="login-page"><button class="ghost" id="signUp">Login</button></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

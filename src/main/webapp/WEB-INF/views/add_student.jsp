<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Student</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
/* Previous CSS remains the same */
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
	background-color: #f0f2f5;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
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

.main {
	margin-top: -20px;
}

.form-container {
	margin-top: 50px;
	background-color: white;
	padding: 2rem;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	width: 100%;
	height: 600px;
	max-width: 500px;
}

h1 {
	text-align: center;
	color: #171818;
	margin-bottom: 2rem;
	font-weight: 500;
	position: relative;
	top: -15px;
}

.form-group {
	margin-bottom: 1.5rem;
}

label {
	display: block;
	margin-bottom: 0.5rem;
	color: #5f6368;
	font-weight: 500;
}

.input-wrapper {
	position: relative;
}

.input-wrapper i {
	position: absolute;
	left: 15px;
	top: 50%;
	transform: translateY(-50%);
	color: #5f6368;
	font-size: 1rem;
}

input, select {
	width: 100%;
	padding: 0.8rem 0.8rem 0.8rem 40px;
	border: 1px solid #dadce0;
	border-radius: 5px;
	font-size: 1rem;
	transition: border-color 0.2s;
}

select {
	padding-left: 40px;
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
}

.course-wrapper::after {
	content: "\f078";
	font-family: "Font Awesome 6 Free";
	position: absolute;
	right: 15px;
	top: 50%;
	transform: translateY(-50%);
	color: #009879;
	pointer-events: none;
}

input:focus, select:focus {
	outline: none;
	border-color: #009879;
	box-shadow: 0 0 0 2px #99c3ba;
}

input:focus ~ i {
	color:#009879;
}

/* Rest of the previous CSS remains unchanged */
.button-group {
	display: flex;
	gap: 1rem;
	margin-top: 2rem;
}

button {
	flex: 1;
	padding: 1rem;
	border: none;
	border-radius: 5px;
	font-size: 1rem;
	font-weight: 500;
	cursor: pointer;
	transition: background-color 0.2s;
}

.add-btn {
	background-color: #009879;
	color: white;
}

.add-btn:hover {
	background-color: #006a54 ;
}

.back-btn {
	background-color: #607D8B;
	color: white;
}

.back-btn:hover {
	background-color: #546E7A;
}

.error {
	color: #d93025;
	font-size: 0.875rem;
	margin-top: 0.25rem;
	margin-bottom: -22px;
	display: none;
}

.error.show {
	display: block;
}

.success-message {
	color: #188038;
	text-align: center;
	margin-top: 1rem;
	display: none;
}

.success-message.show {
	display: block;
}
</style>
</head>
<body>
	<div class="nav">Student Management System</div>
	<div class="form-container">
		<h1>Add New Student</h1>
		<form class="main" id="studentForm" action="./add-student"
			method="post">
			<div class="form-group">
				<label for="name">Full Name</label>
				<div class="input-wrapper">
					<i class="fas fa-user"></i> <input type="text" name="name"
						id="name" placeholder="Enter full name">
				</div>
				<div class="error" id="nameError">Please enter a valid name</div>
			</div>

			<div class="form-group">
				<label for="email">Email</label>
				<div class="input-wrapper">
					<i class="fas fa-envelope"></i> <input type="email" name="email"
						id="email" placeholder="Enter email">
				</div>
				<div class="error" id="emailError">Please enter a valid email</div>
			</div>

			<div class="form-group">
				<label for="mobile">Mobile Number</label>
				<div class="input-wrapper">
					<i class="fas fa-phone"></i> <input type="tel" name="mobile"
						id="mobile" placeholder="Enter mobile number">
				</div>
				<div class="error" id="mobileError">Please enter a valid
					10-digit number</div>
			</div>

			<div class="form-group">
				<label for="course">Course</label>
				<div class="input-wrapper course-wrapper">
					<i class="fas fa-book"></i> <select name="course" id="course">
						<option value="">Select Course</option>
						<option value="Development">Development</option>
						<option value="Testing">Testing</option>
					</select>
				</div>
				<div class="error" id="courseError">Please select a course</div>
			</div>

			<div class="button-group">
				<a href="home">
					<button type="button" class="back-btn"
						onclick="window.location.href='#'">Back to Home</button>
				</a>
				<button type="submit" class="add-btn" onclick="validateForm()">
					<i class="fas fa-plus-circle"></i> Add Student
				</button>
			</div>
		</form>
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<div class="success-message" id="successMessage"><%=message%></div>
		<%
		}
		%>
	</div>

	<script>
        // Previous JavaScript remains the same
        function validateForm() {
            const name = document.getElementById('name').value.trim();
            const email = document.getElementById('email').value.trim();
            const mobile = document.getElementById('mobile').value.trim();
            const course = document.getElementById('course').value;
            
            let isValid = true;

            // Reset errors
            document.querySelectorAll('.error').forEach(error => error.classList.remove('show'));
            document.getElementById('successMessage').classList.remove('show');

            // Name validation
            if (name === '') {
                document.getElementById('nameError').classList.add('show');
                isValid = false;
            }

            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                document.getElementById('emailError').classList.add('show');
                isValid = false;
            }

            // Mobile validation
            const mobileRegex = /^\d{10}$/;
            if (!mobileRegex.test(mobile)) {
                document.getElementById('mobileError').classList.add('show');
                isValid = false;
            }

            // Course validation
            if (course === '') {
                document.getElementById('courseError').classList.add('show');
                isValid = false;
            }
        }
    </script>
</body>
</html>
<%@page import="com.ruturaj.studentmanagement.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>
<style>
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
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
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

.form-container {
	background: white;
	margin-top:75px;
	padding: 2rem;
	border-radius: 10px;
	box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 500px;
}

h1 {
	color: #1a1a1a;
	text-align: center;
	margin-bottom: 1rem;
	font-size: 1.8em;
	font-weight: 500;
}

.form-group {
	margin-bottom: 1.5rem;
}

label {
	display: block;
	margin-bottom: 0.5rem;
	color: #404040;
	font-weight: 500;
}

.input-field {
	width: 100%;
	padding: 0.5rem;
	border: 1px solid #cccccc;
	border-radius: 5px;
	font-size: 1rem;
	transition: border-color 0.3s ease;
}

.input-field:focus {
	outline: none;
	border-color: #007bff;
	box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
}

.radio-group {
	display: flex;
	gap: 1.5rem;
	margin-top: 0.5rem;
}

.radio-option {
	display: flex;
	align-items: center;
}

.radio-option input[type="radio"] {
	margin-right: 0.5rem;
	width: 1.1em;
	height: 1.1em;
	accent-color: #007bff;
}

.btn-container {
	display: flex;
	flex-direction: column;
	gap: 1rem;
	margin-top: 2rem;
}

.btn {
	padding: 0.5rem 1rem;
	border: none;
	border-radius: 5px;
	font-size: 1rem;
	font-weight: 500;
	cursor: pointer;
	transition: opacity 0.3s ease;
}

.btn-primary {
	background-color:#009879;
	color: white;
}

.btn-secondary {
	background-color: #607D8B;
	color: white;
	text-decoration: none;
	text-align: center;
}

.btn:hover {
	opacity: 0.9;
}

.readonly-field {
	background-color: #f8f9fa;
	cursor: not-allowed;
}
</style>
</head>
<body>
	<div class="nav">Student Management System</div>
	<div class="form-container">
		<h1>Edit Student Details</h1>
		<%
		Student student = (Student) request.getAttribute("student");
		%>
		<form action="./update-student" method="post">
			<div class="form-group">
				<label>Student ID</label> <input type="text" name="id"
					value="<%=student.getId()%>" readonly
					class="input-field readonly-field">
			</div>

			<div class="form-group">
				<label>Full Name</label> <input type="text" name="name"
					value="<%=student.getName()%>" class="input-field"
					placeholder="Enter full name">
			</div>

			<div class="form-group">
				<label>Email</label> <input type="email" name="email"
					value="<%=student.getEmail()%>" class="input-field"
					placeholder="Enter email address">
			</div>

			<div class="form-group">
				<label>Mobile Number</label> <input type="text" name="mobile"
					value="<%=student.getMobile()%>" class="input-field"
					placeholder="Enter mobile number">
			</div>

			<div class="form-group">
				<label>Course</label>
				<div class="radio-group">
					<div class="radio-option">
						<input type="radio" name="course" value="DEVELOPEMENT" id="dev"
							<%=student.getCourse().equals("DEVELOPEMENT") ? "checked" : ""%>>
						<label for="dev">Development</label>
					</div>
					<div class="radio-option">
						<input type="radio" name="course" value="TESTING" id="test"
							<%=student.getCourse().equals("TESTING") ? "checked" : ""%>>
						<label for="test">Testing</label>
					</div>
				</div>
			</div>

			<div class="btn-container">
				<button type="submit" class="btn btn-primary">Update
					Student</button>
				<a href="students" class="btn btn-secondary">Back to All
					Students</a>
			</div>
		</form>
	</div>
</body>
</html>
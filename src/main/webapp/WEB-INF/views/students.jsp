<%@page import="com.ruturaj.studentmanagement.dto.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All students page</title>
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap")
	;

body {
	font-family: "Poppins", sans-serif;
	margin: 0;

	background-color: #f4f4f4;
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

.container {
	max-width: 1200px;
	margin: 100px auto;
	background-color: white;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 25px 0;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
}

th, td {
	padding: 15px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #009879;
	color: white;
	text-transform: uppercase;
	font-size: 0.9em;
}

tr:hover {
	background-color: #f5f5f5;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

.action-links a {
	display: inline-block;
	padding: 6px 12px;
	margin: 0 5px;
	border-radius: 4px;
	text-decoration: none;
	font-weight: 500;
	transition: all 0.3s;
}

.edit-link {
	background-color: #4CAF50;
	color: white;
}

.delete-link {
	background-color: #f44336;
	color: white;
}

.edit-link:hover {
	background-color: #45a049;
}

.delete-link:hover {
	background-color: #da190b;
}

.message {
	padding: 15px;
	margin: 20px 0;
	text-align:center;
	border-radius: 4px;
	background-color: #e8f5e9;
	color: #2e7d32;
	font-weight: 500;
}

.home-link {
	display: inline-block;
	position:relative;
	left:500px;
	padding: 10px 20px;
	background-color: #607D8B;
	color: white;
	text-decoration: none;
	border-radius: 4px;
	margin-top: 20px;
	transition: background-color 0.3s;
}

.home-link:hover {
	background-color: #546E7A;
}

@media screen and (max-width: 600px) {
	table {
		border: 0;
		overflow-x: auto;
		display: block;
	}
	.container {
		padding: 15px;
	}
}
</style>
</head>
<body>
	<div class="nav">Student Management System</div>
	<div class="container">
		<%
		Student s = (Student) request.getAttribute("student");
		if (s != null) {
		%>
		<table>
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Course</th>
				<th colspan="2">Action</th>
			</tr>
			<tr>
				<td><%=s.getName()%></td>
				<td><%=s.getEmail()%></td>
				<td><%=s.getMobile()%></td>
				<td><%=s.getCourse()%></td>
				<td class="action-links"><a class="edit-link"
					href="edit-student?id=<%=s.getId()%>">Edit</a> <a
					class="delete-link" href="delete-student?id=<%=s.getId()%>">Delete</a>
				</td>
			</tr>
		</table>
		<%
		}
		%>
		<%
		@SuppressWarnings("unchecked")
		List<Student> students = (List<Student>) request.getAttribute("students");
		if (students != null) {
		%>
		<table>
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Course</th>
				<th colspan="2">Action</th>
			</tr>
			<%
			for (Student student : students) {
			%>
			<tr>
				<td><%=student.getName()%></td>
				<td><%=student.getEmail()%></td>
				<td><%=student.getMobile()%></td>
				<td><%=student.getCourse()%></td>
				<td class="action-links"><a class="edit-link"
					href="edit-student?id=<%=student.getId()%>">Edit</a> <a
					class="delete-link" href="delete-student?id=<%=student.getId()%>">Delete</a>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<%
		}
		%>

		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<div class="message">
			<%=message%>
		</div>
		<%
		}
		%>
		<a href="home" class="home-link">Back to Home</a>
	</div>
</body>
</html>
<%@page import="com.ruturaj.studentmanagement.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
	integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>EduTrack</title>
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

/* Transparent Navigation Styles */
.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 1rem 5%;
	background-color: white;
	position: fixed;
	width: 100%;
	top: 0;
}

.navbar.scrolled {
	background: rgba(0, 0, 0, 0.7);
	/* Semi-transparent background on scroll */
}

.logo {
	font-size: 24px;
	font-weight: 700;
	color: #405262;
	/* color: rgb(247, 158, 165); */
}

.nav-links {
	display: flex;
	gap: 2rem;
}

.nav-links a {
	text-decoration: none;
	color: #394958;
	font-weight: 500;
	transition: color 0.3s;
}

.nav-links a:hover {
	color: #e74c3c;
}

/* Hero Section with Slideshow */
.hero {
	height: 92.5vh;
	width: 100%;
	margin-top: 60px;
	position: relative;
	overflow: hidden;
}

.slideshow {
	position: absolute;
	width: 100%;
	height: 100%;
}

.slide {
	position: absolute;
	width: 100%;
	height: 100%;
	background-size: cover;
	background-position: center;
	opacity: 0;
	transition: opacity 1s ease-in-out;
}

.slide::after {
	content: '';
	position: absolute;
	width: 100%;
	height: 100%;
	background: linear-gradient(rgba(44, 62, 80, 0.8), rgba(44, 62, 80, 0.8));
}

.slide.active {
	opacity: 1;
}

.hero-content {
	position: relative;
	z-index: 2;
	max-width: 800px;
	padding: 2rem;
	color: white;
	text-align: center;
	margin: 0 auto;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.hero h1 {
	font-size: 2.5rem;
	margin-bottom: 1.5rem;
	line-height: 1.3;
	font-weight: 500;
}

.hero p {
	font-size: 1.1rem;
	margin-bottom: 2rem;
	line-height: 1.6;
}

/* Button Styles */
.cta-buttons {
	display: flex;
	gap: 1rem;
	justify-content: center;
}

.btn {
	padding: 0.8rem 2rem;
	border-radius: 25px;
	text-decoration: none;
	font-weight: bold;
	transition: transform 0.3s;
}

.btn-primary {
	background-color: #e74c3c;
	color: white;
}

.btn-secondary {
	background-color: #3498db;
	color: white;
}

.btn:hover {
	transform: translateY(-2px);
}

/* Responsive Design */
@media ( max-width : 768px) {
	.nav-links {
		display: none;
	}
	.hero h1 {
		font-size: 2rem;
	}
	.cta-buttons {
		flex-direction: column;
	}
}
</style>
</head>
<body>
	<%
	Admin admin = (Admin) session.getAttribute("authenticated_admin");
	int id = admin.getId();
	%>
	<section class="hero">
		<nav class="navbar">
			<div class="logo">
				<i class="fa-solid fa-building-columns"></i> <span
					style="color: rgb(233, 32, 32);">Edu</span>Track
			</div>
			<div class="nav-links">
				<a href="add-student-page">Add Student</a> <a href="students">All
					Students</a> <a href="edit-admin?id=<%=id%>">Edit Account</a> <a
					href="delete-admin?id=<%=id%>">Delete Account</a> <a href="logout">Logout</a>
			</div>
		</nav>
		<div class="slideshow">
			<div class="slide"
				style="background-image: url('https://images.unsplash.com/photo-1522202176988-66273c2fd55f')"></div>
			<div class="slide"
				style="background-image: url('https://images.unsplash.com/photo-1546410531-bb4caa6b424d')"></div>
			<div class="slide"
				style="background-image: url('https://images.unsplash.com/photo-1581726707445-75cbe4efc586')"></div>
		</div>
		<div class="hero-content">
			<h1>
				Welcome to the <br> Student Management System
			</h1>
			<p>Effortlessly manage student information with our efficient and
				user-friendly system. Track student details, attendance, grades, and
				more all in one place. Designed for administrators, teachers, and
				students to streamline academic management with ease.</p>

			<div class="cta-buttons">
				<a href="#know-more" class="btn btn-primary">Know More</a> <a
					href="#request-demo" class="btn btn-secondary">Get Started</a>
			</div>
		</div>
	</section>
	<%
	String message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<h4><%=message%></h4>
	<%
	}
	%>

	<script>
        // Slideshow functionality
        let currentSlide = 0;
        const slides = document.querySelectorAll('.slide');

        function showNextSlide() {
            slides[currentSlide].classList.remove('active');
            currentSlide = (currentSlide + 1) % slides.length;
            slides[currentSlide].classList.add('active');
        }

        // Initialize slideshow
        slides[0].classList.add('active');
        setInterval(showNextSlide, 5000);

        // Mobile menu toggle
        const navbar = document.querySelector('.navbar');
        const navLinks = document.querySelector('.nav-links');

        window.addEventListener('scroll', () => {
            if (window.scrollY > 50) {
                navbar.style.background = 'rgba(255,255,255,0.95)';
            } else {
                navbar.style.background = '#fff';
            }
        });

        // Initialize smooth scroll
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>
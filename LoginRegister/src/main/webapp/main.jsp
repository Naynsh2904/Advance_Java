<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>

<body class="bg-primary-subtle">

	<%--login form --%>
	<nav>
		<div
			class="d-flex justify-content-center align-item-center bg-primary-subtle py-2  border-bottom border-dark">
			<h2 class="fw-bold ">Login Form</h2>
		</div>
	</nav>

	<%--Login form --%>
	<div class=" loginForm ">
		<div class="container my-5">
			<form action="#" method="get">
				<div class="form-floating mb-3">
					<input type="email" class="form-control" name="email"> <label>Email
						address</label>
				</div>

				<div class="form-floating mb-3">
					<input type="password" class="form-control" name="password">
					<label>Password</label>
				</div>

				<div>
					<button class="form-control btn btn-outline-dark" name="sbt_btn">SUBMIT</button>
				</div>
			</form>
		</div>
	</div>

	<%--<table class=" container table table-bordered table-hover pt-5">
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Password</th>
			<th>City</th>
			<th>photo</th>
			
		</tr>  --%>

	<%
	try {
		if (request.getParameter("sbt_btn") != null) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdata", "root", "root");
			PreparedStatement ps = con.prepareStatement("select * from table1 where email=? AND password =?");

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
	%>
	<div class="container alert alert-success mt-3">
		Login Successful! Welcome,
		<%=rs.getString("name")%>!
	</div>
	<%
	} else {
	%>
	<div class="container">
		<div class="alert alert-danger mt-3">Invalid email or
			password.</div>
		<a href="InsertData.jsp">Register here</a>
	</div>
	<%
	}
	}
	}

	catch (Exception e) {
	out.println("<div class='container alert alert-danger mt-3'>Error: " + "try again" + "</div>");
	}
	%>
</body>
</html>
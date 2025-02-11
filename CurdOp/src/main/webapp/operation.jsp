<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

</head>
<body>

	<nav class="Justify-content-center py-3 bg-primary-subtle">
		<div class="text-center">
			<h1>Registration Form</h1>
		</div>
	</nav>

	<div class="container py-5">
		<form action="#" method="get">
			<label>Name</label> <input type="text" name="name"
				class="form-control mb-3"> <label>Email</label> <input
				type="email" name="email" class="form-control mb-3"> <label>Password</label>
			<input type="password" name="pass" class="form-control mb-3">

			<label>City</label> <input type="text" name="city"
				class="form-control mb-3"> <label>Your Photo</label> <input
				type="url" name="img" class="form-control mb-4">

			<button type="submit" name="reg"
				class="form-control py-2 btn btn-outline-warning fw-bolder">
				SUBMIT</button>
		</form>
	</div>

	<%
	String url = "jdbc:mysql://localhost:3306/jspData";
	String dbUser = "root";
	String dbPass = "root";
	Connection con = null;

	try {

		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(url, dbUser, dbPass);

		if (request.getParameter("reg") != null) {
			String NAME = request.getParameter("name");
			String EMAIL = request.getParameter("email");
			String PASS = request.getParameter("pass");
			String CITY = request.getParameter("city");
			String PHOTO = request.getParameter("img");

			PreparedStatement ps = con
			.prepareStatement("insert into table1 (name , email , password , city , Photo) values ('" + NAME
					+ "' , '" + EMAIL + "' , '" + PASS + "' , '" + CITY + "' ,'" + PHOTO + "')");

			ps.executeUpdate();

			out.print("<script>alert('Registration Successfull!!!!!!!!!!!')</script>");
		}

		/*if (request.getParameter("delete") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			PreparedStatement ps = con.prepareStatement("delete from table1 where id=?");
			ps.setInt(1, id);
			ps.executeUpdate();
			out.print("<script>alert('Successfully Data Delete !! ')</script>");
		}*/
	%>

	<div class="container">

		<table class="table table-bordered">
			<tr>
				<th>Sr. No.</th>
				<th>NAME</th>
				<th>EMAIL</th>
				<th>PASSWORD</th>
				<th>CITY</th>
				<th>PHOTO</th>
				<th>UPDATE/DELETE</th>
			</tr>

			<%
			PreparedStatement ps = con.prepareStatement("select * from table1");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
			%>

			<tr>
				<td class="text-center"><%=rs.getString("id")%></td>
				<td class="text-center"><%=rs.getString("name")%></td>
				<td class="text-center"><%=rs.getString("email")%></td>
				<td class="text-center"><%=rs.getString("password")%></td>
				<td class="text-center"><%=rs.getString("city")%></td>
				<td class="text-center"><img width="120px"
					src="<%=rs.getString("photo")%>"></td>
				<td class="d-flex">

					<form action="#" method="get">
						<input type="hidden" name="id" value="<%=rs.getInt("id")%>" />
					</form>

					<form class="form-control" action="#" method="get">
						<div style="" id="shows">
							<input type="hidden" name="id" value="<%=rs.getInt("id")%>" /> 
							<input class="form-control" value="<%=rs.getString("name")%>" name="name" type="text" /> 
							<input class="form-control" value="<%=rs.getString("email")%>" name="email" type="email" />
							<input class="form-control" value="<%=rs.getString("password")%>" name="password" type="password" /> 
							<input class="form-control" value="<%=rs.getString("city")%>" name="password" type="password" /> 
							<input class="form-control" value="<%=rs.getString("photo")%>" name="photo" type="url" />
							<div class="d-flex justify-content-evenly pt-2">
							<button type="submit" class="btn btn-success" name="update">Update</button>
							<button type="submit" name="delete" class="btn btn-danger">Delete</button>
							</div>
						</div>
					</form>
				</td>
			</tr>

			<%
			}
			
			
			/*if (request.getParameter("delete") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			PreparedStatement ps = con.prepareStatement("delete from table1 where id=?");
			ps.setInt(1, id);
			ps.executeUpdate();
			out.print("<script>alert('Successfully Data Delete !! ')</script>");
		}*/

			
			%>


			<%
			} catch (Exception e) {
			out.print("<script>alert('erorrorrororororor')</script>");

			}
			%>
		</table>
	</div>
</body>
</html>
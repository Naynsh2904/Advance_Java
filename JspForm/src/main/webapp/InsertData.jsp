<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

			<button type="submit" name="btn"
				class="form-control py-2 btn btn-outline-warning fw-bolder">
				SUBMIT</button>
		</form>
	</div>


	<%
	if (request.getParameter("btn") != null) {
		String Name = request.getParameter("name");
		String Email = request.getParameter("email");
		String Password = request.getParameter("pass");
		String City = request.getParameter("city");
		String Photo = request.getParameter("img");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspData", "root", "root");
			Statement st = con.createStatement();
			st.executeUpdate("insert into table1 (name , email , password , city , Photo) values ('" + Name + "' , '"
			+ Email + "' , '" + Password + "' , '" + City + "' ,'" + Photo + "')");
	%>
	<script>
		alert("Submitted!!!")
	</script>

	<%
	} catch (Exception e) {

	}
	}
	%>
	
	
	<table class=" container table table-bordered table-hover">
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Password</th>
			<th>City</th>
			<th>photo</th>
			
		</tr>
		<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspData", "root", "root");
		PreparedStatement ps = con.prepareStatement("select * from table1");
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			
		try{
			if(request.getParameter("submit")!=null){
				String Name = rs.getString("name");
				String Email = rs.getString("email");
				String Pass = rs.getString("password");
				String City = rs.getString("city");
				String Img = rs.getString("photo");
				
				HttpSession ses = request.getSession();
				ses.setAttribute("name", Name);
				ses.setAttribute("email", Email);
				ses.setAttribute("password", Pass);
				ses.setAttribute("city", City);
				ses.setAttribute("imgphot", Img);
				
				response.sendRedirect("Demo1.jsp");
			}
		}catch(Exception e){
			e.getMessage();
		}

		%>
		   <tr>
		     <td><%=rs.getString("name") %> </td>
		     <td><%=rs.getString("email") %></td>
		     <td><%=rs.getString("password") %></td>
		     <td><%=rs.getString("city") %></td>
		     <td><img width="100" class="img-fluid" src="<%=rs.getString("photo") %>" /></td>
		     <td><button type="submit" name="delete" class="btn btn-danger p-2 rounded-pill">Delete</button></td>
		     <td><button type="submit" name="Update" class="btn btn-info p-2 rounded-pill">Delete</button></td>
		  </tr>
		<%
		}
		%>

	</table>
</body>

</html>
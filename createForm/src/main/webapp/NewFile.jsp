<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
  <title>Document</title>
  <style>
    * {
      margin: 0;
      padding: 0;
    }

    a {
      text-decoration: none;
      color: black;
    }

    li {
      list-style: none;
    }
  </style>
</head>

<body>
  <div>

    <nav>
      <ul class="d-flex justify-content-evenly py-3 bg-secondary-subtle ">
        <li><a href="#">Home</a></li>
        <li><a href="#">Home</a></li>
        <li><a href="#">Home</a></li>
        <li><a href="#">Home</a></li>
        <li><a href="#">Home</a></li>
      </ul>
    </nav>
    <form action="Getdata" method="get">
      <div class="container py-5">
        Name: <input class="form-control" type="text" name="name" value="" placeholder="Enter your name"/><br>
        Email: <input class="form-control" type="email" name="email" value="" placeholder="Enter your email" /><br>
        Address: <input type="text" name="address" class="form-control" value="" placeholder="Enter your address"><br>
        City: <input type="text" name="city" class="form-control" placeholder="Enter your city" ><br>
        state: <input class="form-control" type="text" name="state" value="" placeholder="Enter your state"><br>
        pincode: <input type="text" name="pin" value="" placeholder="Enter your pincode" class="form-control"><br>
        Password: <input class="form-control" type="password" name="password" value="" /><br>
        <div class="pb-3">
          Male: <input class="" type="radio" name="gender" value="male" /><br>
          Female: <input class="" type="radio" name="gender" value="female" /><br>
        </div>
        contact: <input class="form-control" type="contact" name="contact" value="" /><br>
        <div>
          <button type="submit" name="btn" class="form-control btn btn-outline-success">Submit</button>
        </div>
      </div>
    </form>

  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
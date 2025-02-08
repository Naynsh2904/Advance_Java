package log;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Login")
public class Login extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if (req.getParameter("LoginBtn") != null) {
			
			String Email = req.getParameter("email");
			String Pass = req.getParameter("pass");
			
			try {
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				Connection conect = DriverManager.getConnection("jdbc:mysql://localhost:3306/Createform", "root","root");
				
				
				
			} catch (Exception e) {
				e.getMessage();
			}
			
		}
	}

}

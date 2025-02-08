package getData;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DataGet")
public class DataGet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter();
		try {
			if (req.getParameter("btn") != null) {
				String Name = req.getParameter("name");
				String Email = req.getParameter("email");
				long Contact = Long.parseLong(req.getParameter("contact"));
				String pass = req.getParameter("pin");
				
				out.print("Name: " + Name);
				out.print("Email: " + Email);
				out.print("Contact: " + Contact);
				out.print("Password: " + pass);
				
				 Class.forName("com.mysql.cj.jdbc.Driver");
				 Connection Conect = DriverManager.getConnection("jdbc:mysql://Localhost:3306/Createform","root", "root");
				 Statement state = Conect.createStatement();
				 state.executeUpdate("insert into tableone (name, Email, Contact, Pass) value ('"+Name+"','"+Email+"','"+Contact+"', '"+pass+"')");
			}
		} catch ( Exception e) {
			e.getMessage();
//			<Script> </Script>
		}
	}

}

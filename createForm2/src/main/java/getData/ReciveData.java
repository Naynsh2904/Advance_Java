package getData;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.Statement;


@WebServlet("/ReciveData")
public class ReciveData extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter nyn = resp.getWriter();
		
		try {
			
			nyn.print("<table border='1'>");
			nyn.print("<tr>  <th>Name</th>   <th>Email</th>   <th>Password</th>   <th>Contact</th>   </tr>");
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conect = DriverManager.getConnection("jdbc:mysql://localhost:3306/Createform", "root","root");
			PreparedStatement state = conect.prepareStatement("select * from tableone");
			
			ResultSet RS = state.executeQuery();
			
			while (RS.next()) {
				String Name = RS.getString("name");
				String Email = RS.getString("email");
				String Password = RS.getString("contact");
				String Contact = RS.getString("pass");
				

				nyn.print("<tr>  <th>"+Name+"</th>   <th>"+Email+"</th>   <th>"+Password+"</th>   <th>"+Contact+"</th>   </tr>");
			}
			
			nyn.print("</table>");
			
		} catch(Exception e) {
			e.getStackTrace();
			
		}
	}

}

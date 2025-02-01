package one;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Getdata")
public class Getdata extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		if (req.getParameter("btn")!= null) {
			String Name = req.getParameter("name");
			String Email = req.getParameter("email");
			long Contact = Long.parseLong(req.getParameter("contact"));
			String pass = req.getParameter("password");
			String gender = req.getParameter("gender");
			String address = req.getParameter("address");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pin = req.getParameter("pin");
			
			out.println ("Name: "+Name);
			out.println ("Email: "+Email);
			out.println ("Contact: " +Contact);
			out.println ("Password: "+pass);
			out.println ("Gender: "+gender);
			out.println ("address: "+address);
			out.println ("city: "+city);
			out.println ("state: "+state);
			out.println ("pincode: "+pin);
		}
	}
}
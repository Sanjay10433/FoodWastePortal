package servlet;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		User u = new User(name, email, password, role);
		UserDAO dao = new UserDAO();
		boolean status = dao.registerUser(u);
		if(status) {
			response.sendRedirect("login.jsp?msg=registered");
		}
		else {
			response.sendRedirect("register.jsp?error=1");
		}
	}
}
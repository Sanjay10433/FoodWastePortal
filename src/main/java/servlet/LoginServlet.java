package servlet;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserDAO dao = new UserDAO();
		User u = dao.login(email, password);
		if (u != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", u);

			switch (u.getRole()) {
			case "DONOR":
				response.sendRedirect("donor/dashboard.jsp");
				break;
			case "NGO":
				response.sendRedirect("ngo/dashboard.jsp");
				break;
			case "ADMIN":
				response.sendRedirect("admin/admin.jsp");
				break;
			default:
				response.sendRedirect("index.jsp");
			}
		} else {
			response.sendRedirect("Login.jsp?error=1");
		}
	}
}
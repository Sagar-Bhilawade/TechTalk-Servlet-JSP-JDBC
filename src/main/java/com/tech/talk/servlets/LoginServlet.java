package com.tech.talk.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.talk.dao.UserDao;
import com.tech.talk.entities.Message;
import com.tech.talk.entities.User;
import com.tech.talk.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			String check = request.getParameter("check");
			if (check == null) {
				out.println("Please check the checkbox !!!");

			} else {
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				UserDao dao = new UserDao(ConnectionProvider.getConnection());
				User user = dao.getUserEmailAndPassword(email, password);
				if (user == null) {
					// Login error
					// out.println("Invalid details... Try Again");
					Message message = new Message("Invalid Details ! Try with another", "error", "alert-danger");
					
					HttpSession session = request.getSession();
					session.setAttribute("msg", message);
					response.sendRedirect("login_page.jsp");

				} else {
					// Login Success
					HttpSession session = request.getSession();
					session.setAttribute("currentUser", user);
					response.sendRedirect("profile.jsp");

				}

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}

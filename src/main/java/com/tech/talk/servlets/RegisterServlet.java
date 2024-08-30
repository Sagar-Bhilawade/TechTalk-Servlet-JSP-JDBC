package com.tech.talk.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.invoke.StringConcatFactory;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.talk.dao.UserDao;
import com.tech.talk.entities.User;
import com.tech.talk.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out=response.getWriter()){
			String check = request.getParameter("check");
			if(check == null)
			{
				out.println("Please check the checkbox !!!");
				
			}
			else {
				User user=new User();
				user.setName(request.getParameter("user_name"));
				user.setEmail(request.getParameter("user_email"));
				user.setPassword(request.getParameter("user_password"));
				user.setAbout(request.getParameter("about"));
				user.setGender(request.getParameter("gender"));
				UserDao dao=new UserDao(ConnectionProvider.getConnection());
			    Thread.sleep(2000);
				if(dao.saveUser(user)) {
					out.println("Done");
				}
				else {
					out.print("Error !!"); 
				}
			}
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		 
	}

}

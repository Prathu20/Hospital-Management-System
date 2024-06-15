package com.demo.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.dao.UserDao;
import com.demo.db.DBConnect;
import com.demo.entity.User;

/**
 * Servlet implementation class UserRegisterServlet
 */
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String fullname = request.getParameter("fullname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			User user = new User(fullname, email, password);
			UserDao dao = new UserDao(DBConnect.getConn());
			
			HttpSession session = request.getSession();
			
			boolean f= dao.userRegister(user);
			
			if(f) {
				session.setAttribute("msg", "Register Succesfully");
				//System.out.println("Register Succesfully");
				response.sendRedirect("signup.jsp");
			}
			else {
				session.setAttribute("errmsg", "Something wrong in Server");
				//System.out.println("Something wrong in Server");
				response.sendRedirect("signup.jsp");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

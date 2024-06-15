package com.demo.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.dao.UserDao;
import com.demo.db.DBConnect;

/**
 * Servlet implementation class ChangePasswordServlet
 */
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		
		UserDao dao = new UserDao(DBConnect.getConn());
		HttpSession session = request.getSession();
		
		if(dao.checkOldPassword(uid, oldpassword)) {
			
			if(dao.changePassword(uid, newpassword)) {
				session.setAttribute("msg", "Password Change Succesfully");
				response.sendRedirect("change_password.jsp");
			}
			else {
				session.setAttribute("errmsg", "Something wrong in server");
				response.sendRedirect("change_password.jsp");
			}
		}
		else {
			session.setAttribute("errmsg", "Incorrect Old Password");
			response.sendRedirect("change_password.jsp");
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

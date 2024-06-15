package com.demo.doctor.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.dao.DoctorDao;
import com.demo.dao.UserDao;
import com.demo.db.DBConnect;

/**
 * Servlet implementation class DoctorPasswordChangeServlet
 */
public class DoctorPasswordChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorPasswordChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int did = Integer.parseInt(request.getParameter("did"));
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		HttpSession session = request.getSession();
		
		if(dao.checkOldPassword(did, oldpassword)) {
			
			if(dao.changePassword(did, newpassword)) {
				session.setAttribute("msg", "Password Change Succesfully");
				response.sendRedirect("doctor/edit_profile.jsp");
			}
			else {
				session.setAttribute("errmsg", "Something wrong in server");
				response.sendRedirect("doctor/edit_profile.jsp");
			}
		}
		else {
			session.setAttribute("errmsg", "Incorrect Old Password");
			response.sendRedirect("doctor/edit_profile.jsp");
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

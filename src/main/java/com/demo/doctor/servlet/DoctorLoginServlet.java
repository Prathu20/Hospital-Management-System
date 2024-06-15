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
import com.demo.entity.Doctor;
import com.demo.entity.User;

/**
 * Servlet implementation class DoctorLoginServlet
 */
public class DoctorLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			HttpSession session = request.getSession();
			
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			Doctor doctor = dao.login(email, password);
			
			if(doctor!=null) {
				session.setAttribute("doctormsg", doctor);
				response.sendRedirect("doctor/index.jsp");
			}
			else {
				session.setAttribute("errmsg", "Invalid email and password");
				
				response.sendRedirect("doctor_login.jsp");
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

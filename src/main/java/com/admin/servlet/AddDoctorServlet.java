package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.dao.DoctorDao;
import com.demo.db.DBConnect;
import com.demo.entity.Doctor;
import com.demo.entity.User;

/**
 * Servlet implementation class AddDoctorServlet
 */
public class AddDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDoctorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String fullname = request.getParameter("fullname");
			String dob = request.getParameter("dob");
			String qualification = request.getParameter("qualification");
			String specialist = request.getParameter("specialist");
			String email = request.getParameter("email");
			String mobno = request.getParameter("mobno");
			String password = request.getParameter("password");
			
			Doctor d = new Doctor(fullname, dob, qualification, specialist, email, mobno, password);
			
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			
			HttpSession session = request.getSession();
			
			if(dao.registerDoctor(d)) {
				session.setAttribute("msg", "Doctor added Succesfully");
				response.sendRedirect("admin/doctor.jsp");
			}
			else {
				session.setAttribute("errmsg", "Something wrong in Server");
				response.sendRedirect("admin/doctor.jsp");
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

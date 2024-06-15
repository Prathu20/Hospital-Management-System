package com.demo.doctor.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.dao.DoctorDao;
import com.demo.db.DBConnect;
import com.demo.entity.Doctor;

/**
 * Servlet implementation class EditProfileServlet
 */
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileServlet() {
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
	
			int id = Integer.parseInt(request.getParameter("did"));
			
			Doctor d = new Doctor(id, fullname, dob, qualification, specialist, email, mobno, "");
			
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			
			HttpSession session = request.getSession();
			
			if(dao.editProfileDoctor(d)) {
				Doctor updatedoctor = dao.getDoctorById(id);
				session.setAttribute("msgg", "Doctor Updated Succesfully");
				session.setAttribute("doctormsg", updatedoctor);
				response.sendRedirect("doctor/edit_profile.jsp");
			}
			else {
				session.setAttribute("errmsgg", "Something wrong in Server");
				response.sendRedirect("doctor/edit_profile.jsp");
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

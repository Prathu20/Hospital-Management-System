package com.demo.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.dao.AppointmentDao;
import com.demo.db.DBConnect;
import com.demo.entity.Appointment;

/**
 * Servlet implementation class AppointmentServlet
 */
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		String fullname = request.getParameter("fullname");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String appointment_date = request.getParameter("appointment_date");
		String email = request.getParameter("email");
		String mobno = request.getParameter("mobno");
		String diseases = request.getParameter("diseases");
		int doctorId = Integer.parseInt(request.getParameter("doctorId"));
		String address = request.getParameter("address");
		
		Appointment app = new Appointment(userId, fullname, gender, age, appointment_date, email, mobno, diseases, doctorId, address, "Pending");
		
		AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
		
		HttpSession session = request.getSession();
		
		boolean f= dao.addAppointment(app);
		
		if(f) {
			session.setAttribute("msg", "Appointment Succesfully");
			response.sendRedirect("user_appointment.jsp");
		}
		else {
			session.setAttribute("errmsg", "Something wrong in Server");
			response.sendRedirect("user_appointment.jsp");
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

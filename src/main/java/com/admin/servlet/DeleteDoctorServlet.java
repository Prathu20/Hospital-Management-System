package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.demo.dao.DoctorDao;
import com.demo.db.DBConnect;

/**
 * Servlet implementation class DeleteDoctorServlet
 */
public class DeleteDoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDoctorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		
		HttpSession session = request.getSession();
		
		if(dao.deleteDoctor(id)) {
			session.setAttribute("msg", "Doctor deleted Succesfully");
			response.sendRedirect("admin/view_doctor.jsp");
		}
		else {
			session.setAttribute("errmsg", "Something wrong in Server");
			response.sendRedirect("admin/view_doctor.jsp");
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

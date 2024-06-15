<%@page import="com.demo.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.dao.DoctorDao"%>
<%@page import="com.demo.db.DBConnect"%>
<%@page import="com.demo.dao.AppointmentDao"%>
<%@page import="com.demo.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Page</title>
<%@ include file="../Component/allcss.jsp" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
</style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<c:if test="${empty doctormsg }">
	<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

		<div class="container fluid p-3">
	<div class="row">
		
		<div class="col-md-12">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-3 text-center text-success">Patient Details</p>
					<c:if test="${not empty msg }">
						<p class="text-center text-success fs-3" role="alert">${msg}</p>
						<c:remove var="msg " scope="session"/>
					</c:if>
					
					<c:if test="${not empty errmsg }">
						<p class="text-center text-danger fs-5">${errmsg}</p>
						<c:remove var="errmsg" scope="session"/>
					</c:if>
					
					
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Full Name</th>
								<th scope="col">Gender</th>
								<th scope="col">Age</th>
								<th scope="col">Appointment Date</th>
								<th scope="col">Email</th>
								<th scope="col">Mobile No</th>
								<th scope="col">Diseases</th>
								<th scope="col">Status</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
						
						 <%
						 Doctor doctor = (Doctor) session.getAttribute("doctormsg");
						 AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
						DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
						 List<Appointment> list= dao.getAllAppointmentByDoctorLogin(doctor.getId());
						 for(Appointment app:list) {
							 Doctor d= dao2.getDoctorById(doctor.getId());
							 %>
							 <tr>
							 	<td><%=app.getFullname() %></td>
							 	<td><%=app.getGender() %></td>
							 	<td><%=app.getAge() %></td>
							 	<td><%=app.getAppointment_date() %></td>
							 	<td><%=app.getEmail() %></td>
							 	<td><%=app.getMobno() %></td>
							 	<td><%=app.getDiseases() %></td>
							 	<td><%=app.getStatus() %></td>
							 	<td>
							 	<%
							 		if("Pending".equals(app.getStatus())){
							 	%>
							 		<a href="comment.jsp?id=<%=app.getId() %>" class="btn btn-success btn-sm">Comment</a>
							 	<%  }
							 		else {
							 	%>
							 		<a href="#" class="btn btn-success btn-sm disabled">Comment</a>
							 	<% 		
							    	}
							 	%>
							 	</td>
							 </tr>
							 <%
						 }
						%> 
						
						</tbody>
					</table>
				</div>
			</div>
		
		</div>
		
	</div>
</div>
</body>
</html>
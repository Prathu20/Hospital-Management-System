<%@page import="com.demo.entity.Doctor"%>
<%@page import="com.demo.db.DBConnect"%>
<%@page import="com.demo.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor page</title>
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

<p class="text-center fs-3">Doctor Dashboard</p>
	<% 
	Doctor d= (Doctor) session.getAttribute("doctormsg");
	DoctorDao dao = new DoctorDao(DBConnect.getConn());
	%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center">
					<i class="fa-solid fa-user-doctor fa-3x"></i>
					<p class="fs-4 text-center">Doctor
					<br><%=dao.countDoctor() %>
					</p>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card paint-card" >
					<div class="card-body text-center">
					<i class="fa-solid fa-calendar-check fa-3x" ></i>
					<p class="fs-4 text-center">Total Appointment
					<br><%=dao.countAppointmentByDoctorId(d.getId()) %>
					</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
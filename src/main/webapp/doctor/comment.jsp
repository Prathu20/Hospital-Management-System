<%@page import="com.demo.entity.Appointment"%>
<%@page import="com.demo.db.DBConnect"%>
<%@page import="com.demo.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Comment Page</title>
<%@ include file="../Component/allcss.jsp" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
.backImg {
	background: linear-gradient(rgba(0,0,0,0.4),rgba(0,0,0,0.4)),
	url("../img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
<%@ include file="navbar.jsp" %>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
<c:if test="${empty doctormsg }">
	<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<div class="container p-3">
	<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Comment</p>
						
						<%
					int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
						Appointment app= dao.getAppointmentById(id);
					%>
						<form class="row" action="../UpdateStatusServlet" method="post">
							<div class="col-md-6">
								<label>Patient Name</label>
								<input type="text" readonly value="<%=app.getFullname() %>" class="form-control">
							</div>
							
							<div class="col-md-6">
								<label>Age</label>
								<input type="text" readonly value="<%=app.getAge() %>" class="form-control">
							</div>
							
							<div class="col-md-6">
								<label>Mobile No</label>
								<input type="text" readonly value="<%=app.getMobno() %>" class="form-control">
							</div>
							
							<div class="col-md-6">
								<label>Diseases</label>
								<input type="text" readonly value="<%=app.getDiseases() %>" class="form-control">
							</div>
							
							<div class="col-md-12">
								<label>Comment</label>
								<textarea  required rows="3" cols="" class="form-control" name="comment">
								</textarea>
							</div>
							
							<input type="hidden" name="id" value="<%=app.getId() %>">
							<input type="hidden" name="did" value="<%=app.getDoctorId()%>">
							
							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
						</form>
					</div>
				</div>
			</div>
	</div>	
</div>



</body>
</html>
<%@page import="com.demo.entity.Doctor"%>
<%@page import="java.util.List"%>
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
<title>User Appointment</title>
<%@ include file="Component/allcss.jsp" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0,0,0,0.3);
}

.backImg {
	background: linear-gradient(rgba(0,0,0,0.4),rgba(0,0,0,0.4)),
	url("img/hospital.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

</style>
</head>
<body>
<%@ include file="Component/navbar.jsp" %>

<div class="container-fulid backImg p-5">
	<p class="text-center fs-2 text-white"></p>
</div>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img src="img/doct.png" alt="" width="300px" height="500px">
			</div>
			
			<div class="col-md-6">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-3 text-center">User Appointment</p>
					<c:if test="${not empty msg }">
						<p class="text-center text-success fs-3" role="alert">${msg}</p>
						<c:remove var="msg " scope="session"/>
					</c:if>
					
					<c:if test="${not empty errmsg }">
						<p class="text-center text-danger fs-5">${errmsg}</p>
						<c:remove var="errmsg" scope="session"/>
					</c:if>
					
					<form action="AppointmentServlet" method="post" class="row g-3">
					
					<input type="hidden" name="userId" value="${usermsg.id }">
						<div class="col-md-6">
							<label class="form-label" for="inputEmail4">Full Name</label>
							<input required type="text" name="fullname" class="form-control">
						</div>
						
						<div class="col-md-6">
							<label class="form-label" for="inputEmail4">Gender</label>
							<select name="gender" required class="form-control">
							<option value="male">Male</option>
							<option value="female">Female</option>
							</select>
						</div>
						
						<div class="col-md-6">
							<label class="form-label" for="inputEmail4">Age</label>
							<input required type="number" name="age" class="form-control">
						</div>
						
						<div class="col-md-6">
							<label class="form-label" for="inputEmail4">Appointment Date</label>
							<input required type="date" name="appointment_date" class="form-control">
						</div>
								
						
						<div class=col-md-6>
							<label class="form-label" for="inputEmail4">Email</label>
							<input required type="email" name="email" class="form-control">
						</div>
						
						
						<div class="col-md-6">
							<label class="form-label" for="inputEmail4">Mobile No</label>
							<input required type="text" maxlength="10" name="mobno" class="form-control">
						</div>
						
						<div class="col-md-6">
							<label class="form-label" for="inputEmail4">Diseases</label>
							<input required type="text" name="diseases" class="form-control">
						</div> 
						
						<div class="col-md-6">
							<label class="form-label" for="inputEmail4">Doctor</label>
							<select name="doctorId" required class="form-control">
							<option >..select..</option>
							
							<%
							DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
							List<Doctor> list = dao2.getAllDoctor();
						 	for(Doctor d:list) {
							 %>
							<option value="<%= d.getId()%>"><%=d.getFullname() %>(<%=d.getSpecialist() %>)</option>
							
							 <%
						 }
						%>
							</select>
						</div>
						
						<div class="col-md-12">
							<label class="form-label" for="inputEmail4">Full Address</label>
							<textarea required rows="3" cols="" name="address" class="form-control">
							</textarea>
						</div> 
						
						<c:if test="${empty usermsg }">
							<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-primary">
							Submit</a>
						</c:if>
						
						<c:if test="${not empty usermsg }">
							<button class="col-md-6 offset-md-3 btn btn-primary">
							Submit</button>
						</c:if>
						
					</form>
				</div>
			</div>
		</div>
			
		</div>
	</div>
<%@ include file="Component/footer.jsp" %>
</body>
</html>
<%@page import="com.demo.entity.User"%>
<%@page import="com.demo.entity.Doctor"%>
<%@page import="com.demo.dao.DoctorDao"%>
<%@page import="com.demo.entity.Appointment"%>
<%@page import="java.util.List"%>
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
<title>View Appointment</title>
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

	<div class="containerfluid p-3">
	<div class="row">
		
		<div class="col-md-9">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-4 fw-bold text-center text-success">Appointment List</p>
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
								<th scope="col">Diseases</th>
								<!-- <th scope="col">Doctor Name</th> -->
								<th scope="col">Status</th>
							</tr>
						</thead>
						<tbody>
						
						 <%
						 User user = (User) session.getAttribute("usermsg");
						AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
						DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
						List<Appointment> list= dao.getAllAppointmentByLoginUser(user.getId());
						 for(Appointment app:list) {
							 Doctor d= dao2.getDoctorById(user.getId());
							 %>
							 <tr>
							 	<td><%=app.getFullname() %></td>
							 	<td><%=app.getGender() %></td>
							 	<td><%=app.getAge() %></td>
							 	<td><%=app.getAppointment_date() %></td>
							 	<td><%=app.getDiseases() %></td>
							 	<%-- <td><%=d.getFullname() %></td> --%>
							 	<td>
							 	<%
							 	if("Pending".equals(app.getStatus())){%>
							 		<a href="#" class="btn btn-sm btn-warning">Pending</a>
							 	<%}
							 	else {%>
							 		<%=app.getStatus() %>
							 	<%}
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
		
			<div class="col-md-3 p-3">
				<img src="img/doct.png" alt="" width="300px" height="500px">
			</div>
	</div>
</div>

</body>
</html>
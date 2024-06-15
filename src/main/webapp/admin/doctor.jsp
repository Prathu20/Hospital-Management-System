<%@page import="com.demo.entity.Doctor"%>
<%@page import="com.demo.dao.DoctorDao"%>
<%@page import="com.demo.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.db.DBConnect"%>
<%@page import="com.demo.dao.SpecialistDao"%>
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

<div class="containerfluid p-3">
	<div class="row">
		<div class="col-md-4">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-3 text-center">Add Doctor</p>
					<c:if test="${not empty msg }">
						<p class="text-center text-success fs-3" role="alert">${msg}</p>
						<c:remove var="msg " scope="session"/>
					</c:if>
					
					<c:if test="${not empty errmsg }">
						<p class="text-center text-danger fs-5">${errmsg}</p>
						<c:remove var="errmsg" scope="session"/>
					</c:if>
					
					<form action="../AddDoctorServlet" method="post">
						<div class="mb-3">
							<label class="form-label">Full Name</label>
							<input required type="text" name="fullname" class="form-control">
						</div>
						
						<div class="mb-3">
							<label class="form-label">DOB</label>
							<input required type="date" name="dob" class="form-control">
						</div>
						
						<div class="mb-3">
							<label class="form-label">Qualification</label>
							<input required type="text" name="qualification" class="form-control">
						</div>
						
						<div class="mb-3">
							<label class="form-label">Specialist</label>
							<select name="specialist" required class="form-control">
							<option>..select..</option>
							<% SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
							 List<Specialist> list= dao.getAllSpecialist();
							 for(Specialist s:list){
								 %>
								 <option><%= s.getSpecialistName() %></option>
								 <%
							 }
							%>
							</select>
						</div>
						
						
						<div class="mb-3">
							<label class="form-label">Email</label>
							<input required type="email" name="email" class="form-control">
						</div>
						
						
						<div class="mb-3">
							<label class="form-label">Mobile No</label>
							<input required type="text" name="mobno" class="form-control">
						</div>
						
						<div class="mb-3">
							<label class="form-label">Password</label>
							<input required type="password" name="password" class="form-control">
						</div> 
						
						<button type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>
			</div>
		</div>
		
		<div class="col-md-8">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-3 text-center">Doctor Details</p>
					
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Full Name</th>
								<th scope="col">DOB</th>
								<th scope="col">Qualification</th>
								<th scope="col">Specialist</th>
								<th scope="col">Email</th>
								<th scope="col">Mobile No</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
						
						<%
						DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
						 List<Doctor> list2=dao2.getAllDoctor();
						 for(Doctor d:list2) {
							 %>
							 <tr>
							 	<td><%=d.getFullname() %></td>
							 	<td><%=d.getDob() %></td>
							 	<td><%=d.getQualification() %></td>
							 	<td><%=d.getSpecialist() %></td>
							 	<td><%=d.getEmail() %></td>
							 	<td><%=d.getMobno() %></td>
							 	<td>
							 	<a class="btn btn-sm btn-primary" href="edit_doctor.jsp?id=<%=d.getId()%>">Edit</a>
							 	<a class="btn btn-sm btn-danger" href="../DeleteDoctorServlet?id=<%=d.getId()%>">Delete</a>
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
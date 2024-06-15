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
<title>Doctor Edit page</title>
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
		<div class="col-md-4 offset-md-4">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-3 text-center">Edit Doctor Details</p>
					<c:if test="${not empty msg }">
						<p class="text-center text-success fs-3" role="alert">${msg}</p>
						<c:remove var="msg " scope="session"/>
					</c:if>
					
					<c:if test="${not empty errmsg }">
						<p class="text-center text-danger fs-5">${errmsg}</p>
						<c:remove var="errmsg" scope="session"/>
					</c:if>
					
					<% 
					int id =Integer.parseInt(request.getParameter("id"));
					DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
					Doctor d= dao2.getDoctorById(id);
					
					%>
					
					<form action="../UpdateDoctorServlet" method="post">
						<div class="mb-3">
							<label class="form-label">Full Name</label>
							<input required type="text" name="fullname" class="form-control"
							value="<%=d.getFullname() %>">
						</div>
						
						<div class="mb-3">
							<label class="form-label">DOB</label>
							<input required type="date" name="dob" class="form-control"
							value="<%=d.getDob() %>">
						</div>
						
						<div class="mb-3">
							<label class="form-label">Qualification</label>
							<input required type="text" name="qualification" class="form-control"
							value="<%=d.getQualification() %>">
						</div>
						
						<div class="mb-3">
							<label class="form-label">Specialist</label>
							<select name="specialist" required class="form-control">
							<option><%=d.getSpecialist() %></option>
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
							<input required type="email" name="email" class="form-control"
							value="<%=d.getEmail() %>">
						</div>
						
						
						<div class="mb-3">
							<label class="form-label">Mobile No</label>
							<input required type="text" name="mobno" class="form-control"
							value="<%=d.getMobno() %>">
						</div>
						
						<div class="mb-3">
							<label class="form-label">Password</label>
							<input required type="text" name="password" class="form-control"
							value="<%=d.getPassword() %>">
						</div> 
						<input type="hidden" name="id" value="<%=d.getId() %>">
						
						<button type="submit" class="btn btn-primary col-md-12">Update</button>
					</form>
				</div>
			</div>
		</div>
		
		
		
		</div>
	</div>

</body>
</html>
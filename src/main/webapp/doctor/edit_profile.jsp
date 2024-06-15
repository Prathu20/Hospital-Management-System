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
<title>Profile Page</title>
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

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="fs-3 text-center">Change Password</p>
					
					<c:if test="${not empty msg }">
						<p class="text-center text-success fs-3">${msg}</p>
						<c:remove var="msg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty errmsg }">
						<p class="text-center text-danger fs-5">${errmsg}</p>
						<c:remove var="errmsg" scope="session"/>
					</c:if>
					<div class="card-body">
						<form action="../DoctorPasswordChangeServlet" method="post">
							<div class="mb-3">
								<label>Enter New Password</label>
								<input type="text" name="newpassword" required class="form-control">
							</div>
							
							<div class="mb-3">
								<label>Enter Old Password</label>
								<input type="text" name="oldpassword" required class="form-control">
							</div>
							
							<input type="hidden" name="did" value="${doctormsg.id }">
							<button class="btn btn-success col-md-12">Change Password</button>
						</form>
					</div>
				</div>
			</div>
			
			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
						<p class="fs-3 text-center">Edit Profile</p>
						<c:if test="${not empty msgg }">
						<p class="text-center text-success fs-3">${msgg}</p>
						<c:remove var="msgg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty errmsgg }">
						<p class="text-center text-danger fs-5">${errmsgg}</p>
						<c:remove var="errmsgg" scope="session"/>
					</c:if>
					<div class="card-body">
						<form action="../EditProfileServlet" method="post">
						<div class="mb-3">
							<label class="form-label">Full Name</label>
							<input required type="text" name="fullname" class="form-control"
							value="${doctormsg.fullname }">
						</div>
						
						<div class="mb-3">
							<label class="form-label">DOB</label>
							<input required type="date" name="dob" class="form-control"
							value="${doctormsg.dob }">
						</div>
						
						<div class="mb-3">
							<label class="form-label">Qualification</label>
							<input required type="text" name="qualification" class="form-control"
							value="${doctormsg.qualification }">
						</div>
						
						<div class="mb-3">
							<label class="form-label">Specialist</label>
							<select name="specialist" required class="form-control"
							value="${doctormsg.specialist }">
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
							<input required type="email" name="email" class="form-control" readonly
							value="${doctormsg.email }">
						</div>
						
						
						<div class="mb-3">
							<label class="form-label">Mobile No</label>
							<input required type="text" name="mobno" class="form-control"
							value="${doctormsg.mobno }">
						</div>
						
						<input type="hidden" name="did" value="${doctormsg.id }">
						<button type="submit" class="btn btn-primary">Update</button>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
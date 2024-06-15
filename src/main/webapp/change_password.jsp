<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
<%@ include file="Component/allcss.jsp" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
</style>
</head>
<body>
<%@ include file="Component/navbar.jsp" %>

<c:if test="${empty usermsg }">
	<c:redirect url="user_login.jsp"></c:redirect>
</c:if>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
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
						<form action="ChangePasswordServlet" method="post">
							<div class="mb-3">
								<label>Enter New Password</label>
								<input type="text" name="newpassword" required class="form-control">
							</div>
							
							<div class="mb-3">
								<label>Enter Old Password</label>
								<input type="text" name="oldpassword" required class="form-control">
							</div>
							
							<input type="hidden" name="uid" value="${usermsg.id }">
							<button class="btn btn-success col-md-12">Change Password</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
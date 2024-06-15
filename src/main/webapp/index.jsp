<%@page import="java.sql.Connection"%>
<%@page import="com.demo.db.DBConnect"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@ include file="Component/allcss.jsp" %>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
</style>

</head>
<body>
<%@ include file="Component/navbar.jsp" %>


<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/hos.jpg" class="d-block w-100" alt="..." height="550px">
    </div>
    <div class="carousel-item">
      <img src="img/hos1.jpg" class="d-block w-100" alt="..." height="550px">
    </div>
    <div class="carousel-item">
      <img src="img/hos2.jpg" class="d-block w-100" alt="..." height="550px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<hr>
<div class="container">
	<p class="text-center fs-2">Key Features of our Hospital</p>
	<div class="row">
		<div class="col-md-8 p-5">
			<div class="row">
				<div class="col-md-6">
					<div class="card paint-card">
						<div class="card-body">
							<p class="fs-5">100% Safety</p>
							<p>Hospital, an institution that is built, staffed, and equipped for the diagnosis of disease; for the treatment, 
							both medical and surgical, of the sick and the injured</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-6">
					<div class="card paint-card">
						<div class="card-body">
							<p class="fs-5">Clean Environment</p>
							<p>Hospital, an institution that is built, staffed, and equipped for the diagnosis of disease; for the treatment, 
							both medical and surgical, of the sick and the injured</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-6 mt-2">
					<div class="card paint-card">
						<div class="card-body">
							<p class="fs-5">Friendly Doctor</p>
							<p>Hospital, an institution that is built, staffed, and equipped for the diagnosis of disease; for the treatment, 
							both medical and surgical, of the sick and the injured</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-6 mt-2">
					<div class="card paint-card">
						<div class="card-body">
							<p class="fs-5">Medical Research</p>
							<p>Hospital, an institution that is built, staffed, and equipped for the diagnosis of disease; for the treatment, 
							both medical and surgical, of the sick and the injured</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-md-4">
			<img alt="" src="img/doct.png" width="300px" height="500px">
		</div>
	</div>
</div>
<hr>

<div class="container">
	<p class="text-center fs-2">Our Team</p>
	<div class="row">
		<div class="col-md-4">
			<div class="card paint-card">
				<div class="card-body text-center">
					<img src="img/doc1.jpg" alt="doc1" width="250px" height="300px">
					<p class="fw-bold fs-5">Samunani simi</p>
					<p class="fs-7">(CEO & Chairman)</p>
				</div>
			</div>
		</div>
		
		<div class="col-md-4">
			<div class="card paint-card">
				<div class="card-body text-center">
					<img src="img/doc2.jpg" alt="doc1" width="250px" height="300px">
					<p class="fw-bold fs-5">Dr. Siva Kumar</p>
					<p class="fs-7">(Chief Doctor)</p>
				</div>
			</div>
		</div>
		
		<div class="col-md-4">
			<div class="card paint-card">
				<div class="card-body text-center">
					<img src="img/doc4.jpg" alt="doc1" width="250px" height="300px">
					<p class="fw-bold fs-5">Dr. Niuise Paul</p>
					<p class="fs-7">(Chief Doctor)</p>
				</div>
			</div>
		</div>
		
	</div>
</div>		

<%@ include file="Component/footer.jsp" %>
</body>
</html>
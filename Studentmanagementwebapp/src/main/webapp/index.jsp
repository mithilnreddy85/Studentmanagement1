
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %> 
    
<%@ page import="java.sql.*" %>
     <%
     try{
    	 String url = "jdbc:mysql://localhost:3306/spec",
					user = "root", password = "root";
			
			//Add this line for web applications before connecting to database
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * From Stdata1");
			%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student management data</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<header>
	    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	      <div class="container">
	        <a class="navbar-brand" href="#">SMS</a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	          <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarNav">
	          <ul class="navbar-nav ml-auto">
	            <li class="nav-item"><a class="nav-link" href="ListStudents">List All Students</a></li>
	            <li class="nav-item"><a class="nav-link" href="#add">Add Student</a></li>
	            <li class="nav-item"><a class="nav-link" href="#find">Find Student</a></li>
	            <li class="nav-item"><a class="nav-link" href="#edit">Edit Student</a></li>
	            <li class="nav-item"><a class="nav-link" href="#remove">Remove Student </a></li>
	          </ul>
	        </div>
	      </div>
	    </nav>
  	</header>

<section id='list' class=bd-light py-4>
<div class=container-fluid>
<h2>Studentlist</h2>
<table class="table table-striped" >
<tr>
<th>Rollnumber</th>
<th>name</th>
</tr>
<% while(rs.next())
{%>
<tr>
<td><%rs.getParameter('name');%></td>
<td><%rs.getParameter('rollnumber');%></td>
</tr>
<%}
}catch(Exception e)
     {
     
     }%>
     



</table>
</div>

</section>
<h1>

 
</h1>
</body>


     
</html>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
    <% 
	    try{
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spec","root","root");
	    	Statement stmt = conn.createStatement();
	    	String sq = "SELECT S.rollnumber, S.name, SP.needs_wc, SP.is_vi FROM student_data S LEFT JOIN specialneeds SP ON SP.student_id = S.id";
	    	ResultSet stuData = stmt.executeQuery(sq);
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Student Management System</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
  	<!-- Include other CSS files for plugins -->
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
	            <li class="nav-item"><a class="nav-link" href="#add">Add Student</a></li>
	            <li class="nav-item"><a class="nav-link" href="#find">Find Student</a></li>
	            <li class="nav-item"><a class="nav-link" href="#edit">Edit Student</a></li>
	            <li class="nav-item"><a class="nav-link" href="#remove">Remove Student </a></li>
	          </ul>
	        </div>
	      </div>
	    </nav>
  	</header>
	
	<section id="list" class="bg-light py-5">
	    <div class="container">
	      	<h2>Student List</h2>
	      	<table class="table table-striped">
	      		<tr>
	      			<th>Roll Number</th>
	      			<th>Name</th>
	      			<th>Special Needs </th>
	      		</tr>
	      		<% while(stuData.next()) { %>
	      			<tr>
	      				<td><% out.println(stuData.getString("rollnumber"));  %></td>
	      				<td><% out.println(stuData.getString("name"));  %></td>
	      				<td>
	      					<% 
	      						if(stuData.getString("needs_wc") == null || stuData.getString("is_vi") == null) {
	      							out.println("None");
	      						}
	      						else {
	      							if(stuData.getString("needs_wc").equals("Y")){
	      								out.println("Needs WheelChair <br>");
	      							}
	      							if(stuData.getString("is_vi").equals("Y")){
	      								out.println("Is Visually Impaired");
	      							}
	      						}
	      					%>
	      				</td>
	      			</tr>
	      		<% }
		    	}catch(Exception e) {
		    		out.print(e);	
		    	}
	      		%>
	      	</table>
	    </div>
	  </section>
	  
	  
  	<div class="row w-80">
  		<div class="col-md-6">
  			
  		</div>
  		<div class="col-md-6">
  			
  		</div>
  	</div>
  	
  	<section id="add" class="bg-light py-5">
		    <div class="container">
		      	<h2>Add Student Data</h2>
		      	<form class="form" method="GET" action="AddStudent">
		      		<div class="form-group">
			      		<label for="add_rno">Roll Number:</label>
						<input  class="form-control" type="text" id="add_rno" name="add_rno" placeholder="Enter Roll Number"/>
		      		</div>
		      		<div class="form-group">
		      			<label for="add_name">Name:</label>
						<input class="form-control" type="text" id="add_name" name="add_name" placeholder="Enter Name"/>
		      		</div>
		      		<div class="form-check my-2">
		      			  <input class="form-check-input" type="checkbox" name="special_needs" id="special_needs" value="Yes">
						  <label class="form-check-label" for="special_needs">
							Special Needs
						  </label>
		      		</div>
		      		<div class="form-group form-check specialNeedsList">
						  <input class="form-check-input" type="checkbox" name="is_vi" id="is_vi" value="Y">
						  <label class="form-check-label" for="is_vi">
							The student is visually impaired
						  </label><br>
						  <input class="form-check-input" type="checkbox" name="needs_wc" id="needs_wc" value="Y">
						  <label class="form-check-label" for="needs_wc">
							The student needs a wheelchair
						  </label>
		      		</div>
		      		<input class="btn btn-success my-2" type="submit" class="btn btn-primary my-2" value="Add Student"/>
					
				</form>
		    </div>
		  </section>
  	
  	<section id="edit" class="bg-light py-5">
		    <div class="container">
		      	<h2>Edit Student Data</h2>
		      	<form id="edit_form" method="GET" action="EditStudent">
		      		<div class="form-group">
		      			<label for="edit_rno">Roll Number:</label>
						<input class="form-control" type="text" id="edit_rno" name="edit_rno" placeholder="Enter Roll Number"/>
		      		</div>
		      		<div class="form-group">
		      			<label for="name">Name:</label>
						<input class="form-control" type="text" id="edit_name" name="edit_name" placeholder="Enter Name"/>
		      		</div>
					<input class="btn btn-warning my-2 edit_submit" type="submit" value="Edit"/>
				</form>
		    </div>
		  </section>
  	
  	<section id="find" class="bg-light py-5">
	    <div class="container">
	      	<h2>Find Student Data</h2>
	      	<form id="find_form" method="GET" action="FindStudent">
	      		<div class="form-group">
		      		<label for="find_rno">Roll Number:</label>
					<input class="form-control" type="text" id="find_rno" name="find_rno" placeholder="Enter Roll Number"/>
	      		</div>
				<input class="btn btn-primary my-2" type="submit" value="Find" id="find_submit"/>
			</form>
	    </div>
	  </section>
	  
	  <section id="remove" class="bg-light py-5">
	    <div class="container">
	      	<h2>Remove Student Data</h2>
	      	<form method="GET" action="RemoveServlet" id="remove_form">
	      		<div class="form-group">
	      			<label for="remove_rno">Roll Number:</label>
					<input class="form-control" type="text" id="remove_rno" name="remove_rno" placeholder="Enter Roll Number"/>
	      		</div>
				<input class="btn btn-danger my-2" type="submit" value="Remove" id="remove_submit"/>
			</form>
	    </div>
	  </section>
	   
	 
	  
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	  integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	  crossorigin="anonymous"></script>
	  
	<script>
  	$(document).ready(function () {
  		$(".specialNeedsList").hide();
  		$("#special_needs").click(function () {
  			if($("#special_needs").is(":checked")){
  				$(".specialNeedsList").show();
  			}
  			else {
  				$(".specialNeedsList").hide();
  			}
  		});
  		
  		//Start event when submit button of edit form is clicked
  		$(".edit_submit").click(function (e) {
  			e.preventDefault(); // This will prevent the form from being submitted normally
  			$.ajax({ // Start submitting the form through ajax
  	  		  type: 'GET', // either 'GET'/'POST'
  	  		  url: $("#edit_form").attr("action"), //Takes value from action attribute of form
  	  		  data: $("#edit_form").serialize(), //Converts form data to json so that request.getParameter() in servlet can get the vlue using name attribute
  	  		  success: function(response) { // What to do when the servlet execution is successful
  	  			  alert(response); //response contains whatever is printed in the servlet
  	  			  location.reload();
  	  		  },
  	  		});
  		});
  		
  		$("#find_submit").click(function (e) {
  			
  			e.preventDefault();
  			$.ajax({
  	  		  type: 'GET',
  	  		  url: $("#find_form").attr("action"),
  	  		  data: $("#find_form").serialize(),
  	  		  success: function(response) { 
  	  			  alert(response);
  	  		  },
  	  		});
  		});

  		$("#remove_submit").click(function (e) {
  			e.preventDefault();
  			$.ajax({
  	  		  type: 'GET',
  	  		  url: $("#remove_form").attr("action"),
  	  		  data: $("#remove_form").serialize(),
  	  		  success: function(response) { 
  	  			  alert(response);
  	  			  location.reload();
  	  		  },
  	  		});
  		});
  		
  		
  	});
  </script>
</body>
</html>
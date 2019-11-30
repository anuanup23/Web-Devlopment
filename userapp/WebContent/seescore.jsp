<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>quiz</title>
<link href="assets/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="assets/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="assets/indexff.css">

</head>
<body>
            <%
              if(session.getAttribute("username")==null)
              {
            	  response.sendRedirect("login.jsp");
              }
       
            %>    
            
<div class="container">
    <div class="row profile">
		<div class="col-md-3">
			<div class="profile-sidebar">			
				<div class="profile-userbuttons">
				<form action = "Logout">
            	<input type="submit" class="btn btn-danger btn-sm" value = "Logout"><br>
            	</form>
            	<br>
            	      <a href = "Display.jsp">
            	      <button type="button" class="btn btn-success btn-sm">test  </button>
            	      </a>
										</div>
				
			</div>
		</div>
		<div class="col-md-9">
            <div class="profile-content"> 
            <p><center>
            <h1>Your Marks Is Below :</h1><br>
 <h2>   ${score} </h2>
 <br>
 
 <a href="Welcome.jsp"><input type="submit" value="GO TO HOME PAGE"></a>
             </center>
              </p>
              </div>
		</div>
	</div>
</div>

<br>
<br>

</body>
</html>

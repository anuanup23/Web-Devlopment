<!DOCTYPE html>
<html>
<head>
	<title>quiz</title>
<link href="assets/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="assets/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="assets/indexff.css">

 <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>quiz</title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">

</head>
<body>
            <%
              if(session.getAttribute("username")==null)
              {
            	  response.sendRedirect("login.jsp");
              }
       
            %>    
               <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
<div class="container">
    <div class="row profile">
		<div class="col-md-3">
			<div class="profile-sidebar">			
				<div class="profile-userbuttons">
				<form action = "Logout">
            	<input type="submit" class="btn btn-info btn-sm" value = "Logout"><br>
            	</form>
            	<br>
            	      <a href = "Display.jsp">
            	      <button type="button" class="btn btn-primary btn-sm" style="width:100%; ">test  </button><br>
            	      </a>
            	      <br>
										</div>
				
			</div>
		</div>
		<div class="col-md-9">
            <div class="profile-content"> 
            <p>
            <center>
            <h1><b>WELCOME</b><br><br></h1>
            </center>
            <p>
            <h1>
            <b>NAME&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp: </b>	&nbsp&nbsp&nbsp
            MR. 
             ${fname}
              ${lname}<br>
              <b>BRANCH &nbsp:</b>&nbsp&nbsp&nbsp&nbsp
                 ${branch}<br>
                 <b>ROLL NO :</b>&nbsp&nbsp&nbsp&nbsp&nbsp
                    ${roll}<br>
                    <b>SCORE &nbsp&nbsp&nbsp&nbsp&nbsp:</b>&nbsp&nbsp&nbsp&nbsp&nbsp
                  ${score}<br>
                  ${ques}<br>
             </h1>
            
              </p>
              </div>
		</div>
	</div>
</div>
</div>

<br>
<br>
 <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>

</body>
</html>

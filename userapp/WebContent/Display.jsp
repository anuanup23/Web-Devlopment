

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import = "java.util.ArrayList"%>
<%@page import = "java.util.*"%>


<!DOCTYPE html>
<html lang="en">

 


<head>
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
             
    try
       {
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/quiz", "root", "2304");
         Statement st=conn.createStatement();
         int index = (int)session.getAttribute("index");
         int noofques = (int)session.getAttribute("NoOfQues");
         String query = "SELECT * FROM questions where q_id = "+index+"";
         st = conn.createStatement();
         ResultSet rs= st.executeQuery(query);
        	 if(rs.next()) {
        		 
        %> 

    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">Quizzzzzz</h2>
                </div>
                <div class="card-body">
                    
                    <div></div>
                    
                    <form  action = " totalmarks"> 
         <table cellspacing="20" cellpadding="25">
          <tr>
            <td><h3><%=rs.getInt(1)%>&nbsp &nbsp<%=rs.getString(2) %></h3></tr>
            <tr></tr>
             <tr></tr>
              <tr></tr>
               <tr></tr>
                <tr></tr>
            <td bgcolor="#FFFFFF" colspan="3">&nbsp;</td>
            <td bgcolor="#FFFFFF" colspan="3">&nbsp;</td>
            <tr><td><i><h4><input type="radio" value ="1" name = "option" style="height:20px; width:20px;"/>&nbsp &nbsp &nbsp<%=rs.getString(3)%></h4></i></td></tr><td bgcolor="#FFFFFF" colspan="3">&nbsp;</td>
            <tr><td><i><h4><input type="radio" value ="2" name = "option" style="height:20px; width:20px;"/>&nbsp &nbsp &nbsp<%=rs.getString(4)%></h4></i></td></tr><td bgcolor="#FFFFFF" colspan="3">&nbsp;</td>
            <tr><td><i><h4><input type="radio" value ="3" name = "option" style="height:20px; width:20px;"/>&nbsp &nbsp &nbsp<%=rs.getString(5)%></h4></i></td></tr><td bgcolor="#FFFFFF" colspan="3">&nbsp;</td>
            <tr><td><i><h4><input type="radio" value ="4" name = "option" style="height:20px; width:20px;"/>&nbsp &nbsp &nbsp<%=rs.getString(6)%></h4></i></td></tr><td bgcolor="#FFFFFF" colspan="3">&nbsp;</td>
            <td bgcolor="#FFFFFF" colspan="3">&nbsp;</td>
            <td bgcolor="#FFFFFF" colspan="3">&nbsp;</td>
            <td bgcolor="#FFFFFF" colspan="3">&nbsp;</td>
         </table>  
       
          <center>
          
          <input type = "submit" class="btn btn--radius-2 btn--green" value = "NEXT" style="width:40%;"/><br>
     
          </center>
          </form>
          </div>
          </div>
          </div>
          </div>
        		       
       
                <%
        	 }
        	else{
        		boolean flag = true;
        		session.setAttribute("Completed",flag);
        		%>
        		
    <div class="page-wrapper bg-gra-03 p-t-100 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
           
                    <h1 class="title">! NOTHING IS LEFT FOR YOU PAL</h1><br>
                    <h1 class="title">YOU HAVE ALREADY GIVEN THE TEST AND</h1><br>
                    <h1 class="title">YOUR MARKS HAVE BEEN RECODED !</h1><br>	
                 
                  	
              <div class="">
                              <a href = "seescore.jsp">
        		<center>
        		
        		          <input type = "submit" class="btn btn--radius-2 btn--green" value = "PRESS TO CHECK SCORE" style="width:40%;"/><br><br>
        		</center>
      	      </a>  
           
                </div>
      
        	
      	       </div>
      	          </div>
            </div>
            	
        </div>
  
    </div>
      	      <% 
        	}
        	conn.close();
       %>
       
             <% 
       }
       catch(Exception e)
       {
         e.printStackTrace();
       }
              
      %>  
                    <br><br>           


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


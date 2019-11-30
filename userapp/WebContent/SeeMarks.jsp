<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import = "java.util.ArrayList"%>
<%@page import = "java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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
<title>Insert title here</title>
</head>
<body>
<%
              if(session.getAttribute("username")==null)
              {
              response.sendRedirect("loginTeacher.jsp");
             }
try
 {
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/quiz", "root", "2304");
  Statement st=conn.createStatement();
  String query = "SELECT s.first_name,s.last_name,s.roll,s.email,s.branch ,e.marks ,e.tot_tests,(e.marks/e.tot_tests)*10 from users s inner join marks e on e.roll = s.roll";
  st = conn.createStatement();
  ResultSet rs= st.executeQuery(query);
  %>
  
  <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
  <center>
  <table border = 1px  width = 100%> 
	 <tr  bgcolor = "#FF5733" >
	 <th >FIRST NAME </th> <th>LAST NAME </th> <th>ROLL NUMBER </th> <th>EMAIL </th> <th>BRANCH </th> <th>MARKS </th> <th>TOTAL TESTS </th> <th>  OVERALL % </th>
	 </tr>
	 <% 
 	 while(rs.next()) {
 		 %>
 		 <tr>
 		 <td align = "center" bgcolor = "#FFFF99"><%=rs.getString(1) %></td><td align = "center" bgcolor = "#CCFFFF"><%=rs.getString(2) %></td>
 		 <td align = "center" bgcolor = "#99FF99"><%=rs.getInt(3) %></td><td align = "center" bgcolor = "#F6BBD3"><%=rs.getString(4) %></td>
 		 <td align = "center" bgcolor = "#99FF99"><%=rs.getString(5) %></td>
 		 <td align = "center" bgcolor = "#FFCCCC"><%=rs.getInt(6) %></td><td align = "center" bgcolor = "#CCFFFF"><%=rs.getInt(7) %></td>
 		 <td align = "center" bgcolor = "#CDCDCD"><%=rs.getDouble(8) %></td>
 		 </tr>
 		 
 		 <%
 	 }
  conn.close();
}
catch(Exception e)
{
	//style = "padding-left :100px;"
  e.printStackTrace();
}
%>
</table><br><br>
</center>

<center>
<a href = "addQue.jsp">
  <input style="width:20%;" type="submit" class="btn btn--radius-2 btn--red" value = "Back To Job">
  </a>
  </center>
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
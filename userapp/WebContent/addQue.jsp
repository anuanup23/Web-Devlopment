<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Question</title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
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
            	  response.sendRedirect("loginTeacher.jsp");
              }
%>
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">Add Question</h2>
                </div>
                <div class="card-body">
                    <form  method = "post" action = "addquestion">
                        
                        <div class="form-row">
                            <div class="name">Question</div>
                            <div class="value">
                                <div class="input-group">
                                    <textarea class="input--style-5" type="text" name="ques" rows="4" cols="48"></textarea>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Option 1.</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="first">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Option 2.</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="second">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Option 3.</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="third">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="name">Option 4.</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="fourth">
                                </div>
                            </div>
                        </div>
                        
                          <div class="form-row">
                            <div class="name">Answer</div>
                            <div class="value" >
                                
                                    <select class="input--style-5" name="ans" style="height:50px;width:497px;">
                                    <option value="1" style="height:50px;width:600px;">FIRST</option>
                                    <option value="2" style="height:50px;width:100px;">SECOND</option>
                                    <option value="3" style="height:50px;width:100px;">THIRD</option>
                                    <option value="4" style="height:50px;width:100px;">FOURTH</option>
                                    </select>
                              
                            </div>
                        </div>
                        <div class="form-row m-b-55" style="margin-left:40%;">
                            
                            <div class="value" style="width: 610px;">
                                <div class="row row-space">
                        <div>
                           <button class="btn btn--radius-2 btn--green" type="submit" >ADD My Question</button>
                           

                        </div>
                              </div>
                           </div>
                       </div>

                    </form>
                    <div class="form-row m-b-55">
                            
                            <div class="value" style="width: 620px;">
                                <div class="row row-space">
                    
                    <a href="delete.jsp"><button class="btn btn--radius-2 btn--red" type="submit" >Clear Previous Test</button></a>
                         <form action = "logoutteacher" method = "post"> <a href="index.jsp"><button class="btn btn--radius-2 btn--blue" type="submit" > Logout From Server</button></a>
                           </form> 
                    
                    </div>
                    </div>
                    </div>
                    <div class="form-row m-b-55">
                            
                            <div class="value" style="width: 620px;">
                                <div class="row row-space">
                    
                    <a href="loginTeacher.jsp"><button class="btn btn--radius-2 btn--red" type="submit" >&nbsp  &nbsp Go Back To Login  &nbsp</button></a>
                          <a href="SeeMarks.jsp"><button class="btn btn--radius-2 btn--blue" type="submit" > view student report</button></a>
                         
                    
                    </div>
                    </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

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
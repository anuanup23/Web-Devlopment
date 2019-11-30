<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Registration</title>
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
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">Sign Up Form</h2>
                </div>
                <div class="card-body">
                    <form  method = "post" action = "addServlet">
                        <div class="form-row m-b-55">
                            <div class="name">Name</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="firstName">
                                            <label class="label--desc">first name</label>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group-desc">
                                            <input class="input--style-5" type="text" name="lastName">
                                            <label class="label--desc">last name</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Roll No.</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="rollno">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Email</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="email" name="email">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Password</div>
                            <div class="value">
                                <div class="input-group">
                                    <input class="input--style-5" type="text" name="password">
                                </div>
                            </div>
                        </div>
                          <div class="form-row">
                            <div class="name">Branch</div>
                            <div class="value" >
                                
                                    <select class="input--style-5" name="branch" style="height:50px;width:497px;">
                                    <option value="CSE" style="height:50px;width:600px;">Computer Science Engineering</option>
                                    <option value="IT" style="height:50px;width:100px;">Information Technology</option>
                                    </select>
                            </div>
                        </div>
                        <div class="form-row m-b-55" style="margin-left:40%;">
                            
                            <div class="value" style="width: 620px;">
                                <div class="row row-space">
                        <div>
                           <button class="btn btn--radius-2 btn--red" type="submit" >Register</button>
                        </div>
                              </div>
                           </div>
                       </div>

                    </form>
                    <div class="form-row m-b-55">
                            
                            <div class="value" style="width: 620px;">
                                <div class="row row-space">
                    
                    <a href="login.jsp"><button class="btn btn--radius-2 btn--green" type="submit" >Already A  User</button></a>
                           <a href="loginTeacher.jsp"><button class="btn btn--radius-2 btn--blue" type="submit" >I'm A Teacher</button></a>
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
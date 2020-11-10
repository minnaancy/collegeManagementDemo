<!DOCTYPE html>
<html lang="en" dir="ltr">
    <%
if(session.getAttribute("username")!=null){
%>
	<head>
		<meta charset="utf-8">
                <title>Admin Home</title>
		  <link rel="stylesheet" type="text/css" href="../CSS/adminhome.css"/>
		 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		
	</head>
	<body>
		<div class="wrapper">
                    <div class="header">
				<div class="header-menu">
					<div class="title">College Management System</div>
					<div class="sidebar-btn">
						<i class="fa fa-bars"></i>
					</div>
					<ul>
                                            <li><a href="logout.jsp"><i class="fa fa-sign-out"></i></a></li>
					</ul>
				</div>
			</div>
			
			<div class="sidebar">
				<div class="sidebar-menu">
					<center class="profile">
						<img src="../images/avatar.png" alt="" class="avatar">
						<p>Administrator</p>
					</center>
					<li class="item" id="profile">
						<a href="#profile" class="menu-btn">
							 <i class="fa fa-address-book"></i><span>Course<i class="fa fa-chevron-down drop-down"></i></span>
						</a>
                                            
						<div class="sub-menu">
                                                    <a href="../dashboard/dash_courseReg.jsp"><i class="fa fa-plus-square"></i><span>Register Course</span></a>
                                                        <a href="../dashboard/dash_courseReport.jsp"><i class="fa fa-tablet"></i><span>Course Details</span></a>   
						</div>
					</li>
					<li class="item" id="messages">
						<a href="#messages" class="menu-btn">
							<i class="fa fa-user-circle-o"></i><span>Student <i class="fa fa-chevron-down drop-down"></i></span>
						</a>
						<div class="sub-menu">
							 <a href="../dashboard/dash_studentRegist.jsp"><i class="fa fa-plus-square"></i><span>Register Student</span></a>
                                                         <a href="../dashboard/dash_studentReport.jsp"><i class="fa fa-tablet"></i><span>Student Details</span></a> 
						</div>
					</li>
					<li class="item" id="settings">
						<a href="#settings" class="menu-btn">
							<i class="fa fa-address-card"></i><span>Department <i class="fa fa-chevron-down drop-down"></i></span>
						</a>
						<div class="sub-menu">
							<a href="../dashboard/dash_departmentReg.jsp"><i class="fa fa-plus-square"></i><span>Register Department</span></a>
                                                        <a href="../dashboard/dash_departmentReport.jsp"><i class="fa fa-tablet"></i><span>Department Details</span></a>
						</div>
					</li>
				</div>
			</div>
			
			<div class="main-container">
                            
                           
			</div>	
		</div>

	</body>
        <%}else{%>
        <script> alert("Please Login");
             window.location="../login.jsp";
        </script>
            
        <%}
        %>
</html>

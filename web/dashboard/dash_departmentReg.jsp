<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@page import="connection.PostgreSQLJDBC"%>
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
		<link rel="stylesheet" type="text/css" href="../CSS/style.css"/>
	</head>
	<body>
             <%
            PostgreSQLJDBC pcon=new PostgreSQLJDBC();
            String str = null;
            Connection con = pcon.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;
            %>
            con.close();
            
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
                            <div class="login" style="width:80vw">
                        <form action="../Action/departmentRegaction.jsp" class="form">
                            <h2>Department Registration</h2>
                        <div class="input">
                         <label> Department Name</label>
                        <input type="text" name="Course" id="Course" required/>
                </div>
               <%
		if(request.getParameter("update")!=null && request.getParameter("update").equals("y")){ %>
                <input type="submit" value="Update" class="button">
                <input type="hidden" name="id" id="id" class="button">
                <%}else{%>
                <input type="submit" value="Register" class="button">                
                <%}%>
                
               
            </form>
        </div>
                           
                   
			</div>	
		</div>
                  <%
		if(request.getParameter("update")!=null && request.getParameter("update").equals("y")){ %>
            <script> 
                
                <%
                str = "select deptname from department where deptid = ?";
                ps = con.prepareStatement(str);   
                ps.setInt(1,Integer.valueOf(request.getParameter("id")));
                rs = ps.executeQuery();                  
                if((rs.next())){
                %>
                    document.getElementById("Course").value = "<%=rs.getString(1)%>";
                   
                    document.getElementById("id").value = "<%=request.getParameter("id")%>";
            </script>
            <%}} %>

	</body>
        <%}else{%>
        <script> alert("Please Login");
             window.location="../login.jsp";
        </script>
            
        <%}
        %>  
</html>

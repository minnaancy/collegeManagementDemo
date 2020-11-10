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
                          <div class="regform">
        <div class="midform">
            <form action="../Action/studentRegaction.jsp" name="form1" >
            <div id="name">
            <h2>Student Registration</h2>
            <h3 class="name"> Name </h3>
            <input class="fname" type="text" id="fname" name="fname" pattern="[A-Z a-z]{2,40}"  title="Name should only contain alphabets" required><br>
            <label class="flabel">First Name</label>
            <input class="lname" type="text" id="lname" name="lname" pattern="[A-Z a-z]{2,40}"  title="Name should only contain alphabets" required>
            <label class="llabel">Last Name</label>
        </div>
        
             
                     <h3 class="name">Address</h3>
            <textarea class="address" rows="5" cols="20" id="address" name="address"></textarea>   
                
                    <h3 class="name"> Date of Birth </h3>
                    <input type="date" name="dat" id="dat" class="dob" required/>
            
        <h3 class="name"> Gender </h3>
        <div class="gender">
            <input type="radio"  name="ma" id="ma" value="Male" ><span id="ma">&nbsp; Male</span>
            <input type="radio"  name="ma" id="ma" value="Female"><span id="ma">&nbsp; Female</span>
            <input type="radio"  name="ma" id="ma" value="Other"><span id="ma">&nbsp; Other</span>
        </div>
        

        <h3 class="name"> Contact Number </h3>
        <input type="number" name="number" id="number" class="code" pattern="[6-9]{1}[0-9]{9}" 
       title="Phone number with 6-9 and remaining 9 digit with 0-9" required/>

        <h3 class="name"> Email </h3>
        <input type="email" name="email" id="email" class="email" required/>
          
        <h3 class="name"> Course </h3>
          <%
            str="select courseid,coursename from course order by coursename ";
             ps = con.prepareStatement(str);                          
             rs = ps.executeQuery();                   
           %>
            <select class="coption" id="subject" name="subject">
            <option disabled="disabled" selected="selected"> Select</option>
            <%
                while(rs.next()){
                %>
                <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                <%
                 }
                %>
                con.close();
        </select>

        <h3 class="name"> Guardian or Parent Name </h3>
        <input type="text" name="gname"  id="gname" class="guardian" pattern="[A-Z a-z]{2,40}"  title="Name should only contain alphabets"  required/>

        <h3 class="name">Guardian or Parent Contact Number </h3>
        <input type="number" name="gnumber" id="gnumber" class="gcode"  pattern="[6-9]{1}[0-9]{9}" 
       title="Phone number with 6-9 and remaining 9 digit with 0-9" required/>

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
		</div>
           <%
		if(request.getParameter("update")!=null && request.getParameter("update").equals("y")){ %>
            <script>
                 <%
                str = "select s.firstname,s.lastname ,s.address ,s.dob ,s.gender ,s.mobile_no,s.emailid,c.coursename,s.guardianname,s.guardiannumber,s.courseid  from student s join course c on s.courseid =c.courseid  where s.studid =?;";
                ps = con.prepareStatement(str);   
                ps.setInt(1,Integer.valueOf(request.getParameter("id")));
                rs = ps.executeQuery();                  
                if((rs.next())){
                %>  var gn = 2;
                    <%
                    if(rs.getString(5).equals("Male")){ %>                  
                        gn = 0; <%}
                    else if (rs.getString(5).equals("Female")) { %>
                        gn = 1; <% } %>
                    document.getElementById("fname").value = "<%=rs.getString(1)%>";
                    document.getElementById("lname").value = "<%=rs.getString(2)%>";
                    document.getElementById("address").value  = "<%=rs.getString(3).replaceAll("[\r\n]+", " ") %>";
//                    document.getElementById("address").value = "Fifth Avenue, New York Cityy..";
                    document.getElementById("dat").value = "<%=rs.getDate(4)%>";                                        
                     document.form1.ma[gn].checked=true;
                    document.getElementById("number").value = "<%=rs.getString(6)%>";
                     document.getElementById("email").value = "<%=rs.getString(7)%>";
                    document.getElementById("subject").value = "<%=rs.getString(11)%>";
                    document.getElementById("gname").value = "<%=rs.getString(9)%>";
                    document.getElementById("gnumber").value = "<%=rs.getString(10)%>";
                    document.getElementById("id").value = "<%=request.getParameter("id")%>";
            </script>
            <%}}%>
	</body>
        
            <%}else{%>
        <script> alert("Please Login");
             window.location="../login.jsp";
        </script>
            
        <%}
        %>  
</html>

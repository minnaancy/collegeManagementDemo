<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@page import="connection.PostgreSQLJDBC"%>
<%
    PostgreSQLJDBC pcon=new PostgreSQLJDBC();
    Connection con = pcon.getConnection();
    PreparedStatement ps = null;
    String str= null;
    
    if(request.getParameter("id")!= null){
        str = "update student set firstname =?,lastname =?,address=?,dob=?,gender=?,mobile_no =?,emailid =?,courseid=?,guardianname =?,guardiannumber =? where studid =?";
        ps = con.prepareStatement(str);   
        ps.setString(1,request.getParameter("fname"));
        ps.setString(2,request.getParameter("lname"));
        ps.setString(3,request.getParameter("address"));
        ps.setDate(4,Date.valueOf(request.getParameter("dat")));
        ps.setString(5,request.getParameter("ma"));
        ps.setString(6,request.getParameter("number"));
        ps.setString(7,request.getParameter("email"));
        ps.setInt(8,Integer.valueOf(request.getParameter("subject")));
        ps.setString(9,request.getParameter("gname"));
        ps.setString(10,request.getParameter("gnumber"));
        ps.setInt(11,Integer.valueOf(request.getParameter("id")));
        
         if(ps.executeUpdate() > 0){
         %>
        <script>  
            alert("Successfully Updated");
            window.location="../dashboard/dash_studentReport.jsp";
        </script>
        <%
         }else{
             %>
        <script>
            alert("Failed...");
            window.location="../dashboard/dash_studentRegist.jsp";
        </script>
        <%}
    }else{
    str="insert into student (firstname ,lastname ,address ,dob ,mobile_no ,emailid ,gender ,courseid,guardianname ,guardiannumber ) values(?,?,?,?,?,?,?,?,?,?)";
    ps = con.prepareStatement(str);
    ps.setString(1,request.getParameter("fname"));
    ps.setString(2,request.getParameter("lname"));
    ps.setString(3,request.getParameter("address"));
    ps.setDate(4,Date.valueOf(request.getParameter("dat")));
    ps.setString(5,request.getParameter("number"));
    ps.setString(6,request.getParameter("email"));
    ps.setString(7,request.getParameter("ma"));
    ps.setInt(8,Integer.valueOf(request.getParameter("subject")));
    ps.setString(9,request.getParameter("gname"));
    ps.setString(10,request.getParameter("gnumber"));
        
         if(ps.executeUpdate() > 0){
         %>
    <script>  
        alert("Successfully Added");
        window.location="../dashboard/dash_studentRegist.jsp";
    </script>
    <%
     }else{
         %>
    <script>
        alert("Failed...");
        window.location="../dashboard/dash_studentRegist.jsp";
    </script>
    <%}
    }

    con.close();
%>
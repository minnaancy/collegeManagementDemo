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
        str = "update course set coursename = ?,duration = ?,deptid = ? where courseid = ?";
        ps = con.prepareStatement(str);   
        ps.setString(1,request.getParameter("Course"));
        ps.setInt(2,Integer.valueOf(request.getParameter("number")));
        ps.setInt(3,Integer.valueOf(request.getParameter("dept")));
        ps.setInt(4,Integer.valueOf(request.getParameter("id")));
        
         if(ps.executeUpdate() > 0){
         %>
        <script>  
            alert("Successfully Updated");
            window.location="../dashboard/dash_courseReport.jsp";
        </script>
        <%
         }else{
             %>
        <script>
            alert("Failed...");
            window.location="../dashboard/dash_courseReg.jsp";
        </script>
        <%}
    }else{
        str="insert into course(coursename,duration,deptid) values(?,?,?)";
        ps = con.prepareStatement(str);
        ps.setString(1,request.getParameter("Course"));
        ps.setInt(2,Integer.valueOf(request.getParameter("number")));
        ps.setInt(3,Integer.valueOf(request.getParameter("dept")));
        
         if(ps.executeUpdate() > 0){
         %>
    <script>  
        alert("Successfully Added");
        window.location="../dashboard/dash_courseReg.jsp";
    </script>
    <%
     }else{
         %>
    <script>
        alert("Failed...");
        window.location="../dashboard/dash_courseReg.jsp";
    </script>
    <%}
    } 
    con.close();
%>
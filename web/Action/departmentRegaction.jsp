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
        str = "update department set deptname = ? where deptid = ?";
        ps = con.prepareStatement(str);   
        ps.setString(1,request.getParameter("Course"));
       
        ps.setInt(2,Integer.valueOf(request.getParameter("id")));
        
         if(ps.executeUpdate() > 0){
         %>
        <script>  
            alert("Successfully Updated");
            window.location="../dashboard/dash_departmentReport.jsp";
        </script>
        <%
         }else{
             %>
        <script>
            alert("Failed...");
            window.location="../dashboard/dash_departmentReg.jsp";
        </script>
        <%}
    }else{
          str="insert into department(deptname) values(?)";

        ps = con.prepareStatement(str);
        ps.setString(1,request.getParameter("Course"));
       
        
         if(ps.executeUpdate() > 0){
         %>
    <script>  
        alert("Successfully Added");
        window.location="../dashboard/dash_departmentReg.jsp";
    </script>
    <%
     }else{
         %>
    <script>
        alert("Failed...");
        window.location="../dashboard/dash_departmentReg.jsp";
    </script>
    <%}
    }
   con.close();
%>
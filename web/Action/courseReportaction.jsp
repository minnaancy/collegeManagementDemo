<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@page import="connection.PostgreSQLJDBC"%>
<%
    PostgreSQLJDBC pcon=new PostgreSQLJDBC();
    Connection con = pcon.getConnection();
    String str;
    if(request.getParameter("action").equals("d")){
        str="delete from course where courseid=?";
         PreparedStatement ps = con.prepareStatement(str);        
        ps.setInt(1,Integer.valueOf(request.getParameter("id")));
        if(ps.executeUpdate() > 0){
         %>
            <script>  
                alert("Successfully Deleted");
                window.location="../dashboard/dash_courseReport.jsp";
            </script>
            <%
             }else{
                 %>
            <script>
                alert("Failed...");
                window.location="../dashboard/dash_courseReport.jsp";
            </script>
            <%}
            con.close();
            }else if(request.getParameter("action").equals("e")){ %>
                <script>
                window.location="../dashboard/dash_courseReg.jsp?update=y&id="+<%=request.getParameter("id")%>;
                </script>
            <%}
    
    
   
     
%>
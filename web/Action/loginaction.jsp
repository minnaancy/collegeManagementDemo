<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@page import="connection.PostgreSQLJDBC"%>
<%
    String username=request.getParameter("user");
    String password=request.getParameter("pass");
    System.out.print(username);
    System.out.print(password);
    PostgreSQLJDBC pcon=new PostgreSQLJDBC();
    String str="select username from userreg where username= ? and password= ? ";
    Connection con = pcon.getConnection();
    PreparedStatement ps = con.prepareStatement(str);
    ps.setString(1,username );
     ps.setString(2,password);
     ResultSet rs = ps.executeQuery();
     if(rs.next()){
         session.setAttribute("username",rs.getString(1));
         %>
    <script>     
        window.location="../dashboard/adminhome.jsp";
    </script>
    <%
     }else{
         %>
    <script>
        alert("Check your username or you are not registered");
        window.location="../login.jsp";
    </script>
    <%}
    con.close();
%>
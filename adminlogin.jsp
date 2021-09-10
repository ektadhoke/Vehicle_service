<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("a_uname");    
    String pwd = request.getParameter("a_pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer",
            "root", "ekta");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from admin where A_name='" + userid + "' and A_pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("admin.jsp");
    } else {
        out.println("Invalid password <a href='index.html'>try again</a>");
          %>
        
        <script>   
            alert("Login Failed...please try again !!!!");           
       </script>
    <%             
 
    }
%>
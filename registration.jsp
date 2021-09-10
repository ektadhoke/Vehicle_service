<%@ page import ="java.sql.*" %>

<%
    String uname = request.getParameter("u_uname");    
    String pass = request.getParameter("u_pass");
    String fname = request.getParameter("u_fname");
    String lname = request.getParameter("u_lname");
    String mono = request.getParameter("u_mono");
    String city = request.getParameter("u_city");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer",
            "root", "ekta");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into user(fname, lname, mono, city, uname, pass) values ('" + fname + "','" + lname + "','" + mono + "','" + city + "','" + uname + "','" + pass + "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
       // response.sendRedirect("home.html");
       out.print("<a href='index.html'>Goto Login</a>");
     %>
        
        <script>   
            alert("Registration Successful...click on Login !!!!");           
       </script>
    <%             
 
    
    } else {
        //response.sendRedirect("home.html");
        out.print("<a href='index.html'>goto homepage</a>");
          %>
        
        <script>   
            alert("Registration Failed...try again !!!!");           
       </script>
    <%             
 
    }
%>
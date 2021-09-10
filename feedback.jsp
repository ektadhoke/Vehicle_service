<%@ page import ="java.sql.*" %>

<%
    String msg = request.getParameter("msg");    
     String name = request.getParameter("name");    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer",
            "root", "ekta");
    Statement st = con.createStatement();
    //ResultSet rs;
     int i = st.executeUpdate("insert into feedback(msg,name) values ('" + msg + "','" + name + "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
       // response.sendRedirect("user.html");
       out.print("welcome!"+"<a href='user.html'>Click Back</a>");
        %>
        
        <script>   
            alert("FeedBack Submited!!!!!!!! Thanks...");           
       </script>
    <%             
 
    
    } else {
        response.sendRedirect("index.html");
     // out.print("Registration failed!"+"<a href='home.html'>go to home page</a>");
     
    }
%>
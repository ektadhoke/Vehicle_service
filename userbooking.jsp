<%@ page import ="java.sql.*" %>

<%
    String name = request.getParameter("name");    
    String mo_no = request.getParameter("mo_no");
    String company = request.getParameter("company");
    String address = request.getParameter("address");
    String vehicle_no = request.getParameter("vehicle_no");
    Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer", "root", "ekta");

    Statement st = con.createStatement();

    int i = st.executeUpdate("insert into booking(name,  mo_no, company, address,vehicle_no) values ('" + name + "','" + mo_no + "','" + company + "','" + address + "','" +vehicle_no + "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        //response.sendRedirect("user.html");
       out.print("<a href='user.html'>go back</a>");
         %>
        
        <script>   
            alert("booking Successful !!!!");           
       </script>
    <%             
 
    } else {
        //response.sendRedirect("home.html");
        out.print("Booking failed!"+"<a href='user.html'>go back</a>");
    }
%>
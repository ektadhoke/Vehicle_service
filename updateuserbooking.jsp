<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
 
<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String mo_no = request.getParameter("mo_no");
        String address = request.getParameter("address");
        String company = request.getParameter("company");
        String vehicle_no = request.getParameter("vehicle_no");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer",
            "root", "ekta");
        pst = con.prepareStatement("update booking set mo_no = ?,address =?,compnay =?,vehicle_no=? where id = ?");
        pst.setString(1, mo_no);
        pst.setString(2, address);
        pst.setString(3, company);
        pst.setString(4, vehicle_no);
   
         pst.setString(5, id);
        pst.executeUpdate();  
        
        %>
        
        <script>   
            alert("successfully Updated!!!!!");           
       </script>
    <%             
    }
 
%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome</title> 
        
         <link href="./css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
  
    </head>
    <body>
        <h1>Update Details</h1>
        
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >
                    
                    <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer",
            "root", "ekta");
                           
                          String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from booking where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    <div alight="left">
                        <label class="form-label">Contact Number</label>
                        <input type="text" class="form-control" placeholder="your contact no.." value="<%= rs.getString("mo_no")%>" name="mo_no" id="mo_no" >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Enter Address</label>
                        <input type="text" class="form-control" placeholder="your address...." name="address" value="<%= rs.getString("address")%>" id="address"  >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Vehicle Company</label>
                         <input type="text" class="form-control" placeholder="vehicel company" name="company" value="<%= rs.getString("company")%>" id="company"  >
                     </div>
                     <div alight="left">
                        <label class="form-label">Vehicle Number</label>
                         <input type="text" class="form-control" placeholder="vehicel number" name="vehicle_no" value="<%= rs.getString("vehicle_no")%>" id="vehicle_no"  >
                     </div>
                     
                    
                    <% }  %>
                    
                    
                    
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                     </div>  
                         
                         <div align="right">
                             
                             <p><a href="user.html">Click Back</a></p>
                             
                             
                         </div>
  
                </form>
            </div>          
        </div>
  
    </body>
</html><%-- 
    Document   : update
    Created on : 27 Mar, 2021, 3:14:47 PM
    Author     : user
--%>
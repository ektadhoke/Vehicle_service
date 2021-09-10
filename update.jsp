<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
 
<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String charges = request.getParameter("charges");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer",
            "root", "ekta");
        pst = con.prepareStatement("update booking set charges = ?,description =?,status =? where id = ?");
        pst.setString(1, charges);
        pst.setString(2, description);
        pst.setString(3, status);
    
         pst.setString(4, id);
        pst.executeUpdate();  
        
        %>
        
        <script>   
            alert("Record Updated!!!!!");           
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
         <link rel="stylesheet" href="./css/responsive.css">
        <style>
            body{
                background-color:#001221;
                color:goldenrod;
                padding: 60px;
            }
        </style>
        
        
    </head>
    <body>
        <div clss="container">
            
         <div class="row">
              
              <div class="col-lg-6">
        <h1>Record Update</h1>
        
        
        
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
                        <label class="form-label">Service Charges</label>
                        <input type="text" class="form-control" placeholder="Charges" value="<%= rs.getString("charges")%>" name="charges" id="charges" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Description</label>
                        <input type="text" class="form-control" placeholder="description" name="description" value="<%= rs.getString("description")%>" id="description" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Status</label>
                         <input type="text" class="form-control" placeholder="status" name="status" value="<%= rs.getString("status")%>" id="status" required >
                     </div>
                    
                    <% }  %>
                    
                    
                    
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                     </div>  
                         
                         <div align="right">
                             
                             <p><a href="admin.jsp">Click Back</a></p>
                             
                             
                         </div>
  
                </form>
            </div>          
        
  <div class="col-md-6">
                  <div id="slider_main" class="carousel slide" data-ride="carousel">
                     <img src="./images/slider_2.png" alt="#" />
              
              </div>
  </div></div>
        </div>  
    </body>
</html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "customer";
String userid = "root";
String password = "ekta";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body{
                padding: 50px;
                background-color: #001212;
                color:white;
            }
            td{
                width: 120px;
                height: 60px;
                text-align: center;
            }
          
        </style>
        <title>welcome</title>
    </head>
<body>

    <h1 style="color:gold;">View your Bookings</h1>
<table border="1">
<tr>
 <td>Service ID</td>
    <td>Full Name</td>
<td>Contact Number</td>
<td> Your Address</td>
<td>Vehicle company</td>
<td>Vehicle Number</td>
<td>Charges</td>
<td>Description</td>
<td>Status</td>
</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from booking";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("ID") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("mo_no") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("company") %></td>
<td><%=resultSet.getString("vehicle_no") %></td>
<td><%=resultSet.getString("charges") %></td>
<td><%=resultSet.getString("description") %></td>
<td><%=resultSet.getString("status") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>

<button><a href='user.html'>Click Back</a></button>
</body>
</html>
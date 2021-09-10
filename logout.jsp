<%
session.setAttribute("U_Uname", null);
session.invalidate();
response.sendRedirect("index.html");
%>
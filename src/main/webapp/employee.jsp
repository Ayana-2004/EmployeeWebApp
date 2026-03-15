<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Entry Form</title>
</head>
<body>
<h2>Employee Entry Form</h2>
<form action="SaveEmployee" method="post">

Employee Name:
<input type="text" name="name"><br><br>

Department:
<select name="dept">
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con =DriverManager.getConnection(
"jdbc:mysql://localhost:3306/company","root","root");

Statement st = con.createStatement();
ResultSet rs= st.executeQuery("select* from department");

while(rs.next()){

%>
<option value="<%=rs.getInt("dept_id") %>">
<%=rs.getString("dept_name") %>
</option>

<%
}
%>
</select>

<br><br>

Designation:
<select name="desig">

<%
ResultSet rs2 =st.executeQuery("SELECT * FROM designation");
while(rs2.next()){
%>
<option value="<%=rs2.getInt("desig_id") %>">
<%=rs2.getString("desig_name") %>
</option>

<%
}
%>

</select>
<br><br>

salary:
<input type="text" name="salary"><br><br>

<input type="submit" value="save">
</form>

</body>
</html>
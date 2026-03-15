<%@ page import="java.sql.*" %>

<html>
<head>
<title>Employee Report</title>
</head>

<body>

<h2>Employee Report</h2>

<table border="1">
<tr>
<th>Employee Name</th>
<th>Department</th>
<th>Designation</th>
<th>Salary</th>
</tr>

<%
try {

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/company","root","root");

Statement st = con.createStatement();

ResultSet rs = st.executeQuery(
"SELECT e.emp_name, d.dept_name, g.desig_name, e.salary " +
"FROM employee e " +
"JOIN department d ON e.dept_id=d.dept_id " +
"JOIN designation g ON e.desig_id=g.desig_id"
);

while(rs.next()){
%>

<tr>
<td><%=rs.getString("emp_name")%></td>
<td><%=rs.getString("dept_name")%></td>
<td><%=rs.getString("desig_name")%></td>
<td><%=rs.getInt("salary")%></td>
</tr>

<%
}

}catch(Exception e){
out.println(e);
}
%>

</table>

</body>
</html>
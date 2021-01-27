<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "Library";
String userid = "root";
String password = "password";
String btitle=request.getParameter("Btitle");
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
<body>
<h1>Search Book</h1>
<table border="1">
<tr>
<td>Book Id</td>
<td>Book Title</td>
<td>Book Author</td>
<td>Available Number of Copies of the Book</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from Books where Btitle='"+btitle+"' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("Bid") %></td>
<td><%=resultSet.getString("Btitle") %></td>
<td><%=resultSet.getString("Bname") %></td>
<td><%=resultSet.getString("Bquantity") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
out.println("Error: Book Search Failed");
}
%>
</table>
</body>
</html>

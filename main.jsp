<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid=request.getParameter("id");
session.putValue("userid",userid);
String password=request.getParameter("pass");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Library","root","password");
Statement st= con.createStatement();
if (userid.equals("ADMIN") && password.equals("admin")){
    String redirectURL = "http://localhost:8080/test/adminaddlib.html";
    response.sendRedirect(redirectURL);
}
else{
ResultSet rs=st.executeQuery("select * from Librarians where Lid='"+userid+"' and Lpassword='"+password+"'");
try{
rs.next();
if(rs.getString("Lpassword").equals(password) && rs.getString("Lid").equals(userid))
{
String redirectURL = "http://localhost:8080/test/addbooks.html";
response.sendRedirect(redirectURL);
}
else{
out.println("Invalid password or username.");
}
}
catch (Exception e) {
out.println("Error: Login Failed");
}
}
%>

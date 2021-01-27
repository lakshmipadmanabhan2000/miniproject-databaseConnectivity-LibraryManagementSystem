<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("Bid");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Library", "root", "password");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM Books WHERE Bid="+id);
if (i>0){
out.println("Book Deletion Succesful");
}
else{
    out.println("Error: Book Deletion Failed");
}
}
catch(Exception e)
{
out.println("Error: Book Deletion Failed");
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/Library";%>
<%!String user = "root";%>
<%!String psw = "password";%>
<%
String id = request.getParameter("Bid");
String copies=request.getParameter("Bcopies");
int c= Integer.parseInt(copies);

if(id != null && c>0)
{
Connection con = null;
PreparedStatement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Books set Bid=?,Bquantity=? where Bid="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2,copies);

int i = ps.executeUpdate();
if(i > 0)
{
out.print("Updation Successful");
}
else
{
out.print("Error: Book Updation Failed");
}
}

catch(SQLException sql)
{

out.println("Error: Book Updation Failed");
}
}
else{
    out.println("Error: Book Updation Failed");  
}
%>
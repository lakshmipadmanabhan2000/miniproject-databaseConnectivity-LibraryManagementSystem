<%@page import="java.sql.*,java.util.*,javax.swing.*,java.lang.*"%>

<%
String l1=request.getParameter("Lid");
String l2 = request.getParameter("Lname");
String l3=request.getParameter("Lpassword");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Library","root","password");
    Statement st=con.createStatement();
	String sql="insert into Librarians (Lid,Lname,Lpassword) values (?,?,?)";
    PreparedStatement statement=con.prepareStatement(sql);
	statement.setString(1,l1);
    statement.setString(2,l2);
    statement.setString(3,l3);
    statement.executeUpdate();
    out.println("Insertion Succesful");
	%>
	
<%
	
	con.close();
}  
catch(Exception e)
{
	out.println("Error: Librarian Insertion Failed");
}
%>

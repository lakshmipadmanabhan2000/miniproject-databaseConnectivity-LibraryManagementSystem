<%@page import="java.sql.*,java.util.*,javax.swing.*,java.lang.*"%>

<%
String bid=request.getParameter("Bid");
String btitle=request.getParameter("Btitle");
String bname = request.getParameter("Bname");
String bquantity=request.getParameter("Bquantity");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Library","root","password");
    Statement st=con.createStatement();
	String sql="insert into Books (Bid,Btitle,Bname,Bquantity) values (?,?,?,?)";
    PreparedStatement statement=con.prepareStatement(sql);
	statement.setString(1,bid);
    statement.setString(2,btitle);
    statement.setString(3,bname);
	statement.setString(4,bquantity);
    statement.executeUpdate();
    out.println("Insertion Succesful");
	%>
	
<%
	
	con.close();
}  
catch(Exception e)
{
	out.println("Error: Book Insertion Failed");
}
%>

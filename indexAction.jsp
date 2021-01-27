<%@page import="java.sql.*,java.util.*,javax.swing.*,java.lang.*"%>

<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobileno = request.getParameter("mobileno");
String username=request.getParameter("username");
String password=request.getParameter("password");
String gender=request.getParameter("gender");
String designation=request.getParameter("designation");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Office","root","password");
    Statement st=con.createStatement();
	String sql="insert into Staff (Name,Email,username,password,gender,MobileNo,Designation) values (?,?,?,?,?,?,?)";
    PreparedStatement statement=con.prepareStatement(sql);
	statement.setString(1,name);
    statement.setString(2,email);
    statement.setString(3,username);
	statement.setString(4,password);
	statement.setString(5,gender);
	statement.setString(6,mobileno);
	statement.setString(7,designation);
    statement.executeUpdate();
    
	%>
<script type="text/javascript">
    alert("Inserted Successfully");
</script>
<%
	
	con.close();
}  
catch(Exception e)
{
	out.println(e);
}
%>

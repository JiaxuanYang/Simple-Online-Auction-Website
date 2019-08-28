<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit user info</title>
<style>
.button {
background-color: #008CBA;
font-size: 16px;
border: none;
  color: white;} 
</style>
</head>
<body style="background-color:#F0F8FF;">

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
try{

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");
	Statement st = con.createStatement();

	int id = Integer.parseInt(request.getParameter("edit"));
	ResultSet rs=st.executeQuery("select * from End_User where account_id ='" + id + "'");
	
	if(rs.next()){
		
	out.print("<center><h1>The user ID is: " + id +"</h1></center><br>");
	session.setAttribute("edit_id",id);
	
	%>

	<table style="margin: 0px auto;">	
	<tr>
	<td>Change the Username:</td>
	<td><a href = edit_uname.html><button class="button">Edit Username</button></a></td>
	</tr>	

	<tr>
	<td>Or you want to:</td>
	<td><a href = edit_pwd.html><button class="button">Edit Password</button></a></td>
	</tr>
	</table>

	<% 	
		
	}else{
		out.print("Error: ID doesn't exist");
	}
	con.close();
}catch (Exception ex) {
	out.print("Error occured");
}	

%>


</body>
</html>
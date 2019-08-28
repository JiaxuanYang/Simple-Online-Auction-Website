<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style>
.button {
background-color: #e7e7e7; color: black; border: none;
font-size: 16px;
}
</style>
</head>
<body style="background-color:#F0F8FF;">

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%

try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");
Statement st = con.createStatement();

int id = Integer.parseInt(request.getParameter("account_id"));    
String pwd = request.getParameter("password");

//session.setAttribute("id",id);
session.setAttribute("pwd",pwd);

ResultSet rs=st.executeQuery("select * from End_User where account_id ='" + id + "' and password ='" + pwd + "'"); 
if(rs.next()){
	out.println("Login success!");
	%>
	<br>
	<a href= account.jsp?id=<%= id %>><button class="button">Account Profile</button></a>
	<% 
}else{
	out.println("Please enter the correct username and password.");
	%>
	<br>
	<a href= index.html><button class="button">Return</button></a>
	<% 
}

con.close();
} catch (Exception ex) {
	
	out.print("fail to login: please enter vaild id and password");
}
%>




</body>
</html>
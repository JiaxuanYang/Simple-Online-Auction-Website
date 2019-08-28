<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.button {
background-color: #008CBA;
border: none;
font-size: 16px;
  color: white;} 
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

	int id = Integer.parseInt(request.getParameter("adid"));//(Integer)session.getAttribute("id"); 
	
	ResultSet rs=st.executeQuery("select * from AAdmin where adaccount_id ='" + id + "'");
	
	if(!rs.next()){
		out.println("Permission denied: you are not an administrator!");
	}else{
	%>
	<center>
	<h1>Hello Admin, you can:</h1>
	<a href= reg_cus_rep.html><button class="button">Create Customer Representative Account</button></a>
	<br><br>
	<a href= sales_report.jsp?theid=<%= id %>><button class="button">Generate Sales Report</button></a>		
	</center>
	<% 
	}
	con.close();
	
}catch (Exception ex) {
	out.print("Error occured");
}
%>

</body>
</html>
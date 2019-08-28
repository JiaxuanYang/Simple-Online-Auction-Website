<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Representative</title>
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
try {

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");
	Statement st = con.createStatement();

	int id = Integer.parseInt(request.getParameter("cid"));//(Integer)session.getAttribute("id"); 
	String pwd = (String)session.getAttribute("pwd");
	
	ResultSet rs=st.executeQuery("select * from Customer_Rep where caccount_id =" + id);
	
	if(!rs.next()){
		out.println("Permission deined: you are not a customer representative");
	}else{
		
		%>
		<center>
		<h1>Hello, you can:</h1>
		<br><br>
		<a href= answer.jsp><button class="button">Answer Questions</button></a>
		<br><br>
		<a href= edit.html><button class="button">Edit info</button></a>
		<br><br>
		<a href= rm_bid.html><button class="button">Remove Bid</button></a>
		<br><br>
		<a href= rm_auction.html><button class="button">Remove Auction</button></a>
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
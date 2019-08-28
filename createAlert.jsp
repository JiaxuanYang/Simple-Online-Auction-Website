<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:#F0F8FF;">

<%
	try {

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");
		
		int id = Integer.parseInt(request.getParameter("account_id"));    
		int iid = Integer.parseInt(request.getParameter("item_id"));

		String insert = "INSERT INTO Alert(item_id, eaccount_id)"
				+ "VALUES (?, ?)";
		PreparedStatement ps = con.prepareStatement(insert);
		
		ps.setInt(1, iid);
		ps.setInt(2, id);
		
		ps.executeUpdate();
		out.println("Alert created!");
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed to make alert");
	}
%>

</body>
</html>
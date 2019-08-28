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

		Statement st = con.createStatement();

		int id = Integer.parseInt(request.getParameter("account_id"));    

		Statement stmt = con.createStatement();

		String question = request.getParameter("question");
		Random r = new Random();
		int qid = r.nextInt(10000);
			
		String insert = "INSERT INTO Question(qid, question, answer, account_id)"
				+ "VALUES (?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(insert);
			
		ps.setInt(1, qid);
		ps.setString(2, question);
		ps.setString(3, null);
		ps.setInt(4, id);
			//Run the query against the DB
		ps.executeUpdate();
			
		out.print("question posted!");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed to post question");
	}
%>
</body>
</html>
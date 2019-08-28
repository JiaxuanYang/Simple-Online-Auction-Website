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

		String select = "SELECT * FROM Email WHERE to_='" +id+ "'";
		
		ResultSet rs=st.executeQuery(select); 
		
		out.print("<table>");

		out.print("<tr>");

		out.print("<td>");
		out.print("From");
		out.print("</td>");
	
		out.print("<td>");
		out.print("To");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Subject");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Date");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Content");
		out.print("</td>");
	
		out.print("</tr>");
		
		while(rs.next()){
			
			out.print("<tr>");
			
			out.print("<td>");
			out.print(rs.getString("from_"));
			out.print("</td>");
		
			out.print("<td>");
			out.print(rs.getString("to_"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("subject_"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("date_time"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("content"));
			out.print("</td>");
		
			out.print("</tr>");
		}
		out.print("</table>");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed to show emails");
	}
%>

</body>
</html>
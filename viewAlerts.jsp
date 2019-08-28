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

		String select = "SELECT item_id, alertmessage FROM Alert WHERE eaccount_id='" +id+ "'";
		
		ResultSet rs=st.executeQuery(select); 
		
		out.print("<table>");

		out.print("<tr>");

		out.print("<td>");
		out.print("Item ID");
		out.print("</td>");
	
		out.print("<td>");
		out.print("Alert Message");
		out.print("</td>");
	
		out.print("</tr>");
		
		while(rs.next()){
			
			out.print("<tr>");
			
			out.print("<td>");
			out.print(rs.getString("item_id"));
			out.print("</td>");
		
			out.print("<td>");
			out.print(rs.getString("alertmessage"));
			out.print("</td>");
		
			out.print("</tr>");
		}
		out.print("</table>");
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed to show alerts");
	}
%>

</body>
</html>
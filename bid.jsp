<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>bid</title>
</head>
<body style="background-color:#F0F8FF;">
<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");
	Statement st = con.createStatement();
	String aaid= request.getParameter("auid");
	String seid = request.getParameter("selfid");
	String ss="SELECT * FROM Bid WHERE eaccount_id= " + seid + " AND aid= " + aaid;
	ResultSet result = st.executeQuery(ss);
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>");
	out.print("aid");
	out.print("</td>");
	out.print("<td>");
	out.print("amount");
	out.print("</td>");
	out.print("<td>");
	out.print("i_am_winning");
	out.print("</td>");
	out.print("<td>");
	out.print("date");
	out.print("</td>");
	out.print("</tr>");
	while (result.next()) {
		out.print("<tr>");
		out.print("<td>");
		out.print(result.getInt("aid"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getInt("amount"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getBoolean("is_winning"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getDate("date"));
		out.print("</td>");
		out.print("</tr>");

	}
	out.print("</table>");
	con.close();
	
%>>

<br>
	<form method="post" action="setnewbid.jsp">
	<table>
	<tr>    
	<td>amount</td><td><input type="text" name="amount"></td>
	</tr>
	</table>
	<input type ="hidden" name="auid" value="<%=aaid %>">
	<input type ="hidden" name="selfid" value="<%=seid %>">
	<input type ="hidden" name="maxmun" value="0">
	<input type="submit" value="submit new bid">
	</form>
<br>

<br>
	<form method="post" action="setaudobid.jsp">
	<table>
	</table>
	<input type ="hidden" name="auid" value="<%=aaid %>">
	<input type ="hidden" name="selfid" value="<%=seid %>">
	<input type="submit" value="set auto bid">
	</form>
<br>
</body>
</html>
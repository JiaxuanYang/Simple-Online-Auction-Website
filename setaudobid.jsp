<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:#F0F8FF;">
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
	String aaaid= request.getParameter("auid");
	String sssid= request.getParameter("selfid");
%>

<br>
	<form method="post" action="setnewbid.jsp">
	<table>
	<tr>    
	<td>upper limit</td><td><input type="text" name="maxmun"></td>
	</tr>
	<tr>    
	<td>amount</td><td><input type="text" name="amount"></td>
	</tr>
	</table>
	<input type ="hidden" name="auid" value="<%=aaaid %>">
	<input type ="hidden" name="selfid" value="<%=sssid %>">
	<input type="submit" value="submit new bid">
	</form>
<br>
</body>
</html>
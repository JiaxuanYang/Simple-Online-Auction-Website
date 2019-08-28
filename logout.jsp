<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>


<%
try{

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");
	Statement st = con.createStatement();


	session.invalidate();

	response.sendRedirect("index.jsp");

	con.close();
} catch (Exception ex) {
		
	out.print("fail to login: please enter vaild id and password");
}

%>

</body>
</html>
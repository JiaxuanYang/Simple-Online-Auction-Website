<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove an Auction</title>
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

	int aid = Integer.parseInt(request.getParameter("aid"));

	String delete = "DELETE FROM Auction WHERE aid = ?";
	PreparedStatement ps = con.prepareStatement(delete);

	ps.setInt(1,aid);
	if(ps.executeUpdate() == 0){
		out.print("Cannot delete");
	}else{
		out.print("Delete success");
	}

	con.close();
} catch (Exception ex) {
	out.print("Error occured: please check if the aid is valid");
}
%>


</body>
</html>
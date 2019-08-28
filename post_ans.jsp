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
try {
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");
	Statement st = con.createStatement();

	int qid = Integer.parseInt(request.getParameter("qid")); 
	//out.print(qid);
	
	String ans = request.getParameter("ans");
	
	String update = "UPDATE Question SET answer = ? WHERE qid = ?";
	PreparedStatement ps = con.prepareStatement(update);
	
	ps.setString(1, ans);
	ps.setInt(2, qid);
	
	ps.executeUpdate();
    ps.close();
    
    con.close();

}catch (Exception ex) {
	out.print("Error occured");
}
%>
<a href= answer.jsp>Return</a>
</body>
</html>
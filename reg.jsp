<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
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

int user = Integer.parseInt(request.getParameter("account_id"));    
String pwd = request.getParameter("password");
String uname = request.getParameter("username");

ResultSet rs=st.executeQuery("select * from End_User where account_id ='" + user + "'");
if(rs.next()){
	out.println("Duplicate user id: try another id");
}else{

String insert = "INSERT INTO End_User(account_id, password,username)"
		+ "VALUES (?, ?,?)";

PreparedStatement ps = con.prepareStatement(insert);
ps.setInt(1, user);
ps.setString(2,pwd);
ps.setString(3, uname);
int i = ps.executeUpdate();

if(i > 0){
	out.print("Registeration complete!");
}else{
	out.print("Fail to register: try another Id and/or password");
}
}
con.close();
} catch (Exception ex) {
	out.print("fail to register: please enter vaild id and password, user id must be numbers");
}
%>
<a href= index.jsp>Login Page</a>
</body>
</html>
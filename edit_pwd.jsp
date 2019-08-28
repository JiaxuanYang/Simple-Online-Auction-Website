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

	int id = (Integer)session.getAttribute("edit_id"); 
	String pwd = request.getParameter("edit_password");
	
	ResultSet rs=st.executeQuery("select * from End_User where account_id ='" + id + "'");

	if(rs.next()){
		
		String update = "UPDATE End_User SET password = ? WHERE account_id = ?";
		
		PreparedStatement ps = con.prepareStatement(update);
		
		ps.setString(1, pwd);
		ps.setInt(2, id);

		ps.executeUpdate();
	    ps.close();
	}else{
		out.print("Error: Account doesn't exist");
	}
	con.close();
}catch (Exception ex) {
	out.print("Error occured");
}	

%>	
<a href= edit.html>Return</a>

</body>
</html>
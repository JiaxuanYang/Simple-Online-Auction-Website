<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Customer Representative Account</title>
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
	
	int id = Integer.parseInt(request.getParameter("account_id"));    
	ResultSet rs=st.executeQuery("select * from End_User where account_id ='" + id + "'"); 
	
	if(rs.next()){
		
		String insert = "INSERT INTO Customer_Rep(caccount_id)"
				+ "VALUES (?)";
		PreparedStatement ps = con.prepareStatement(insert);
		ps.setInt(1, id);
		
		int i = ps.executeUpdate();
		
		if(i > 0){
			out.print("Registeration complete!");
		}else{
			out.print("Fail to register");
		}
		
	}else{
		out.print("End user does not exist, please create an account before make it a customer representative");
	}

	con.close();
}catch (Exception ex) {
	out.print("Error occured: please check if id you entered is already a Customer Representative");
}
%>
</body>
</html>
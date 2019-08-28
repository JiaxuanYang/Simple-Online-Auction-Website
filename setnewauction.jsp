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
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");
		Statement st = con.createStatement();
		String newitem = request.getParameter("item");
		String category = request.getParameter("category");
		int eaid = Integer.parseInt(request.getParameter("accountid"));
		float incrementprice = Float.valueOf(request.getParameter("increment"));
		float newiprice = Float.valueOf(request.getParameter("initial_price"));
		float newmprice = Float.valueOf(request.getParameter("minimum_price"));
		String sdate = request.getParameter("start_date");
		String edate = request.getParameter("end_date");
		SimpleDateFormat sda=new SimpleDateFormat("dd-MM-yyyy");
		java.util.Date sdd=sda.parse(sdate);
		java.util.Date edd=sda.parse(edate);
		java.sql.Date sddd=new java.sql.Date(sdd.getTime());
		java.sql.Date eddd=new java.sql.Date(edd.getTime());
		String a ="no one";
		String insert="INSERT INTO Auction"+" values (NULL,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(insert);
		PreparedStatement pp = con.prepareStatement("INSERT INTO Item values (NULL,?,?)");
		pp.setString(1,newitem);
		pp.setString(2,category);
		pp.executeUpdate();
		String ss="SELECT * FROM Item order by item_id desc limit 1";
		ResultSet result = st.executeQuery(ss);
		result.next();
		int iid=result.getInt("item_id");
		ps.setInt(8, iid);
		ps.setInt(7,eaid);
		ps.setFloat(5, incrementprice);
		ps.setFloat(4, newiprice);
		ps.setString(3,a);
		ps.setFloat(6, newmprice);
		ps.setDate(1, sddd);
		ps.setDate(2, eddd);
		ps.executeUpdate();
		con.close();
		out.print("Insert succeeded!");
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
	%>
</body>
</html>
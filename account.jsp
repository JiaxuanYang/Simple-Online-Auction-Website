<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Profile</title>
<style>
.button {
background-color: #008CBA;
border: none;
font-size: 16px;
  color: white;} 
</style>
</head>
<body style="background-color:#F0F8FF;">

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");
	Statement st = con.createStatement();

	//String a = (String)session.getAttribute("id");
	//System.out.println("LL " + a);
	int user = Integer.parseInt(request.getParameter("id"));  //(Integer)session.getAttribute("id");
	
	String str = "SELECT username FROM End_User WHERE account_id = '" + user + "'";
	ResultSet rs=st.executeQuery(str);
	if(rs.next()){		
		String username = rs.getString("username");
		out.println("Weclome " +  username + "!");	
		
		%>
		<br>
		<a href = acc.jsp?uid=<%= user %>><button class="button">Auction Page</button></a>
		<br><br>
		<a href = test.jsp?uid=<%= user %>><button class="button">Bid</button></a>
		<br><br>
		<form action="createAlert.jsp?account_id=<%= user %>" method="post">

Set an alert for when an item goes on auction by inputting the item ID.
<br>
	Item ID
    <input type = "text" name="item_id">
    <input type = "hidden" name="account_id" value=<%out.print(user);%>>
	<input type="submit" value="Sumbit">
    
</form>		
		
<br>
<form action="viewAlerts.jsp?account_id=<%= user %>" method="post">
View your alerts.
<br>
    <input type = "hidden" name="account_id" value=<%out.print(user);%>>
	<input type="submit" value="View">
</form>
<br>		

<br>
<form action="viewEmails.jsp?account_id=<%= user %>" method="post">
View your email.
<br>
    <input type = "hidden" name="account_id" value=<%out.print(user);%>>
	<input type="submit" value="View">
</form>
<br>


<br>
Got a question?
<form action="postquestion.jsp?account_id=<%= user %>" method="post">
	<input type="hidden" name="account_id" value=<%out.print(user);%>>
	<input type="text" name="question">
	<input type="submit" value="Post Question">
</form>
<br>

		<p>If you are an Administrator: </p>
		<a href= admin.jsp?adid=<%= user %>><button class="button">Administrator Entry</button></a>
		<br>
		<p>If your are an Customer Representative: </p>
		<a href= cus_rep.jsp?cid=<%= user %>><button class="button">Customer Representative Entry</button></a>
		<br><br>
		<a href = logout.jsp><button class="button">Logout</button></a>
		
		<% 
	}
	con.close();


%>

</body>
</html>
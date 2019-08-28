<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:#F0F8FF;">
<center><h1>create auction!!!</h1></center>

<% 
	String c=request.getParameter("command"); 
	String d=request.getParameter("accid");
	%>
<br>
	<form method="post" action="setnewauction.jsp">
	<table>
	<tr>    
	<td>item</td><td><input type="text" name="item"></td>
	</tr>
	<tr>    
	<td>increment</td><td><input type="text" name="increment"></td>
	</tr>
	<tr>
	<td>initial price</td><td><input type="text" name="initial_price"></td>
	</tr>
	<tr>
	<td>minimum price</td><td><input type="text" name="minimum_price"></td>
	</tr>
	<tr>
	<td>start date(dd-mm-yyyy)(must input "-")</td><td><input type="date" name="start_date"></td>
	</tr>
	<tr>
	<td>end date(dd-mm-yyyy)</td><td><input type="date" name="end_date"></td>
	</tr>
	</table>
	<input type ="hidden" name="category" value="<%=c %>">
	<input type ="hidden" name="accountid" value="<%=d %>">
	<input type="submit" value="submit auction">
	</form>
<br>





</body>
</html>
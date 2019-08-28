<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:#F0F8FF;">
<%
	String ruid= request.getParameter("uid");
%>
<br>
	<form method="post" action= "auction.jsp">
		<input type="radio" name="command" value="Shirts"/> shirts
		<br>
		<input type="radio" name="command" value="Pants"/> pants
		<br>
		<input type="radio" name="command" value="Dress"/> dress
		<br>
		<input type="radio" name="command" value="Others"/> others
		<br>
		<input type="hidden" name="accid" value="<%=ruid %>"/>
		<input type="submit" value="submit" >
	</form>
<br>

</body>
</html>
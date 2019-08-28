<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
th, td {
    border: 1px solid black;
    border-collapse: collapse;
 };
 th, td {
 	padding: 5px;
 	text-align: left;
 };
 p.a {
  font-family: "Times New Roman", Times, serif;
}
.row {
   display: block;
   text-align: center;
  padding: 16px;
  margin-top: 8px;
  font-size: 17px;
  float: center;
   overflow: hidden;
   color: black;
   text-decoration: none;
}
.button {
background-color: #e7e7e7; 
color: black;
font-size: 16px;
border: none;
  
}

</style>
</head>
</head>
<body style="background-color:#F0F8FF;">
	<center><h1>Welcome!</h1></center>
	<div class="row">
	<a href="loginMain.html"><button class="button">Login</button></a>
	<a href="search.jsp"><button class="button">Search</button></a>
	</div>
	<br><br>
	
	View all questions.
<form action="viewQuestions.jsp" method="post">
	<input type="submit" value="View">
</form>
<br>

<br>
Search for a question!
<form action="searchQuestion.jsp" method="post">
	<input type = "text" name="question">
	<input type="submit" value="Search">
</form>
<br>	

</body>
</html>
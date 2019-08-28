<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Q&A</title>

</head>
<body style="background-color:#F0F8FF;">

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
try {

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");
	Statement st = con.createStatement();
	
	String str = "select * from Question";
	ResultSet rs=st.executeQuery(str);

	
	while(rs.next()){
		int id = rs.getInt("qid");
		out.print("Question: " + rs.getString("question")+"<br/>" +"<br/>");
		String ans = rs.getString("answer");
		if(ans != null && !ans.isEmpty()){
			out.print("Answer: " + ans);
			out.print("<br/>" + "<br/>");
		}		
		//else{		
		%>
		<form action="post_ans.jsp" method="post">
		<input type = "hidden" name = "qid" value = "<%=id%>">
		<table>   
		<tr>
      	<td>Edit Answer:</td>
		<td><input type="text" name="ans" value=""/></td>
		</tr> 	
		<tr>
    	<td><input type="submit" value="Submit" /></td>
    	</tr>
		</table>
		</form>
			
		<br><br><hr>
		
		<%
		//while(ans == null && ans.isEmpty()){}
		//ans = request.getParameter("ans");
		//if(ans != null && !ans.isEmpty()){
		//out.print("Answer: " + ans+"<br/>");}
		//String update = "UPDATE Question SET answer = ? WHERE id = ?";
		//}
		
	}
	con.close();
}catch (Exception ex) {
	out.print("Error occured");
}
%>



</body>
</html>
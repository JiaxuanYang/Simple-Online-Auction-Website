<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:#F0F8FF;">

<%
	try {

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");

		Statement st = con.createStatement();

		String str = "SELECT * FROM Question";

		ResultSet result = st.executeQuery(str);
		
		if(!result.next()){
			out.println("No questions/answers found.");
			out.println("<a href= index.html>Login Page</a>");
		}else{
		
			out.print("<table>");

			out.print("<tr>");

			out.print("<td>");
			out.print("QuestionID");
			out.print("</td>");
		
			out.print("<td>");
			out.print("UserID");
			out.print("</td>");
		
			out.print("<td>");
			out.print("Question");
			out.print("</td>");
		
			out.print("<td>");
			out.print("Answer");
			out.print("</td>");
			
			out.print("</tr>");

			out.print("<tr>");
			
			out.print("<td>");
			out.print(result.getString("qid"));
			out.print("</td>");
		
			out.print("<td>");
			out.print(result.getString("account_id"));
			out.print("</td>");
		
			out.print("<td>");
			out.print(result.getString("question"));
			out.print("</td>");
		
			out.print("<td>");
			if(result.getString("answer") == null){
				out.print("(No answer yet)");
			}else{
				out.print(result.getString("answer"));
			}
			out.print("</td>");
			
			out.print("</tr>");
			
			while(result.next()) {
				out.print("<tr>");
				
				out.print("<td>");
				out.print(result.getString("qid"));
				out.print("</td>");
			
				out.print("<td>");
				out.print(result.getString("account_id"));
				out.print("</td>");
			
				out.print("<td>");
				out.print(result.getString("question"));
				out.print("</td>");
			
				out.print("<td>");
				if(result.getString("answer") == null){
					out.print("(No answer yet)");
				}else{
					out.print(result.getString("answer"));
				}
				out.print("</td>");
				
				out.print("</tr>");
	
			}
			out.print("</table>");
		}
		con.close();
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed to view questions");
	}
%>

<a href= index.jsp>Login Page</a>
</body>
</html>
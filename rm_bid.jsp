<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove a Bid</title>
</head>
<body>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.Date.*,java.text.*,java.text.SimpleDateFormat.*"%>

<%
//java.util.*
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");
Statement st = con.createStatement();

int aid = Integer.parseInt(request.getParameter("aid"));
int uid = Integer.parseInt(request.getParameter("uid"));
//String dt = request.getParameter("date");
//out.print("befoer"+dt);
//java.util.Date date = new SimpleDateFormat("YYYY-MM-DD HH:MI:SS").parse(dt);
//java.sql.Date date =  new java.sql.Date(dt.getTime());
//out.print("after"+dt);

String delete = "DELETE FROM Bid WHERE aid = ? AND eaccount_id = ?";
//String delete = "SELECT * FROM Bid WHERE aid = '" + aid + "' AND eaccount_id ='" + uid + "'";
//PreparedStatement ps = con.prepareStatement(delete);
//ps.setInt(1, aid);
//ps.setInt(2, uid);
//ps.setTimestamp(3, new java.sql.Timestamp(date.getTime()));
//ps.execute();
PreparedStatement ps = con.prepareStatement(delete);

ps.setInt(1,aid);
ps.setInt(2, uid);
if(ps.executeUpdate() > 0){
	out.print("delete success");
}else{
	out.print("Cannot delete");
}
con.close();

} catch (Exception ex) {
	out.print("<br>"+"Error occured: please check if inputs are valid");
}
%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table, th, td {
  border: 1px solid black;
 }
</style>
</head>
<body style="background-color:#F0F8FF;">

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*,java.util.Date.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
try{

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");
	Statement st = con.createStatement();

	java.util.Date today = Calendar.getInstance().getTime();
	int id = Integer.parseInt(request.getParameter("theid"));//(Integer)session.getAttribute("id"); 
	
	out.print("Sales Repoet Generated at:" + today + "<br>"+"By Admin #" + id + "<br><br><hr>");
	
	int total = 0;
	//total earning
		String str = "SELECT SUM(item_earning) AS total_earning FROM Item_Record";
		ResultSet rs=st.executeQuery(str);
		out.print("<table style=\"margin: 0px auto;\">");
		out.print("<tr>");
		out.print("<td>");
		out.print("Total earning($)");
		out.print("</td>");
		out.print("</tr>");
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>");
			total = rs.getInt("total_earning");	
			out.print(total);
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		out.print("<br>");
		
		//earning per item/type/user
		//String str2 = "SELECT item_id, item_earning FROM Item_Record";
		String str2 = "SELECT Item.iname, Item_Record.item_earning FROM Item_Record RIGHT JOIN Item ON Item.item_id = Item_Record.item_id ORDER BY Item.iname";
		rs=st.executeQuery(str2);
		out.print("<table style=\"margin: 0px auto;\">");
		out.print("<tr>");
		out.print("<td>");
		out.print("Item");
		out.print("</td>");
		out.print("<td>");
		out.print("Earning ($)");
		out.print("</td>");
		out.print("</tr>");
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>");
			out.print(rs.getString("iname"));
			out.print("</td>");
			out.print("<td>");
			int earning = rs.getInt("item_earning");
			out.print(earning);
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		out.print("<br>");
		
		String str2_2 = "SELECT scname, SUM(item_earning) as earning FROM (SubCatagory LEFT JOIN Has_SubCatagory ON Has_SubCatagory.sid = SubCatagory.sid) LEFT JOIN Item_Record ON Item_Record.item_id = Has_SubCatagory.item_id GROUP BY scname";
		//"SELECT scname, SUM(item_earning) AS earning FROM (Has_SubCatagory LEFT JOIN Item_Record ON Has_SubCatagory.item_id = Item_Record.item_id) LEFT JOIN SubCatagory ON SubCatagory.sid = Has_SubCatagory.sid GROUP BY scname ";
		//"SELECT Has_SubCatagory.sid, SUM(Item_Record.item_earning) AS earning FROM Has_SubCatagory LEFT JOIN Item_Record ON Has_SubCatagory.item_id = Item_Record.item_id GROUP BY Has_SubCatagory.sid ";
		rs=st.executeQuery(str2_2);
		out.print("<table style=\"margin: 0px auto;\">");
		out.print("<tr>");
		out.print("<td>");
		out.print("Item Type");
		out.print("</td>");
		out.print("<td>");
		out.print("Earning ($)");
		out.print("</td>");
		out.print("</tr>");
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>");
			out.print(rs.getString("scname"));
			out.print("</td>");
			out.print("<td>");
			int earning = rs.getInt("earning");
			out.print(earning);
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		out.print("<br>");
		
		String str2_3 = "SELECT edaccount_id, SUM(user_earning) AS earning FROM User_Record GROUP BY edaccount_id";
		rs=st.executeQuery(str2_3);
		out.print("<table style=\"margin: 0px auto;\">");
		out.print("<tr>");
		out.print("<td>");
		out.print("User");
		out.print("</td>");
		out.print("<td>");
		out.print("Earning($)");
		out.print("</td>");
		out.print("</tr>");
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>");
			out.print(rs.getString("edaccount_id"));
			out.print("</td>");
			out.print("<td>");
			int earning = rs.getInt("earning");	
			out.print(earning);
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		out.print("<br>");
		
		//best selling item
		String str3 = "SELECT iname FROM Item WHERE item_id = (SELECT item_id FROM (SELECT item_id, MAX(item_earning) FROM Item_Record) AS T)";
		rs=st.executeQuery(str3);
		out.print("<table style=\"margin: 0px auto;\">");
		out.print("<tr>");
		out.print("<td>");
		out.print("Best Selling Item");
		out.print("</td>");
		out.print("</tr>");
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>");
			out.print(rs.getString("iname"));
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		out.print("<br>");
		
		//best buyer
		String str4 = "SELECT eaccount_id , MAX(sum) AS amount FROM (SELECT eaccount_id,SUM(amount) AS sum FROM Bid WHERE is_winning = true) AS T";
		rs=st.executeQuery(str4);
		out.print("<table style=\"margin: 0px auto;\">");
		out.print("<tr>");
		out.print("<td>");
		out.print("Best Buyer ID");
		out.print("</td>");
		out.print("<td>");
		out.print("Amount");
		out.print("</td>");
		out.print("</tr>");
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>");
			out.print(rs.getString("eaccount_id"));
			out.print("</td>");
			out.print("<td>");
			int earning = rs.getInt("amount");	
			out.print(earning);
			out.print("</td>");
			out.print("</tr>");
		}
		out.print("</table>");
		out.print("<br>");

		String gen = "INSERT INTO Generate(sdate,adaccount_id)" + "VALUE(?,?)";
		String sale = "INSERT INTO Sales_Report(date,total_earning)" + "VALUE(?,?)";
		PreparedStatement ps = con.prepareStatement(sale);
		ps.setTimestamp(1, new java.sql.Timestamp(today.getTime()));
		//out.print(total);
		ps.setInt(2, total);
		ps.executeUpdate();
		
		ps = con.prepareStatement(gen);
		ps.setTimestamp(1, new java.sql.Timestamp(today.getTime()));
		ps.setInt(2, id);
		ps.executeUpdate();
		con.close();
		
	}catch (Exception ex) {
		out.print("Error occured");
	}
	%>

	</body>
	</html>
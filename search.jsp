<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
<style>
th, td {
    border: 1px solid black;
    border-collapse: collapse;
 };
 th, td {
 	padding: 5px;
 	text-align: left;
 };
</style>
</head>
<body style="background-color:#F0F8FF;">
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%@ page import="java.io.*,java.util.*,java.sql.*"%>
	<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
	<%@ page import='java.time.*' %>

	<%
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31", "Yuchen_jin",
				"Jinyuchen2016*");

		String item = request.getParameter("item");
		String user = request.getParameter("user");
		String subcategory = request.getParameter("subcategory");
		String time = request.getParameter("time");
		String order = request.getParameter("order");
		String orderReverse = request.getParameter("orderreverse");

		if (item == "")
			item = null;
		if (user == "")
			user = null;
		if (subcategory == "")
			subcategory = null;
		if (time == "")
			time = null;
		if (order == "")
			order = null;
		if (orderReverse == "")
			orderReverse = null;
		%>
		<form action="search.jsp">
		Item:<br>
		<input type="text" name="item"></input>
		<br><br>
		UserID:<br>
		<input type="text" name="user"></input>
		<br><br>
		SubCatagory:<br>
		<select name="subcategory">
			<%
			String scq = "SELECT scname FROM SubCatagory";
			PreparedStatement scps = con.prepareStatement(scq);
			ResultSet scrs = scps.executeQuery();
	
			while (scrs.next()) {
				String option = scrs.getString(1);
				%>
					<option value=<%out.print(option);%>><%out.print(option);%></option>
				<% 
			}%>
			
		</select>
		<br><br>
		<%
		//fields
		ArrayList<String> fields = new ArrayList<String>();
		String fq = "SELECT name FROM SCField, hasField, SubCatagory WHERE SCField.fid = hasField.fid AND hasField.sid = SubCatagory.sid AND scname = ?";
		PreparedStatement fps = con.prepareStatement(fq);
		fps.setString(1, subcategory);
		ResultSet frs = fps.executeQuery();
		
		while(frs.next()){
			String sc = frs.getString(1);
			fields.add(sc);
			out.print(sc + ":");
			%>
				<br>
				<input type=<%out.print(sc);%> name=<%out.print(sc);%>></input>
				<br>
			<%
		}
		%>
		<br>
		<select name="time">
			<option value=""></option>
			<option value="day">day</option>
			<option value="month">month</option>
			<option value="week">week</option>
			<option value="year">year</option>
		</select>
		<select name="order">
			<option value=""></option>
			<option value="start_date">start date</option>
			<option value="end_date">end date</option>
			<option value="price">price</option>
		</select>
		<select name="orderreverse">
			<option value="ASC">ASC</option>
			<option value="DESC">DESC</option>
		</select>
		<input type="submit" value="Submit">
	</form>
		<%
		String q = null;
		if (user == null){
			if (!fields.isEmpty())
				q = "SELECT Auction.aid, amount AS price, start_date, end_date, iname, name, Item.item_id, fieldID, value FROM Auction LEFT JOIN Bid ON Auction.aid = Bid.aid, Item, Has_SubCatagory, SubCatagory, SCField, Auction_Field WHERE iid = Item.item_id AND Item.item_id = Has_SubCatagory.item_id AND Has_SubCatagory.sid = SubCatagory.sid AND Auction_Field.FieldID = SCField.fid AND Auction_Field.auctionID = Auction.aid AND (is_winning = 1 OR is_winning IS NULL) AND(? = iname OR ? IS NULL) AND (? = scname OR ? IS NULL) AND (? >= end_date OR ? IS NULL)";
			else
				q = "SELECT Auction.aid, amount AS price, start_date, end_date, iname FROM Auction LEFT JOIN Bid ON Auction.aid = Bid.aid, Item, Has_SubCatagory, SubCatagory WHERE iid = Item.item_id AND Item.item_id = Has_SubCatagory.item_id AND Has_SubCatagory.sid = SubCatagory.sid AND (is_winning = 1 OR is_winning IS NULL) AND (? = iname OR ? IS NULL) AND (? = scname OR ? IS NULL) AND (? >= end_date OR ? IS NULL)";
		}
		else{
			if (!fields.isEmpty())
				q = "SELECT DISTINCT Auction.aid, amount AS price, start_date, end_date, iname FROM Auction, Bid, Item, Has_SubCatagory, SubCatagory, SCField WHERE iid = Item.item_id AND Item.item_id = Has_SubCatagory.item_id AND Has_SubCatagory.sid = SubCatagory.sid AND Auction.aid = Bid.aid AND ? = Bid.eaccount_id";
			else
				q = "SELECT Auction.aid, amount AS price, start_date, end_date, iname FROM Auction, Bid, Item, Has_SubCatagory, SubCatagory WHERE iid = Item.item_id AND Item.item_id = Has_SubCatagory.item_id AND Has_SubCatagory.sid = SubCatagory.sid AND Auction.aid = Bid.aid AND ? = Bid.eaccount_id";
		}
		
		PreparedStatement ps = con.prepareStatement(q);
		int u = 1;
		if (user == null){
			String end_date = null;
			if (time != null){
				LocalDateTime dt = LocalDateTime.now();
				if (time.equals("day"))
					dt = dt.plusDays(1);
				else if (time.equals("week"))
					dt = dt.plusWeeks(1);
				else if (time.equals("month"))
					dt = dt.plusMonths(1);
				else if (time.equals("year"))
					dt = dt.plusYears(1);
				
				end_date = dt.toString();
			}
			ps.setString(u++, item);
			ps.setString(u++, item);
			ps.setString(u++, subcategory);
			ps.setString(u++, subcategory);
			ps.setString(u++, end_date);
 			ps.setString(u++, end_date);
		}
		else{
			try{
				ps.setInt(u++, Integer.parseInt(user));
			}catch(Exception e){
				out.print("invalid user name");
				return;
			}
		}
		q = ps.toString().split(": ")[1];
		
		//fields
		int i = 0;
		//String w = "SELECT * FROM ("+q+") AS Q" + i++;
		String w = q;
		
		//fields
		if (user == null){
			for(String f : fields){
				w = "SELECT Q"+(i+1)+".aid, Q"+(i+1)+".price, Q"+(i+1)+".start_date, Q"+(i+1)+".end_date, Q"+(i+1)+".iname,  Q"+(i+1)+".name, Q"+(i+1)+".item_id, Q"+(i+1)+".fieldID, Q"+(i+1)+".value FROM (" + w + ") AS Q" + i + ",("+q+") AS Q" + (i+1) + " WHERE Q"+i+".fieldID <> Q"+(i+1)+".fieldID AND Q"+i+".aid = Q"+(i+1)+".aid AND Q"+i+".name = ? AND (Q"+i+".value = ? OR ? IS NULL)";
				i = i += 2;
			}
			//if (i > 2)
				//w = w + " AND Q"+(i-2)+".fieldID > Q"+(i-1)+".fieldID";
		}
		
		w = "SELECT DISTINCT aid, price, start_date, end_date, iname FROM (" + w + ") AS A";
		
		//order by
		if(order != null){
			w = w + " ORDER BY " + order;
			if(orderReverse != null)
				w = w + " " + orderReverse;
		}
		
		PreparedStatement ps2 = con.prepareStatement(w);
		
		
		i = 1;
		if (user == null){
			for(String f : fields){
				ps2.setString(i++, f);
				String par = request.getParameter(f);
				if(par == "")
					par = null;
				ps2.setString(i++, par);
				ps2.setString(i++, par);
			}
		}
		System.out.println(ps2 + "\n");
		ResultSet rs = ps2.executeQuery();

		while (rs.next()) {
			%>
				<table style="border: 1px solid black, border-collapse: collapse">
					<tr><td><%out.print("#\tAuctionID\tPrice\tStart Date\tEnd Date\tItem");%></td></tr>
					<tr><td><%out.print(rs.getRow() + "\t" + rs.getInt(1) + "\t" + rs.getFloat(2) + "\t" + rs.getString("start_date") + "\t" + rs.getString("end_date") + "\t" + rs.getString(5));%></td></tr>
					<tr><td><a href="auction.jsp?aid=<%out.print(rs.getInt(1));%>>">link</a></td></tr>				
				</table>
				<br>
			<%
		}

		con.close();
	%>
	<a href=index.jsp>Home</a>
</body>
</html>
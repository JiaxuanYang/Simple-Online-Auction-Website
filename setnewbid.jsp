<%@page import="java.text.DateFormat"%>
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
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat.*,java.util.Date.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
try{
	java.util.Date today = Calendar.getInstance().getTime();
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");
	Statement st = con.createStatement();
	String auctionid= request.getParameter("auid");
	int aaid = Integer.parseInt(auctionid);
	int seid = Integer.parseInt(request.getParameter("selfid"));
	String aa= request.getParameter("amount");
	float newam=Float.valueOf(aa);
	String mmm=request.getParameter("maxmun");
	float maxi=Float.valueOf(mmm);
	boolean wi=false;
	String ss="SELECT * FROM Bid where aid = " + auctionid+" order by amount desc";
	ResultSet result = st.executeQuery(ss);
	String kk="INSERT INTO Bid" + " values (?,?,?,?,?,?)";
	int pointer=0;
	if(result.next()){
		pointer=1;
		float oldam=result.getFloat("amount");
		if(oldam<newam){
			String hh="UPDATE Bid SET is_winning= false WHERE is_winning = true AND aid = ? " ;//+ auctionid;
			
			//Statement ppp = con.createStatement();
			PreparedStatement ps = con.prepareStatement(hh);
			
			ps.setInt(1,aaid);
			ps.executeUpdate();
			wi=true;
		}
	}else{
		wi=true;
		
	}
	PreparedStatement ps = con.prepareStatement(kk);
	ps.setInt(1,aaid);
	ps.setInt(2,seid);
	ps.setFloat(3,newam);
//out.print(new java.sql.Timestamp(today.getTime()));
	ps.setTimestamp(4, new java.sql.Timestamp(today.getTime()));

	ps.setBoolean(5,wi);
	ps.setFloat(6,maxi);
	ps.executeUpdate();
	out.print("Insert succeeded!");
	con.close();
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://group31.cwwhhyxvfxql.us-east-2.rds.amazonaws.com:3306/group31","Yuchen_jin","Jinyuchen2016*");
	st = con.createStatement();
	if(pointer != 0){
		String sa="SELECT * FROM Bid where aid = "+ auctionid +" order by hidden_amount desc";
		ResultSet result3 = st.executeQuery(sa);
		if(result3.next()){
			int aucid=result3.getInt("aid");
			int eacid=result3.getInt("eaccount_id");
			float amo=result3.getFloat("amount");
			float hp=result3.getFloat("hidden_amount");
			sa="SELECT * FROM Bid where is_winning=true AND aid = " + auctionid;
			result3= st.executeQuery(sa);
			if(result3.next()){
				int laucid=result3.getInt("aid");
				int leacid=result3.getInt("eaccount_id");
				float lamo=result3.getFloat("amount");
				float hhhp=result3.getFloat("hidden_amount");
				if(hp>hhhp){
					String hh="UPDATE Bid SET is_winning= ?  WHERE is_winning=true and aid = " + auctionid;
					PreparedStatement ppp = con.prepareStatement(hh);
					ppp.setBoolean(1, false);
					ppp.executeUpdate();
					hh="INSERT INTO Bid values (?,?,?,?,default,?)";
					ppp = con.prepareStatement(hh);
					boolean hahahah=true;
					ppp.setInt(1, aucid);
					ppp.setInt(2,eacid);
					ppp.setFloat(3,hp);
					ppp.setBoolean(4,hahahah);
					ppp.setFloat(5,0);
					ppp.executeUpdate();
				}
			}
		}
	}
	con.close();
} catch (Exception ex) {
	out.print(ex);
	out.print("insert failed");
}
%>
</body>
</html>
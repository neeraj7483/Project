<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Items</title>
<style type="text/css">
		
		table{
			width: 70%;
			height: 60%;
			background: transparent;
			border-style: none;
			box-shadow: 0px 0px 4px 4px black;
			margin: 0px auto;
			border-radius: 12px 12px 12px 12px;
			font-size: 20px;
		}
		tr{
			border-style: none;
			border-radius: 12px 12px 12px 12px;
			transition: all 1s;
		}
		tr:hover{
			box-shadow: 0px 0px 4px 2px #00B0FF;
		}
		td{
			height: 20px;
			width: 33%;
			background: transparent;
			border-style: none;
			padding-right: 4px;
			/* border-right: 2px solid #00B0FF;
			border-bottom: 2px solid #00B0FF;
			border-left: 2px solid #00B0FF; */
			border-radius: 12px 12px 12px 12px;
			box-shadow: 0px 0px 4px 1px black;
			text-align: center;
			transition: all 1s;
		}
		td:hover{
			box-shadow: 0px 0px 4px 2px #00B0FF;
		}
		h1{
			margin-bottom: 20px;
			text-align: center;
			color: red;
		}
		th{
			color: #03A9FA;
			
		}
		
</style>
</head>
<body>
<h1>Items List</h1>
<table>
	<tr>
		<th>Item ID</th>
		<th>Item Name</th>
		<th>Item Price</th>
	</tr>
<%
	Connection connection=ConnectionProvider.getConnection();
	Statement statement=connection.createStatement();
	String query="SELECT*FROM ITEMS";
	ResultSet resultSet=statement.executeQuery(query);
	while(resultSet.next()){
	%>
		<tr>
			<td><%=resultSet.getString(1) %></td>
			<td><%=resultSet.getString(2) %></td>
			<td><%=resultSet.getFloat(3) %></td>
		</tr>
	<%
	}
%>
</table>
</body>
</html>
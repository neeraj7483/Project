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
<title>Insert title here</title>
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
			padding: 2px 2px 2px 2px;
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
		
		input{
			border-style: none;
			border-radius: 12px 12px 12px 12px;
			box-shadow: 0px 0px 4px 1px black;
			background: #37474f;
			color: white;
			transition: all 1s;
		}
		input:hover{
			box-shadow: 0px 0px 4px 1px ;
		}
		input:focus{
			box-shadow: 0px 0px 4px 4px #00B0FF;
		}
		
		#submit{
			padding: 8px 8px 8px 8px;
			width: 200px;
			margin-left: 350px;
		}
		#submit:hover{
			box-shadow: 0px 0px 4px 4px #00B0FF;
		}
</style>
</head>
<body>
	<h1>Order</h1>
	<form action="OrderFormSubmit.jsp">
	<table>
	<tr>
		<th></th>
		<th>Item ID</th>
		<th>Item Name</th>
		<th>Price</th>
		<th>Quantity</th>
	</tr>
	<%
		Connection connection=ConnectionProvider.getConnection();
		Statement statement=connection.createStatement();
		String query="SELECT*FROM ITEMS";
		ResultSet resultSet=statement.executeQuery(query);
		while(resultSet.next()){
			%>
			<tr>
				<td><input class="check" type="checkbox" name="itemList" value="<%=resultSet.getString(1) %>"/></td>
				<td><%=resultSet.getString(1) %></td>
				<td><%=resultSet.getString(2) %></td>
				<td><%=resultSet.getFloat(3) %></td>
				<td><input type="text" name="quantity" placeholder="Enter Quantity"></td>
			</tr>
			<%
		}
	%>
	</table>
	<br/>
	<input id="submit" type="submit" name="Submit" value="CHOOSE DEALER"/>
	</form>
	
	<!-- <script type="text/javascript">
		function enableDisableQuantity(x,j) {
			var y=document.getElementByClassName("textField"+j);
			if(x.checked==true){
				y.style.display="inline-block";
			}
			else{
				y.style.display="none";
			}
		}
	</script> -->
	
</body>
</html>
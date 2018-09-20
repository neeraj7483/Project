<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	html,body
	{
		height: 100%;
		width: 100%;
		background-color: #37474f;
		color: white;
		font-size: 30px;
	}
	
	#main_container
	{
		height: 100%;
		width: 100%;
	}
	.menu
	{
		height: 10%;
		width: 100%;
		background-color: #0d47a1;
		margin-bottom: 20px;
		text-align: center;
		box-shadow: 0px 0px 4px 4px black;
		transition: all 1s;
		filter: opacity(70%);
	}
	
	.menu:hover
	{
		filter: opacity(100%);
	}
	
	#left
	{
		margin-top: 10%;
		float: left;
		width: 30%;
		height: 100%;
		//box-shadow: 0px 0px 4px 4px black;
	}
	
	#right
	{
		margin-top: 10%;
		float: right;
		width: 65%;
		height: 100%;
		//background-color: #00796b;
		box-shadow: 0px 0px 4px 4px black;
		margin-right: 20px;
	}
	
	#top_bar
	{
		width: 100%;
		height: 10%;
		background-color: #3d5afe;
		position: fixed;
		top: 0px;
		left: 0px;
		text-align: center;
		font-size: 40px;
		box-shadow: 0px 0px 4px 4px black;
		z-index:1000;
	}
	
	a
	{
		text-decoration: none;
	}
	
	a:visited
	{
		text-decoration: none;
		color: white;
	}
	
	#photo
	{
		margin-bottom: 10%;
		width: 100%;
		height: 50%;
		transition: all 2s;
		filter: opacity(0.8);
		box-shadow: 0px 0px 4px 4px black;
	}
	
	#main_container
	{
		height:100%;
		width:100%;
	}
	
</style>
</head>
<body>

<%
	String user="Mohit Kumar";
	//Get Details from Session
%>

<div id="main_container">
	<div id="top_bar">Welcome <%=user %></div>
	<div id="left">
		<a href="?var=photos"><div id="photo"></div></a>
		<a href="?var=order"><div class="menu">Place Order</div></a>
		<a href="?var=bills"><div class="menu">View Bills</div></a>
		<a href="?var=message"><div class="menu">View Messages</div></a>
		<a href="?var=item"><div class="menu">View Items</div></a>
		<a href="?var=feedback"><div class="menu">Feedback</div></a>
	</div>
	<div id="right">
		<%
			String a=request.getParameter("var");
		if(a!=null)
		{
			if(a.equals("photos")){
				%>
				<%@include file="photo.jsp" %>
				<%
			 }
			else if(a.equals("order")){
				%>
				<%@include file="order.jsp" %>
				<%
			}
			else if(a.equals("bills")){
					%>
					<%@include file="bills.jsp" %>
					<%
				}
			else if(a.equals("message")){
				%>
				<%@include file="message.jsp" %>
				<%
			}
			else if(a.equals("item")){
				%>
				<%@include file="item.jsp" %>
				<%
			}
			else if(a.equals("feedback")){
				%>
				<%@include file="feedback.jsp" %>
				<%
			}
		}
		else{
			
		}
		%>
	</div>
</div>

</body>
</html>
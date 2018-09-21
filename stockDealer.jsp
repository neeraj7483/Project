<%@page import="com.service.controller.Item"%>
<%@page import="java.util.List"%>
<%@page import="com.service.model.Dealer"%>
<%@page import="com.service.dao.DAOOperationsImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession sessionStock=request.getSession(false);
String dealerId="";
if(sessionStock!=null)
{
	Dealer dealer=(Dealer)sessionStock.getAttribute("dealer");
	dealerId=dealer.getDealerId();
}
DAOOperationsImpl obj=new DAOOperationsImpl();
List<Item> itemList=obj.getDealerStock(dealerId);
for(Item item:itemList)
{
%>
<br><br>
<%=item.getItemId() %><br>
<%=item.getItemName() %><br>
<%=item.getCost() %><br>
<%=item.getQuantity() %><br>

<%} %>
</body>
</html>
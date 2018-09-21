<%@page import="java.sql.ResultSet"%>
<%@page import="com.service.dao.DAOOperationsImpl"%>
<%@page import="com.service.model.Dealer"%>
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
HttpSession sessionSupply=request.getSession(false);
String dealerId="";
if(sessionSupply!=null)
{
	Dealer dealer=(Dealer)sessionSupply.getAttribute("dealer");
	dealerId=dealer.getDealerId();
}
else
{
	response.sendRedirect("Login.jsp");	
}
DAOOperationsImpl obj=new DAOOperationsImpl();
ResultSet rs=obj.getIncompleteOrder(dealerId);
%>
</body>
</html>
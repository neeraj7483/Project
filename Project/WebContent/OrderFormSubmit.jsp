<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		String itemID[]=request.getParameterValues("itemList");
		for(String item:itemID){
			%>
			<div><%=item %></div><br>
			<%
		}
		String[] quan=request.getParameterValues("quantity");
		int[] quantity=new int[quan.length];
		out.print("\nLength\t:"+quan.length+"\n");
		for(int i=0;i<quan.length;i++){
			if(!quan[i].equals("")){
				%>
				<div><%=Integer.parseInt(quan[i]) %></div>
				<%
			}
		}
		//for(Integer x:quantity){
			%>
			<%-- <div><%=x %></div> --%>
			<%
		//}
	%>
	
</body>
</html>
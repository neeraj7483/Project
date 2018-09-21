
<%@page import="com.service.model.Dealer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.service.dao.DAOOperationsImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Messages</title>
<style type="text/css">
#message {
	height: 20%;
	width: 80%;
	margin-bottom: 50px;
	background: transparent;
	border-radius: 12px;
	box-shadow: 0px 0px 4px 2px black;
	margin-left: 20px;
	font-size: 15px;
	padding-left: 20px;
	color: white;
	transition: all 1s;
}

#message:hover {
	box-shadow: 0px 0px 4px 2px #00B0FF;
}

#messageID {
	height: 4%;
	width: 40%;
	margin-left: 10px;
	margin-bottom: 20px;
	background: transparent;
	border-radius: 12px;
	box-shadow: 0px 0px 4px 2px black;
	font-size: 20px;
	padding-left: 20px;
	color: white;
	transition: all 1s;
}

#messageID:hover {
	box-shadow: 0px 0px 4px 2px #00B0FF;
}

h1 {
	margin-bottom: 20px;
	text-align: center;
	color: red;
}

.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	text-align: left;
	border: none;
	outline: none;
	transition: 0.4s;
}

.active, .accordion:hover {
	background-color: #ccc;
}

.panel {
	padding: 0 18px;
	background-color: white;
	display: none;
	overflow: hidden;
}

span {
	float: right;
	font-size: 14px;
}
</style>


</head>
<body>
	<h1>Messages</h1>

	<%
		HttpSession sessionMsg = request.getSession(false);
		String id = "";
		if (sessionMsg != null) {
			Dealer dealer = (Dealer) sessionMsg.getAttribute("dealer");
			id = dealer.getDealerId();
		} else {
			response.sendRedirect("Login.jsp");
		}
		DAOOperationsImpl obj = new DAOOperationsImpl();
		ResultSet rs = obj.getMessage(id);
		while (rs.next()) {
	%>
	<div id="messageID" class="accordion">
		MessageID:<%=rs.getString(1)%><span>Click To Expand</span>
	</div>
	<div id="message" class="panel"><%=rs.getString(2)%></div>
	<%
		}
	%>
	<script type="text/javascript">
		var acc = document.getElementsByClassName("accordion");
		var i;
		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	</script>
</body>
</html>
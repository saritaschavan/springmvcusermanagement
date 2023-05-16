<%@page import="com.jspiders.springmvcuser1.pojo.UserPojo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% UserPojo pojo=(UserPojo)request.getAttribute("user");
	String msg=(String)request.getAttribute("msg");%>
	<jsp:include page="NavBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add User</title>
<style type="text/css">
form {
	margin-top:20px 
}
form table {
	 margin: auto;
	 width: 100%;
}
tr{
align-items: center;
}
fieldset table {
	margin: auto;
	text-align: left;
}
fieldset {
	margin: 15px 500px;
	text-align: center;
}

</style>
</head>
<body>
	<fieldset>
		<legend>Add User Deatails</legend>
		<form action="./add" method="post">
			<table>
				<tr>
					<td>Name :</td>
					<td> <input type="text" name="name"> </td>
				</tr>

				<tr>
					<td>Email :</td>
					<td> <input type="text" name="email"> </td>
				</tr>

				<tr>
					<td>Contact :</td>
					<td> <input type="text" name="contact"> </td>
				</tr>

				<tr>
					<td>City :</td>
					<td> <input type="text" name="city"> </td>
				</tr>


				<tr>
					<td>Username :</td>
					<td><input type="text" name="username"></td>
				</tr>


				<tr>
					<td>Password :</td>
					<td><input type="text" name="password"></td>
				</tr>


				<tr>
					<td><input type="submit" value="Submit"></td>
				</tr>
			</table>
		</form>
	</fieldset>
	<% if(msg!=null){ %>
	<h1 align="center"><%= msg %></h1>
	<%} %>
	
</body>
</html>
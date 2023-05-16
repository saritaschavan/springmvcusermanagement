<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form {
	margin-top: 20px
}

form table {
	margin: auto;
	width: 100%;
}
a{
text-decoration: none;
}

tr {
	align-items: center;
}

fieldset table {
	margin: auto;
	text-align: left;
}

fieldset {
	margin: 15px 500px;
	text-align: center;
	margin-top: 200px;
}
</style>
</head>
<body>
	<fieldset>
		<legend>Login to Procced</legend>
		<form action="./login" method="post">
			<table>
				<tr>
					<td>UserName :</td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="text" name="password"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Login"></td>
					<td> <button><a href="./new">Create New User</a></button> </td>
				</tr>
			</table>
		</form>
	</fieldset>
	<%
	if (msg != null) {
	%>
	<h3 align="center"><%=msg%></h3>
	<%
	}
	%>
</body>
</html>
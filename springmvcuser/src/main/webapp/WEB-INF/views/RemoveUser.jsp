<%@page import="com.jspiders.springmvcuser1.pojo.UserPojo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="NavBar.jsp" />
<%
List<UserPojo> pojos = (List<UserPojo>) request.getAttribute("pojos");
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove User</title>
<style type="text/css">
form {
	margin-top: 20px
}

form table {
	margin: auto;
	width: 100%;
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
}

#table1 {
	border: 1px solid black;
	width: 100%;
}

#table1 td {
	border: 1px solid black;
	text-align: center;
}
</style>

</head>
<body>
	<fieldset>
		<legend>Remove User</legend>
		<form action="./remove" method="post" id="form">
			<table>
				<tr>
					<td>Enter User Id :</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Remove"></td>
				</tr>
			</table>
		</form>
	</fieldset>
	<%
	if (msg != null) {
	%>
	<h2 align="center"><%=msg%></h2>
	<%
	}
	%>
	<%
	if (pojos != null) {
	%>
	<fieldset style="width: auto; margin: 0%;">
		<legend>Student Data</legend>
		<table border="1px solid" style="border-collapse: collapse;"
			id="table1">
			<tr>
				<td>
					<h4>Id</h4>
				</td>
				<td>
					<h4>Name</h4>
				</td>
				<td>
					<h4>Email</h4>
				</td>
				<td>
					<h4>Contact</h4>
				</td>
				<td>
					<h4>City</h4>
				</td>
				<td>
					<h4>Username</h4>
				</td>
				<td>
					<h4>Pssword</h4>
				</td>
			</tr>

			<%
			for (UserPojo pojo : pojos) {
			%>
			<tr>
				<td>
					<h4>
						<%=pojo.getId()%>
					</h4>
				</td>
				<td>
					<h4>
						<%=pojo.getName()%>
					</h4>
				</td>
				<td>
					<h4>
						<%=pojo.getEmail()%>
					</h4>
				</td>
				<td>
					<h4>
						<%=pojo.getContact()%>
					</h4>
				</td>
				<td>
					<h4>
						<%=pojo.getCity()%>
					</h4>
				</td>
				<td>
					<h4>
						<%=pojo.getUsername()%>
					</h4>
				</td>
				<td>
					<h4>
						<%=pojo.getPassword()%>
					</h4>

				</td>

			</tr>
			<%
			}
			%>
		</table>
	</fieldset>
	<%
	}
	%>
</body>
</html>
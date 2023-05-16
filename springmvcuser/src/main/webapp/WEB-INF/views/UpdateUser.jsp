<%@page import="com.jspiders.springmvcuser1.pojo.UserPojo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="NavBar.jsp" />
<%
List<UserPojo> pojos = (List<UserPojo>) request.getAttribute("pojos");
UserPojo pojo = (UserPojo) request.getAttribute("pojo");
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User</title>
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
	<%
	if (pojo != null) {
	%>
	<fieldset>
		<legend>Update User Details</legend>
		<form action="./updateData" method="post">
			<table>
				<tr hidden="true">
					<td>Id</td>
					<td><input type="text" name="id" value="<%=pojo.getId()%>">
					</td>
				</tr>

				<tr>
					<td>Name</td>
					<td><input type="text" name="name"
						value="<%=pojo.getName()%>"></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" name="email"
						value="<%=pojo.getEmail()%>"></td>
				</tr>
				<tr>
					<td>Contact</td>
					<td><input type="text" name="contact"
						value="<%=pojo.getContact()%>"></td>
				</tr>
				<tr>
					<td>city</td>
					<td><input type="text" name="city"
						value="<%=pojo.getCity()%>"></td>
				</tr>
				<tr>
					<td>Username</td>
					<td><input type="text" name="username"
						value="<%=pojo.getUsername()%>"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="text" name="password"
						value="<%=pojo.getPassword()%>"></td>
				</tr>
				<tr>
				<td> <input type="submit" value="Update"> </td>
				</tr>
			</table>
		</form>
	</fieldset>
	<%
	} else {
	%>
	<fieldset>
		<legend>Update User Deatils</legend>
		<form action="./update" method="post">
			<table>
				<tr>
					<td>Enter User Id :</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Select"></td>
				</tr>
			</table>
		</form>
	</fieldset>
	<%
	if (msg != null) {
	%>
	<h1 align="center">
		<%=msg%>
	</h1>
	<%
	}
	%>
	<%
	if (pojos != null) {
	%>
	<fieldset style="width: auto; margin: 0%;">
		<legend>Student Data</legend>
		<table border="1px solid" style="border-collapse: collapse;" id="table1">
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
			for (UserPojo pojo1 : pojos) {
			%>
			<tr>
				<td>
					<h4>
						<%=pojo1.getId()%>
					</h4>
				</td>
				<td>
					<h4>
						<%=pojo1.getName()%>
					</h4>
				</td>
				<td>
					<h4>
						<%=pojo1.getEmail()%>
					</h4>
				</td>
				<td>
					<h4>
						<%=pojo1.getContact()%>
					</h4>
				</td>
				<td>
					<h4>
						<%=pojo1.getCity()%>
					</h4>
				</td>
				<td>
					<h4>
						<%=pojo1.getUsername()%>
					</h4>
				</td>
				<td>
					<h4>
						<%=pojo1.getPassword()%>
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
	}
	%>
</body>
</html>

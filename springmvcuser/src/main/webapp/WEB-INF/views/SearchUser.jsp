<%@page import="com.jspiders.springmvcuser1.pojo.UserPojo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% UserPojo pojo=(UserPojo)request.getAttribute("pojo");
      String msg=(String)request.getAttribute("msg");
    %>
    <jsp:include page="NavBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search User</title>
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
		<legend>Search User</legend>
		<form action="./search" method="post">
			<table>
				<tr>
					<td>Enter User Id :</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Search"></td>
				</tr>
			</table>
		</form>
	</fieldset>
	<%
	if (pojo != null) {
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


			<tr>
				<td>
				<h4> <%= pojo.getId() %> </h4>
				</td>
				<td>
				<h4> <%= pojo.getName() %> </h4>
				</td>
				<td>
				<h4> <%= pojo.getEmail() %> </h4>
				</td>
				<td>
				<h4> <%= pojo.getContact() %> </h4>
				</td>
				<td>
				<h4> <%= pojo.getCity() %> </h4>
				</td>
				<td>
				<h4> <%= pojo.getUsername() %> </h4>
				</td>
				<td>
				<h4> <%= pojo.getPassword() %> </h4>
				
				</td>

			</tr>
		</table>
	</fieldset>
	<%
	} else if (msg != null) {
	%>
	<h2 align="center">
		<%=msg%></h2>
	<%
	}
	%>
</body>
</html>
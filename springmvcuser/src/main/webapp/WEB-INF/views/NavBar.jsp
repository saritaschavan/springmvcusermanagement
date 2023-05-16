<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
ul {
	list-style-type: none;
	overflow: hidden;
	margin: 0;
	padding: 0;
	background-color: orchid;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	padding: 14px 16px;
	text-decoration: none;
	text-align: center;
	font-size: x-large;
	margin-left: 100px;
}

li a:hover:not(.active) {
	background-color: yellowgreen;
}

.active {
	background-color: #04AA6D;
}
</style>
</head>
<body>
	<ul>
		<li><a href="./home">Home</a></li>
		<li><a href="./add">AddUser</a></li>
		<li><a href="./remove">RemoveUser</a></li>
		<li><a href="./update">UpdateUser</a></li>
		<li><a href="./search">SearchUser</a></li>
		<li><a href="./logout">Logout</a></li>
	</ul>
</body>
</html>
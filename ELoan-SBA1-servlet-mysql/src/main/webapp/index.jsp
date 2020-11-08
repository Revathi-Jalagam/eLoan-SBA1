<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>eLoan system</title>
<style>
table {
	border-collapse: collapse;
	width: 50%;
	align: center;
}

th {
	background-color: gray;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(odd) {
	background-color: #f2f2f2;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 10px 21px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 8px;
	transition-duration: 0.4s;
}

.button:hover {
	background-color: #4CAF50; /* Green */
	box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
		rgba(0, 0, 0, 0.19);
	color: white;
}

.button2 {
	background-color: #008CBA;
} /* Blue */
.button3 {
	background-color: #f44336;
} /* Red */
</style>
</head>
<body>
	<!-- write the html code to read user credentials and send it to validateservlet
	    to validate and user servlet's registernewuser method if create new user
	    account is selected
	-->

	<h1 style="text-align:center;color:red"><u>eLoan Management System</u></h1>

	<form action="user?action=validate" method="post">
		<table align="center" border="1">
			<tr>
				<td><label for="loginid">Enter login Id</label></td>
				<td><input type="text" id="loginid" name="loginid"></td>
			</tr>
			<tr>
				<td><label for="password">Enter password</label></td>
				<td><input type="password" id="password" name="password">
				</td>
			</tr>
			<tr>
				<td style="text-align: right" colspan="2"><input class="button button2" type="submit"
					value="Login"></td>
			</tr>
			<tr>
				<td style="text-align: center" colspan="2"><a
					href="user?action=registeruser">New User? register here</a></td>
			</tr>
		</table>


	</form>


</body>
</html>
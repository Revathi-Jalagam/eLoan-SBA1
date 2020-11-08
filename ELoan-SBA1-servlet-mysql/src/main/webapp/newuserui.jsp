<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register New User</title>
<style>
table {
	border-collapse: collapse;
	width: 75%;
	align: center;
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
	<!-- read user name and password from user to create account
	     and send to usercontrollers registeruser method
	-->
	<jsp:include page="header.jsp" />
	<h1 style="text-align: center"><u>New User Registration Form</u></h1>
	</br>
	<form action="registeruser" method="post">
		<table align="center" border=1>
			<tr>
				<td><label for="firstname">First Name</label></td>
				<td><input type="text" id="firstname" name="firstname">
				</td>
			</tr>
			<tr>
				<td><label for="lastname">Last Name</label></td>
				<td><input type="text" id="lastname" name="lastname"></td>
			</tr>
			<tr>
				<td><label for="dob">Date of Birth</label></td>
				<td><input type="text" id="dob" name="dob"></td>
			</tr>
			<tr>
				<td><label for="mobile">Mobile</label></td>
				<td><input type="text" id="mobile" name="mobile"></td>
			</tr>
			<tr>
				<td><label for="email">Email</label></td>
				<td><input type="email" id="email" name="email"></td>
			</tr>
			<tr>
				<td><label for="city">City</label></td>
				<td><input type="text" id="city" name="city"></td>
			</tr>
			<tr>
				<td><label for="state">State</label></td>
				<td><input type="text" id="state" name="state"></td>
			</tr>
			<tr>
				<td><label for="country">Country</label></td>
				<td><input type="text" id="country" name="country"></td>
			</tr>
			<tr>
				<td><label for="pincode">Pincode</label></td>
				<td><input type="text" id="pincode" name="pincode"></td>
			</tr>
			<tr>
				<td><label for="address">Address</label></td>
				<td><input type="textarea" id="address" name="address">
				</td>
			</tr>
			<tr>
				<td style="text-align: right" colspan="2"><input
					class="button button2" type="submit" value="Register" id="register"></td>
			</tr>
		</table>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>
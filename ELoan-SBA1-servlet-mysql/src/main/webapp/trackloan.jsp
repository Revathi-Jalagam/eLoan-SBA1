<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>eLoan Management System - Track Loan</title>
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
	<!-- write html code to read the application number and send to usercontrollers'
             displaystatus method for displaying the information
	-->
	<jsp:include page="header.jsp" />
	<h1 style="text-align: center">
		<u>Track Loan Status</u>
	</h1>
	</br>
	<form action="registeruser" method="post">
		<table align="center" border=1>
			<tr>
				<td><label for="applicationnumber">Application Number</label></td>
				<td><input type="text" id="applicationnumber"
					name="applicationnumber"></td>
			</tr>
			<tr>
			<%
			String status = request.getParameter("status");
		%>
						<td>Current Status:</td>
						<td><% out.print(status); %>
 </td>
			<tr>
				<td style="text-align: right" colspan="2"><input
					class="button button2" type="submit" value="Track Status" id="track" formaction="user?action=displaystatus"></td>
			</tr>
		</table>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>
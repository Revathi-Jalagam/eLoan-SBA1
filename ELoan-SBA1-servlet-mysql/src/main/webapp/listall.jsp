<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.iiht.evaluation.eloan.model.LoanInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display All Loans</title>
<style>
table {
	border-collapse: collapse;
	width: 75%;
	align: center;
}
th {
background-color: gray;
}
th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
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
	<!-- write code to display all the loan details 
             which are received from the admin controllers' listall method
	-->
	<h2 style="text-align:center">List of Loans</h2>

	<table align="center" border="1">
		<thead>
			<tr>
				<th>Application Number</th>
				<th>Loan Type</th>
				<th>Applied Amount</th>
				<th>Application Date</th>
				<th>Action</th>
			</tr>
		</thead>
		<%
			List<LoanInfo> loans = (List<LoanInfo>) request.getAttribute("loans");
		for (LoanInfo loan : loans) {
		%>
		<tr>
			<td><%=loan.getApplno()%></td>
			<td><%=loan.getPurpose()%></td>
			<td><%=loan.getAmtrequest()%></td>
			<td><%=loan.getDoa()%>
			<td><a href="admin?action=process&applicationnumber=<%=loan.getApplno()%>">Process
					Loan</a></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
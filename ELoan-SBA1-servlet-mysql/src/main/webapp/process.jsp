<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="com.iiht.evaluation.eloan.model.LoanInfo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Process Loan</title>
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
	<!-- write the code to read application number, and send it to admincontrollers
	     callemi method to calculate the emi and other details also provide links
	     to logout and admin home page
	-->
	<jsp:include page="header.jsp" />

	<div align="right">
		<a href="admin?action=logout">Logout</a>
	</div>

	<%
		LoanInfo loan = null;
	if (request.getAttribute("loan") != null) {
		loan = (LoanInfo) request.getAttribute("loan");
	}
	%>
	<form action="admin?action=process" method="post">
		<table align="center" border="1">
			<tr>
				<td><label for="applicationnumber">Enter Loan
						Application Number</label> <%
				if (loan == null) {
			%> <input type="text" id="applicationnumber" name="applicationnumber">
					<%
				} else {
			%> <input type="text" id="applicationnumber" name="applicationnumber"
					value=<%out.println(loan.getApplno());%>> <%
				}
			%> <input class="button button2" type="submit"
					value="Get Loan Details"></td>
			</tr>
		</table>
		</br>
	</form>
	<table align="center" border="1">
		<tr>
			<td><label for="applicationnumber">Application Number: <%=(loan == null ? "" : loan.getApplno())%>
			</label></td>
		</tr>
		<tr>
			<td><label for="applieddate">Applied Date: <%=(loan == null ? "" : loan.getDoa())%>
			</label></td>
		</tr>
		<tr>
			<td><label for="loanname">Loan Type: <%=(loan == null ? "" : loan.getPurpose())%>
			</label></td>
		</tr>
		<tr>
			<td><label for="appliedamount">Applied Amount: <%=(loan == null ? "" : loan.getAmtrequest())%></label>
			</td>
		</tr>
		<tr>
			<td><label for="businessstructure">Business Structure: <%=(loan == null ? "" : loan.getBstructure())%></label>
			</td>
		</tr>
		<tr>
			<td><label for="taxindicator">Tax Indicator: <%=(loan == null ? "" : loan.getBindicator())%></label>
			</td>
		</tr>
	</table>
	</br>
	<form action="admin?action=updatestatus" method="post">
		<table align="center" border="1">
			<%
					String info = (String) request.getAttribute("info");
				if (info != null) {
					out.println(info);
				}
				%>
			<tr>
				<td>Amount Sanctioned:</td>
				<td><input type="text" name="las" required></td>
			</tr>
			<tr>
				<td>Loan Term:</td>
				<td><input type="text" name="duration" required></td>
			</tr>
			<tr>
				<td>EMI Start Date:</td>
				<td><input type="text" name="psd"></td>
			</tr>
			<tr>
				<td>EMI End Date:</td>
				<td><input type="text" name="lcd" required></td>
			</tr>
			<tr>
				<td>EMI:</td>
				<td><input type="text" name="emi" required></td>
			</tr>
			<tr>

				<td style="text-align: right" colspan="2"><input type="submit"
					class="button" value="Approve"> <input type="submit"
					class="button button3"
					formaction="admin?action=updatestatus&status=reject" value="Reject"></td>
			</tr>
		</table>

	</form>

	<jsp:include page="footer.jsp" />
</body>
</html>
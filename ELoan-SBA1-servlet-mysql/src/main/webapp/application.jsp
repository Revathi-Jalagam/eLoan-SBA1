<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";

/* String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "eloan";
String userid = "root";
String password = "";
 */
String jdbcURL = config.getServletContext().getInitParameter("jdbcUrl");
String jdbcUsername = config.getServletContext().getInitParameter("jdbcUsername");
String jdbcPassword = config.getServletContext().getInitParameter("jdbcPassword");

try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loan Application Form</title>
<style>
table {
	border-collapse: collapse;
	width: 75%;
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
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
  color: white;
}
.button2 {background-color: #008CBA;} /* Blue */
.button3 {background-color: #f44336;} /* Red */
</style>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body onload="myFunction()">

	<!--
	write the html code to accept laon info from user and send to placeloan servlet
-->
	<jsp:include page="header.jsp" />
	<form name="appl" action="user?action=application1" method="post">
		<div>
			<table align="center" border=1>
				<tbody>
					<tr>
						<td><label for="Loantypes">Choose a Loan Type:</label></td>
						<td><select id="Loantypes" name="Loantypes">
								<option value="default">--Select--</option>
								<option value="homeLoan">Home Loan</option>
								<option value="personalLoan">Personal Loan</option>
								<option value="goldLoan">Gold Loan</option>
						</select></td>
					</tr>
					<tr>
						<td>Loan application Number:</td>
						<%
							int applno = 0;
							int userid = 0;
						try {
							connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
							statement = connection.createStatement();
							String sql = "select ApplicationNumber,UserId from loaninfo";
							resultSet = statement.executeQuery(sql);
							if (resultSet.next() == false) {
								applno = 1;
							} else {
								while (resultSet.next()) {
							applno = resultSet.getInt("ApplicationNumber") + 1;
							userid = resultSet.getInt("UserId");
								}
							}
						%>

						<td><input type="text" id="applno" name="applno"
							value=<%=applno%> readonly>
							<input type="text" style="display:none" id="userid" name="userid"
							value=<%=userid%> readonly></td>
						<%
							connection.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					</tr>
					<tr>
						<td>Loan Amount Required:</td>
						<td><input type="text" id="loanAmountRequested"
							name="loanAmountRequested"></td>
					</tr>
					<tr>
						<td>Loan Application Date:</td>
						<td><input type="date" id="loanApplicationDate"
							name="loanApplicationDate"></td>
					</tr>

					<tr>
						<td>Business Structure:</td>
						<td><input type="radio" id="individual"
							name="businessStructure" value="individual"> <label
							for="individual">Individual</label> <br> <input type="radio"
							id="organisation" name="businessStructure" value="organisation">
							<label for="organisation">Organisation</label> <br></td>
					</tr>

					<tr>
						<td>Billing Indicator:</td>
						<td><input type="radio" id="salaried" name="billingIndicator"
							value="salaried"> <label for="salaried">Salaried</label>
							<br> <input type="radio" id="non-salaried"
							name="billingIndicator" value="non-salaried"> <label
							for="non-salaried">Non-Salaried</label> <br></td>
					</tr>
					<tr>
						<td>Tax Indicator:</td>
						<td><input type="radio" id="taxPayee" name="taxIndicator"
							value="taxPayee"> <label for="taxPayee">Tax Payee</label>
							<br> <input type="radio" id="non-taxPayee"
							name="taxIndicator" value="non-taxPayee"> <label
							for="non-taxPayee">Non-Tax Payee</label> <br></td>
					</tr>

					<tr>
						<td>Contact Address:</td>
						<td><input type="textarea" id="contactAddress"
							name="contactAddress"></td>
					</tr>
					<tr>
						<td>e-mail ID:</td>
						<td><input type="text" id="emailid" name="emailid"></td>
					</tr>
					<tr>
						<td>Mobile Number:</td>
						<td><input type="text" id="mobile" name="mobile"></td>
					</tr>
				</tbody>
			</table>
			<br>
			<table align="center">
				<tr>
					<td style="text-align:right" colspan="2"><input class="button button2" type="submit" formaction="user?action=application1"
						value="Apply Loan"> <input class="button button3" type="reset" value="Reset"></td>
				</tr>
			</table>


		</div>
	</form>
	</div>
	<hr />
	<jsp:include page="footer.jsp" />

	</script>


</body>
</html>
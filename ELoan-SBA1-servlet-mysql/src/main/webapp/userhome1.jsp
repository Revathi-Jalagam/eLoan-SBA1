<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
	<!-- write the html code to display hyperlinks for user functionalities -->
	<jsp:include page="header.jsp" />
	<h4>Dash Board</h4>
	<div align="right">
		<%
			String username = request.getParameter("loginid");
		%>
		<h4>
			<i class="fas fa-user"></i> Welcome <span style="color: blue"> <%
 	out.print(username);
 %></span>
		</h4>

		<a href="index.jsp">Logout</a>
	</div>
	<a href="application.jsp"><i class="far fa-newspaper"></i> Apply for Loan</a>
	<br>
	<a href="trackloan.jsp"><i class="fas fa-file-alt"><</i>Track Loan Application</a>
	<br>
	<a href="editloan.jsp"><i class="fas fa-edit"></i>Edit Loan Application</a>
	<jsp:include page="footer.jsp" />

</body>
</html>
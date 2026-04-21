<%@ page import="model.User"%>
<%@ page session="true"%>
<%
User u = (User) session.getAttribute("user");
if (u == null || !"DONOR".equals(u.getRole())) {
	response.sendRedirect("../login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Food</title>
</head>
<body>
	<h2>Post Surplus Food</h2>
	<form action="../postFood" method="post">
		Description:<br>
		<input type="text" name="description" required><br>
		Quantity (e.g. 20 plates):<br>
		<input type="text" name="quantity" required><br>
		Location:<br>
		<input type="text" name="location" required><br>
		<br>
		<button type="submit">Post</button>
	</form>
	<p>
		<a href="dashboard.jsp">Back</a>
	</p>
</body>
</html>
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
<title>Donor Dashboard</title>
</head>
<body>
	<h2>
		Welcome,
		<%=u.getName()%>
		(Donor)
	</h2>
	<p>
		<a href="postFood.jsp">Post Surplus Food</a> | <a href="../viewFood">View
			All</a> | <a href="../logout">Logout</a>
	</p>
	<%
	if (request.getParameter("msg") != null) {
	%>
	<p style="color: green">Posted successfully.</p>
	<% } %>
</body>
</html>
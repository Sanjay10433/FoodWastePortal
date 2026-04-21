<%@ page import="model.User"%>
<%@ page session="true"%>
<%
User u = (User) session.getAttribute("user");
if (u == null || !"NGO".equals(u.getRole())) {
	response.sendRedirect("../login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NGO Dashboard</title>
</head>
<body>
	<h2>
		Welcome,
		<%=u.getName()%>
		(NGO)
	</h2>
	<p>
		<a href="../viewFood">View Available Food</a> | <a href="../logout">Logout</a>
	</p>
	<%
	if (request.getParameter("msg") != null) {
	%>
	<p style="color: green">Claimed successfully.</p>
	<% } %>
</body>
</html>
<%@ page import="model.User"%>
<%@ page session="true"%>
<%
User u = (User) session.getAttribute("user");
if (u == null || !"ADMIN".equals(u.getRole())) {
	response.sendRedirect("../login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
</head>
<body>
	<h2>Admin Panel</h2>
	<p>Use MySQL console or extend this page to manage users & food
		posts.</p>
	<p>
		<a href="../logout">Logout</a>
	</p>
</body>
</html>
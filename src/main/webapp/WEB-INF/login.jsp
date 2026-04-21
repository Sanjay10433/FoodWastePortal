><%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<h2>Login</h2>
	<form action="login" method="post">
		Email:<br>
		<input type="email" name="email" required><br> Password:<br>
		<input type="password" name="password" required><br>
		<br>
		<button type="submit">Login</button>
	</form>
	<p>
		<a href="register.jsp">Register</a>
	</p>
</body>
</html>
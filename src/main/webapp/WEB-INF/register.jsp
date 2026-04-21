<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
	<h2>Register</h2>
	<form action="register" method="post">
		Name:<br>
		<input type="text" name="name" required><br> Email:<br>
		<input type="email" name="email" required><br> Password:<br>
		<input type="password" name="password" required><br>
		Role:<br> <select name="role">
			<option value="DONOR">Donor</option>
			<option value="NGO">NGO</option>
		</select><br>
		<br>
		<button type="submit">Register</button>
	</form>
	<p>
		<a href="login.jsp">Already have account? Login</a>
	</p>
</body>
</html>

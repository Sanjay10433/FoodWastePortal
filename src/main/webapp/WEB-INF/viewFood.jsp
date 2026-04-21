<%@ page import="java.util.List, model.Food"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Food</title>
</head>
<body>
	<h2>Available Food</h2>
	<p>
		<a href="index.jsp">Home</a>
	</p>
	<%
	List<Food> foods = (List<Food>) request.getAttribute("foods");
	if (foods == null || foods.isEmpty()) {
	%>
	<p>No available food at the moment.</p>
	<%
	} else {
	%>
	<table border="1" cellpadding="5">
		<tr>
			<th>ID</th>
			<th>Description</th>
			<th>Quantity</th>
			<th>Location</th>
			<th>Posted At</th>
			<th>Action</th>
		</tr>
		<%
		for (Food f : foods) {
		%>
		<tr>
			<td><%=f.getId()%></td>
			<td><%=f.getDescription()%></td>
			<td><%=f.getQuantity()%></td>
			<td><%=f.getLocation()%></td>
			<td><%=f.getPostedAt()%></td>
			<td>
				<form action="claimFood" method="post" style="display: inline">
					<input type="hidden" name="foodId" value="<%=f.getId()%>">
					<button type="submit">Claim</button>
				</form>
			</td>
		</tr>
		<% } %>
	</table>
	<% } %>
</body>
</html>
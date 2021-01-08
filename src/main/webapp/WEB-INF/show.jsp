<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
	#main {
		text-align: center;
	}
	#nav {
		margin-left: 90%;
		padding: 10px;
		color: black;
	}
	p {
		font-size: 25px;
	}
	
	button {
		margin-top: 20px;
	}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>A Language</title>
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a href="/" id="nav">Dashboard</a>
		</nav>
		<div id="main" class="p-3">
			<h1><c:out value="${lang.name}"/></h1>
				<p><c:out value="${lang.creator}"/></p>
				<p>Version <c:out value="${lang.currentVersion}"/></p>
				<a href="/languages/${lang.id}/edit"><button class="btn btn-primary">Edit</button></a>
				<a href="/delete/${lang.id}"><button class="btn btn-primary mr-2">Delete</button></a>
		</div>
	</div>
</body>
</html>
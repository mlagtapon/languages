<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Language Edit</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
	#main {
		display: flex;
		justify-content: center;
		font-size: 20px;
	}
	.nav {
		margin-left: 90%;
		padding: 10px;
	}

	a {
		color: black;
		padding: 20px;
	}
	
	h1{
		text-align: center;
		margin-bottom: 20px;
	}
	#namelabel{
		margin-right: 11px;
	}
	#sub {
		margin-left:74%;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="nav" href="/">Dashboard</a>
			<a class="nav" href="/delete/${languages.id}">Delete</a>
		</nav>		
		<h1>Edit <c:out value="${languages.name}"/></h1>
		
		<div id="main">
		<form:form action="/languages/${languages.id}" method="post" modelAttribute="languages">
    		<input type="hidden" name="_method" value="put">
	   		 <div class="form-group row">
	   		 	<form:label id="namelabel" path="name">Name:</form:label>
	   		 		<div class="col-sm-4">
			        	<form:errors path="name"/>
			        	<form:input class="ml-4" path="name"/>
			        </div>
	    	</div>
	    	<div class="form-group row">
	        	<form:label path="creator">Creator:</form:label>
		        	<div class="col-sm-4">
			        	<form:errors path="creator"/>
			        	<form:input class="ml-4" path="creator"/>
		        	</div>
	    	</div>
	   		<div class="form-group row">
	        	<form:label path="currentVersion">Version:</form:label>
		        	<div class="col-sm-4">
			        	<form:errors path="currentVersion"/>
			        	<form:input class="ml-4" path="currentVersion"/>
		        	</div>
		     </div>
	    		<div class="form-group row">
			    	<div id="sub">
			              <button type="submit" class="btn btn-primary">Submit</button>
			    	</div>
			  	</div>
			</form:form>
		</div>
	</div>
</body>
</html>
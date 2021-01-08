<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Languages</title>
<style>
	body {
		display: flex;
		justify-content: center;
		padding: 20px;
		font-size:20px;
		text-align: center;
	}
	#action {
		display: flex;
		justify-content: center;
	}
	#namelabel{
		margin-right: 13px;
	}
	
	form {
		margin: 50px 0px 0px 105px;
	}
	#sub {
		margin-left: 54%;
	}
</style>
</head>
<body>
	<div id="wrapper">
		<div id="langs">
			<table class="table table-bordered">
    			<thead class="thead-light">
        			<tr>
            			<th>Name</th>
            			<th>Creator</th>
            			<th>Version</th>
            			<th>Action</th>
        			</tr>
    			</thead>
    			<tbody>
        			<c:forEach items="${lang}" var="one">
        			<tr>
            			<td class="p-4"><a href="/languages/${one.id}"><c:out value="${one.name}"/></a></td>
            			<td class="p-4"><c:out value="${one.creator}"/></td>
            			<td class="p-4"><c:out value="${one.currentVersion}"/></td>
            			<td class="p-4" id="action"> 
							<a href="/delete/${one.id}"><button id="delete" class="btn btn-primary mr-2">Delete</button></a>
	    					<a href="/languages/${one.id}/edit"><button class="btn btn-primary">Edit</button></a>
    					</td>
        			</tr>
 
        			</c:forEach>
    			</tbody>
			</table>
		</div>
		
		<form:form action="/languages" method="post" modelAttribute="languages">
    		<div class="form-group row">
        		<form:label id="namelabel" path="name">Name</form:label>
        			<div class="col-sm-4">
		        		<form:errors path="name"/>
		        		<form:input class="ml-5" path="name"/>
		        	</div>
    		</div>
    		<div class="form-group row">
        		<form:label path="creator">Creator</form:label>
        			<div class="col-sm-4">
		        		<form:errors path="creator"/>
		        		<form:input class="ml-5" path="creator"/>
		        	</div>
    		</div>
    		<div class="form-group row">
        		<form:label path="currentVersion">Version</form:label>
        			<div class="col-sm-4">
		        		<form:errors path="currentVersion"/>
		        		<form:input class="ml-5" path="currentVersion"/>
		        	</div>
    		</div>    
    		<div class="form-group row">
		    	<div id="sub">
		              <button type="submit" class="btn btn-primary">Submit</button>
		    	</div>
		  	</div>
		</form:form> 
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<meta charset="ISO-8859-1">
	<title>Languages</title>
</head>
<body>


	
	<table class="table border border-dark table-striped table-hover m-auto w-50 p-3">
		<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Creator</th>
				<th scope="col">Version</th>
				<th scope="col">Action</th>
		    </tr>
		</thead>
			<tbody>
			    <c:forEach var="language" items="${languages}">
			    <tr>
					<!-- c:out not needed for each time -->
					<td><c:out value="${language.name}"/></td>
					<td><c:out value="${language.creator}"/></td>
					<td><c:out value="${language.currentVersion}"/></td>
					<td>
						<!-- how to include in url  -->
						<a href="/languages/${language.id}/delete">delete</a>
						<a href="/languages/${language.id}/edit">edit</a>
					</td>
				</tr>
				</c:forEach>
			</tbody>
	</table>
	
	<form:form class="m-auto w-50 p-3" action="/languages" method="POST" modelAttribute="language">
	    <p class="m-auto w-50 p-3 d-flex justify-content-between">
	        <form:label path="name">Name</form:label>
	        <form:errors path="name"/>
	        <form:input path="name"/>
	    </p>
	    <p class="m-auto w-50 p-3 d-flex justify-content-between">
	        <form:label path="creator">Creator</form:label>
	        <form:errors path="creator"/>
	        <form:input path="creator"/>
	    </p>
	    <p class="m-auto w-50 p-3 d-flex justify-content-between">
	        <form:label path="currentVersion">Current Version</form:label>
	        <form:errors path="currentVersion"/>
	        <form:input path="currentVersion"/>
	    </p>
	      
	    <input class ="btn btn-success btn-sm d-flex justify-content-sm-end" type="submit" value="Submit"/>
	</form:form>    
	
	
	<form>
		<div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
		    <div class="col-sm-10">
				<input type="email" class="form-control" id="inputEmail3">
		    </div>
		</div>
	</form>


</body>
</html>
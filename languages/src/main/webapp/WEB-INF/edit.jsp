<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<meta charset="ISO-8859-1">
	<title><c:out value="${language.name}"/></title>
</head>
<body class="m-auto w-50 p-3">

	<a href="/languages">Dashboard</a>

	<a href="/languages/${language.id}/delete">Delete</a>

	<form:form  action="/languages/${language.id}/edit" method="POST" modelAttribute="language">
	    <p>
	        <form:label path="name">Name</form:label>
	        <form:errors path="name"/>
	        <form:input path="name" value="${language.name}"/>
	    </p>
	    <p>
	        <form:label path="creator">Creator</form:label>
	        <form:errors path="creator"/>
	        <form:input path="creator" value="${language.creator}"/>
	    </p>
	    <p>
	        <form:label path="currentVersion">Current Version</form:label>
	        <form:errors path="currentVersion"/>
	        <form:input path="currentVersion" value="${language.currentVersion}"/>
	    </p>
	      
	      <!-- must be inserted for put method to function -->
		<input type="hidden" name="_method" value="put">
	      
	    <input class ="btn btn-success btn-sm" type="submit" value="Update"/>
	</form:form>    



</body>
</html>
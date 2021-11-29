<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title><c:out value="${language.name}"/></title>
</head>
<body class="m-auto w-50 p-3">

	<p><a href="/languages">Dashboard</a></p>
	<p><c:out value="${language.name}"/></p>
	<p><c:out value="${language.creator}"/></p>
	<p><c:out value="${language.currentVersion}"/></p>
	
	<p><a href="/languages/${language.id}/edit">Edit</a></p>
	
	<p><a href="/languages/${language.id}/delete">Delete</a></p>

</body>
</html>
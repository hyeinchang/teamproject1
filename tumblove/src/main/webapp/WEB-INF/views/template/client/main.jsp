<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<%@ page trimDirectiveWhitespaces="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
</head>
<body role="document">
<header>
<tiles:insertAttribute name="header"/>
</header>

<footer>
<tiles:insertAttribute name="footer"/>
</footer>
</body>
</html>

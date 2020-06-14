<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Главная</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/loginStyles.css">
</head>
<body>
<div>
    <sec:authorize access="isAuthenticated()">
    <form class="modal">
        <h3>${pageContext.request.userPrincipal.name}</h3>
        <p>
            <button type="button" onclick="location.href='/logout'" class="button">LOGOUT</button>
        </p>


        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
        <form class="modal">

            <p>
                <button type="button" onclick="location.href='/login'" class="button">LOGIN</button>
            </p>


            <p>
                <button type="button" onclick="location.href='/registration'" class="button">REGISTRATION
                </button>
            </p>


        </form>

        </sec:authorize>


</div>

</body>
</html>
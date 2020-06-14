<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Регистрация</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/loginStyles.css">
</head>

<body>
<div>

    <form:form method="POST" modelAttribute="userForm" class="modal">
        <h2><strong> Registration</strong></h2>
        <div>
            <fieldset>


                <form:input type="text" path="username" placeholder="Username"
                            autofocus="true"></form:input>

                <div class="error_message">
                    <form:errors path="username" cssClass="fa fa-warning alert-danger alert"></form:errors>
                        ${usernameError}
                </div>

                <p></p>

                <div class=error_message><form:input type="text" path="email" placeholder="Email"
                                                     autofocus="true"></form:input>
                    <form:errors path="email" cssClass="fa fa-warning alert-danger alert "></form:errors>
                </div>

                <p></p>

                <div class="error_message">
                    <form:input type="password" path="password" placeholder="Password"></form:input>
                    <form:errors path="password" cssClass="fa fa-warning alert-danger alert"></form:errors>

                </div>

                <p></p>

                <div class="error_message"><form:input type="password" path="passwordConfirm"
                                                       placeholder="Confirm your password"></form:input>
                        ${passwordError}
                </div>

                <p></p>

                <p>
                    <input type="submit" value="Registrate">
                </p>
                <a href="/" class="form-toggle">Back To Main</a>
            </fieldset>
        </div>
    </form:form>
</div>
</body>
</html>
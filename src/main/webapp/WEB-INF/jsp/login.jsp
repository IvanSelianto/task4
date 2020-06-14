<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/loginStyles.css">
    <title>Log in with your account</title>
</head>

<body>

<div>
    <form method="POST" action="/login" class="modal">
        <h1><strong>Welcome.</strong> Please login.</h1>
        <div>
            <fieldset>
                <p><input type="text"  name="username"   placeholder="Username"  onBlur="if(this.value=='')this.value='Username'"
                          onFocus="if(this.value=='Username')this.value='' "></p>
                <p><input type="password" name="password"  placeholder="Password" onBlur="if(this.value=='')this.value='Password'"
                          onFocus="if(this.value=='Password')this.value='' "></p>
                <p><input type="submit" value="Login"></p>

            </fieldset>
            <a href="/registration" class="form-toggle">Not Registered Yet?</a>
        </div>
    </form>
</div>

</body>
</html>
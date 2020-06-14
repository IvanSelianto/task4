<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Log in with your account</title>


    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/loginStyles.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css%22%3E"/>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#checkBoxAll').click(function () {
                if ($(this).is(":checked"))
                    $('.chkCheckBoxId').prop('checked', true);
                else
                    $('.chkCheckBoxId').prop('checked', false);
            });
        });
    </script>


</head>

<body>


<div>
    <form action="${pageContext.request.contextPath}/admin" method="post">
        <div class="replaceIcons">
            <button type="submit" name="action" value="delete" class="btn"><i class="fa fa-trash"></i></button>
            <button type="submit" name="action" value="block" class="btn"><i class="fa fa-lock"></i></button>
            <button type="submit" name="action" value="unblock" class="btn"><i class="fa fa-unlock"></i></button>
        </div>
        <p></p>
        <table class="table-fill">
            <thead>
            <th><input type="checkbox" id="checkBoxAll"> <Br></th>
            <th>ID</th>
            <th>UserName</th>
            <th>Email</th>
            <th>Registration Date</th>
            <th>Last login</th>
            <th>Status</th>
            <th>BLOCKED/UNLOCKED</th>
            </thead>

            <c:forEach items="${allUsers}" var="user">

                <tr>

                    <td><input type="checkbox" class="chkCheckBoxId" value="${user.id}" name="checkboxId"> <Br></td>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.registrationDate}</td>
                    <td>${user.lastLogin}</td>
                    <td>${user.status}</td>

                    <td>
                        <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <sec:authorize access="isAuthenticated()">
        <div class="replaceButtonLogout">
            <p>
                <button type="button" onclick="location.href='/logout'" class="button">LOGOUT
                </button>


            </p>
        </div>

        </sec:authorize>
</div>
</body>
</html>

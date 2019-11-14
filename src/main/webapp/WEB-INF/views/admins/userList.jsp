<%--
  Created by IntelliJ IDEA.
  User: stanislaw
  Date: 07.11.2019
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User List</title>

    <%@ include file="../scripts.jsp" %>

    <script>
        function confirmDelete(id, firstName, lastName) {
            if (confirm("Do you want to delete a user '" + firstName + " " + lastName +"'?")) {
                window.location.href = "/admins/delete/" + id;
            }
        }
    </script>


</head>
<body>
<%@ include file="navbaradmins.jsp" %>

<div class="container">
    <div class="h-50 row align-items-center">
    <h2>Właściciele psów</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Imię</th>
                    <th scope="col">Nazwisko</th>
                    <th scope="col">Email</th>
                    <th scope="col">Numer telefonu</th>
                    <th scope="col">Adres domowy</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <th>${user.firstName}</th>
                        <td>${user.lastName}</td>
                        <td>${user.email}</td>
                        <td>${user.phoneNumber}</td>
                        <td>${user.adress}</td>
                        <td><a type="button" class="btn btn-danger"  href="#" onclick="confirmDelete(${user.id}, '${user.firstName}', '${user.lastName}')">Usuń</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
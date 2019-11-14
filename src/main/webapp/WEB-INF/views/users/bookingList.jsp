<%--
  Created by IntelliJ IDEA.
  User: stanislaw
  Date: 08.11.2019
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Booking List</title>
    <%@ include file="../scripts.jsp" %>
    <script>
        function confirmDelete(id, dogName) {
            if (confirm("Czy chcesz usunąc rezerwację psa '" + dogName + "'?")) {
                window.location.href = "/users/bookings/delete/" + id;
            }
        }
    </script>
</head>
<body>
<%@ include file="navbarusers.jsp" %>
<div class="container">
    <div class="h-50 row align-items-center">
    <h2>Pobyty w hotelu</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Imię Psa</th>
                    <th scope="col">Data przyjazdu</th>
                    <th scope="col">Data wyjazdu</th>
                    <th scope="col">Pobyt</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <td>${booking.dog.name}</td>
                        <td>${booking.checkinDate}</td>
                        <td>${booking.checkoutDate}</td>
                        <td><c:choose>
                                <c:when test="${booking.confirmByAdmin}">Potwierdzony</c:when>
                                <c:otherwise>Oczekuje</c:otherwise>
                            </c:choose>
                        </td>
                        <td><a type="button" class="btn btn-warning" href="/users/bookings/edit/${booking.id}">Edytuj</a></td>
                        <td><a type="button" class="btn btn-danger"  href="#" onclick="confirmDelete(${booking.id}, '${booking.dog.name}')">Usuń</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
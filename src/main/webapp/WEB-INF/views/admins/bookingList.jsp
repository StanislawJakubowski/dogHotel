<%--
  Created by IntelliJ IDEA.
  User: stanislaw
  Date: 12.11.2019
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Booking List</title>
    <%@ include file="../scripts.jsp" %>

    <script>
        function confirmDelete(id, dogName) {
            if (confirm("Czy chcesz usunąc rezerwację psa '" + dogName + "'?")) {
                window.location.href = "/admins/bookings/delete/" + id;
            }
        }
    </script>


</head>
<body>
<%@ include file="navbaradmins.jsp" %>
<div class="container">
    <div class="h-50 row align-items-center">
    <h2>Pobyty w hotelu</h2>
        <table class="table table-striped" >
            <thead>
                <tr>
                    <th scope="col">Imię psa</th>
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
                        <td>
                            <a type="button" class="btn btn-success"  href="/admins/bookings/edit/${booking.id}">
                                <c:choose>
                                    <c:when test="${booking.confirmByAdmin}">Anuluj</c:when>
                                    <c:otherwise>Akceptuj</c:otherwise>
                                </c:choose>
                            </a>
                        </td>
                        <td><a type="button" class="btn btn-danger"  href="#" onclick="confirmDelete(${booking.id}, '${booking.dog.name}')">Usuń</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>


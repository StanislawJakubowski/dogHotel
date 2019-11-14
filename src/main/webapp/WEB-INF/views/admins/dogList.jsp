<%--Title
  Created by IntelliJ IDEA.
  User: stanislaw
  Date: 07.11.2019
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User List</title>

    <%@ include file="../scripts.jsp" %>

    <script>
        function confirmDelete(id, name) {
            if (confirm("Czy potwierdzasz usunięcie " + name + "'?")) {
                window.location.href = "/admins/dogs/delete/" + id;
            }
        }
    </script>

</head>
<body>
<%@ include file="navbaradmins.jsp" %>

<div class="container" >
    <div class="h-50 row align-items-center">
    <h2>Wszystkie psy</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Imię psa</th>
                        <th scope="col">Płeć</th>
                        <th scope="col">Rasa</th>
                        <th scope="col">Waga</th>
                        <th scope="col">Alergie</th>
                        <th scope="col">Właściciel</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dog" items="${dogs}">
                        <tr>
                            <td>${dog.name}</td>
                            <td>${dog.gender}</td>
                            <td>${dog.race}</td>
                            <td>${dog.weight}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${dog.checkallergy}">
                                        ${dog.allergies}
                                    </c:when>
                                    <c:otherwise>no allergy</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${dog.user.firstName} ${dog.user.lastName} </td>
                            <td><a type="button" class="btn btn-warning" href="/admins/bookings/list/${dog.id}">Pobyty w hotelu</a></td>
                            <td><a type="button" class="btn btn-danger"  href="#" onclick="confirmDelete(${dog.id}, '${dog.name}')">Usuń z listy</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
        </table>
    </div>
</div>
</body>
</html>

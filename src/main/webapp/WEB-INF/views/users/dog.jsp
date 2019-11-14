<%--
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
    <title>Dog</title>
    <%@ include file="../scripts.jsp" %>
    <script>
        function myFunction() {
            var checkBox = document.getElementById("myCheckAllergy");
            var text = document.getElementById("allergyDescription");
            if (checkBox.checked == true){
                text.style.display = "block";
            } else {
                text.style.display = "none";
            }
        }
    </script>
</head>
<body>
<%@ include file="navbarusers.jsp" %>

<div class="container">
    <form:form method="post" modelAttribute="dog">
        <div class="form-group">
            <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                    <legend><h2><b><br>
                        <c:choose>
                            <c:when test="${not empty dog.id}">Edytuj psa</c:when>
                            <c:otherwise>Dodaj psa</c:otherwise>
                        </c:choose>
                    </b></h2></legend><br>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                    <form:input path="name" name="name" placeholder="Imię psa" class="form-control"  type="text"/>
                    <form:errors path="name"/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                    <form:select path="gender" items="${gender}" class="form-control" />
                    <form:errors path="gender"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                    <form:input path="race" placeholder="rasa" class="form-control"  type="text"/>
                    <form:errors path="race"/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                    <form:input path="weight" placeholder="waga" class="form-control"  type="text"/>
                    <form:errors path="weight"/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-2 inputGroupContainer">
                <div class="form-check">
                    <form:checkbox path="checkallergy" id="myCheckAllergy" onclick="myFunction()" class="form-check-input"/>
                    <span class="h5opacity checkboxtext">Alergie</span>
                </div>
            </div>
        </div>

        <div class="form-group" id="allergyDescription">
            <div class="col-md-7 inputGroupContainer">
                <div class="input-group">
                    <form:textarea path="allergies" placeholder="alergie psiaka" class="form-control" type="text"/>
                    <form:errors path="allergies"/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label"></label>
            <div class="col-md-4"><br>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit" class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspZapisz<span class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
            </div>
        </div
    </form:form>
</div>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: stanislaw
  Date: 08.11.2019
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Booking</title>
    <%@ include file="../scripts.jsp" %>
</head>
<body>
<%@ include file="navbarusers.jsp" %>

<div class="container">
    <form:form class="well form-horizontal" method="post" modelAttribute="booking" id="contact_form" action=" " >
    <fieldset>
        <div class="form-group">
            <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                   <legend><h2><b><br>Dodaj pobyt</b></h2></legend><br>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-4 inputGroupContainer">
                <div class="input-group">
                    <form:select itemValue="id" path="dog.id" itemLabel="name" items="${dogs}" class="form-control"/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-4 inputGroupContainer"><h5 class="h5opacity">Data przyjazdu</h5>
                <div class="input-group">
                    <form:input type="date" path="checkinDate" class="form-control"/>
                    <form:errors path="checkinDate"/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-4 inputGroupContainer"><h5 class="h5opacity">Data wyjazdu</h5>
                <div class="input-group">
                    <form:input type="date" path="checkoutDate" class="form-control"/>
                    <form:errors path="checkoutDate"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label"></label>
            <div class="col-md-4"><br>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit" class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspZapisz<span class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
            </div>
        </div>

    </fieldset>
    </form:form>
</div>


</body>
</html>
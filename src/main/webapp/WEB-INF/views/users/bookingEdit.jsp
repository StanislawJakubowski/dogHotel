<%--
  Created by IntelliJ IDEA.
  User: stanislaw
  Date: 12.11.2019
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
                        <legend><h2><b><br>Edytuj pobyt</b></h2></legend><br>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <legend><h3><b> ${booking.dog.name}</b></h3></legend>
                        <form:input type="hidden" path="dog" />
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-4 inputGroupContainer">Data przyjazdu
                    <div class="input-group">
                        <form:input type="date" path="checkinDate" class="form-control"/>
                        <form:errors path="checkinDate"/>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-4 inputGroupContainer">Data wyjazdu
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

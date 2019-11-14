<%--
  Created by IntelliJ IDEA.
  User: stanislaw
  Date: 08.11.2019
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="../../../resources/css/registration.css">
<html>
<head>
    <title>Title</title>
    <%@include file="../scripts.jsp"%>
</head>
<body>
<%@ include file="navbarindex.jsp" %>

<%--<div class="container">--%>
<%--    <h2>Fill form to registry</h2>--%>
<%--    <form:form method="post" modelAttribute="user" >--%>
<%--        <div class="form-row">--%>
<%--            <div class="form-group col-md-6">--%>
<%--                <label for="InputFirstName">First name</label>--%>
<%--                <form:input path="firstName" type="text" class="form-control" id="InputFirstName" />--%>
<%--                <form:errors path="firstName"/>--%>
<%--            </div>--%>
<%--            <div class="form-group col-md-6">--%>
<%--                <label for="inputLastName">Last name</label>--%>
<%--                <form:input path="lastName" type="text" class="form-control" id="inputLastName"/>--%>
<%--                <form:errors path="lastName"/>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="form-row">--%>
<%--            <div class="form-group col-md-6">--%>
<%--                <label for="emailInput">Email address</label>--%>
<%--                <form:input path="email" type="text" class="form-control" id="emailInput" placeholder="name@example.com"/>--%>
<%--                <form:errors path="email"/>--%>
<%--            </div>--%>
<%--            <div class="form-group col-md-6">--%>
<%--                <label for="InputPhone">Phone number</label>--%>
<%--                <form:input path="phoneNumber" type="text" class="form-control" id="InputPhone"/>--%>
<%--                <form:errors path="phoneNumber"/>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="form-row">--%>
<%--            <div class="form-group col-md-6">--%>
<%--                <label for="inputPassword">Password</label>--%>
<%--                <form:input path="password" type="password" class="form-control" id="inputPassword"/>--%>
<%--                <form:errors path="password"/>--%>
<%--            </div>--%>
<%--            <div class="form-group col-md-6">--%>
<%--                <label for="inputPassword2">Repeat password</label>--%>
<%--                <input name="password2" type="password" class="form-control" id="inputPassword2"/>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="form-group">--%>
<%--            <label for="InputAdress">Home address</label>--%>
<%--            <form:input path="adress" type="text" class="form-control" id="InputAdress" />--%>
<%--            <form:errors path="adress"/>--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn btn-primary">Registry</button>--%>
<%--    </form:form>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<div class="container">
    <form:form class="well form-horizontal" method="post" modelAttribute="user" id="contact_form" action=" "  >
        <fieldset>
            <div class="form-group">
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                       <legend><h2><b><br></br>Rejestracja</b></h2></legend><br>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <form:input path="firstName" name="first_name" placeholder="Imię" class="form-control"  type="text"/>
                        <form:errors path="firstName"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <form:input path="lastName" name="last_name" placeholder="Nazwisko" class="form-control"  type="text"/>
                        <form:errors path="lastName"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <form:input path="email" name="email" placeholder="E-Mail" class="form-control"  type="text"/>
                        <form:errors path="email"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <form:input path="password" name="user_password" placeholder="hasło" class="form-control"  type="password"/>
                        <form:errors path="password"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <input name="password2" placeholder="Powtórz hasło" class="form-control"  type="password">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <form:input path="phoneNumber" name="contact_no" placeholder="numer relefonu" class="form-control" type="text"/>
                        <form:errors path="phoneNumber"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <form:input  path="adress" name="user_name" placeholder="adres domowy" class="form-control"  type="text"/>
                        <form:errors path="adress"/>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label"></label>
                <div class="col-md-4"><br>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit" class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspZAREJESTRUJ SIĘ<span class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
                </div>
            </div>

        </fieldset>
    </form:form>
</div>

</body>>
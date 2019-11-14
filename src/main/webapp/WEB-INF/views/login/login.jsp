<%--
  Created by IntelliJ IDEA.
  User: stanislaw
  Date: 08.11.2019
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="../../../resources/css/login.css">

<html>
<head>
    <title>Login</title>
    <%@include file="../scripts.jsp"%>
</head>
<body>
<%@ include file="navbarindex.jsp" %>
<div class="wrapper fadeInDown">
    <div id="formContent">
        <div class="fadeIn first">
            <br><img src="/resources/images/DH.jpg" width="60" height="60" class="d-inline-block align-top" alt="">
            <p><h3>Logowanie</h3></p>
        </div>
        <form:form method="post" modelAttribute="user">

                <form:input path="email" type="text" class="form-control fadeIn second" id="login" placeholder="email"/>
                <p><form:errors path="email"/></p>
                <form:input path="password" type="password"  class="form-control fadeIn third" id="password" placeholder="hasło"/>
                <p><form:errors path="password"/></p>

            <button type="submit" class="btn btn-primary fadeIn fourth">Zaloguj</button>
        </form:form>
    </div>
</div>



<%--<div class="container">--%>
<%--<h2>Fill form to login</h2>--%>
<%--    <form:form method="post" modelAttribute="user" >--%>
<%--        <div class="form-group">--%>
<%--            <label for="emailInput">Email address</label>--%>
<%--            <form:input path="email" type="text" class="form-control" id="emailInput" placeholder="name@example.com"/>--%>
<%--            <form:errors path="email"/>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="inputPassword">Password</label>--%>
<%--            <form:input path="password" type="password" class="form-control" id="inputPassword"/>--%>
<%--            <form:errors path="password"/>--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn btn-primary">Login</button>--%>
<%--    </form:form>--%>
<%--</div>--%>
</body>
</html>
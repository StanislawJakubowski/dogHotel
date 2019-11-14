<%--
  Created by IntelliJ IDEA.
  User: stanislaw
  Date: 12.11.2019
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<link rel="stylesheet" type="text/css" href="../../../resources/css/main.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <nav class="x-navbar navbar navbar-expand-lg navbar-light bg-light">

        <div class="form-group col-md-1 navbar-brand " style="margin-top: 10px;" >
            <img src="/resources/images/DH.jpg" width="40" height="40" class="d-inline-block align-top" alt="">
        </div>

        <div class="form-group col-md-1 navbar-brand text-lg-center font-weight-bolder " style="margin-top: 10px;">
            <span style="background-color: darkgray">Witaj  ${user.firstName}</span>
        </div>
        <div  class="form-group col-md-5"></div>

        <ul class="nav nounderline text-uppercase">
            <li class="nav-item ml-4">
                <a class="nav-link color-header btn btn-secondary" href="/admins/list">właściciele</a>
            </li>
            <li class="nav-item ml-4">
                <a class="nav-link color-header btn btn-secondary" href="/admins/bookings/list">pobyty</a>
            </li>
            <li class="nav-item ml-4">
                <a class="nav-link color-header btn btn-secondary" href="/admins/dogs/list">psy</a>
            </li>
            <li class="nav-item ml-4">
                <a class="nav-link color-header btn btn-secondary" href="/login/logout">wyloguj</a>
            </li>
        </ul>
    </nav>
</header>


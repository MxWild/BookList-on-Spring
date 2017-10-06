<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="searchBook" value="/search"/>

<nav class="navbar navbar-default">
    <div class="container">
        <%--<div class="navbar-header">
            <a class="navbar-brand" href="<c:url value="/"/>">BookList</a>
        </div>--%>
        <ul class="nav navbar-nav">
            <li><a href="<c:url value="/"/>">Главная</a></li>
            <li><a href="<c:url value="/add"/>">Добавить книгу</a></li>
        </ul>
        <form action="${searchBook}" method="get" class="navbar-form navbar-left">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Найти книгу" name="searchString">
            </div>
            <button type="submit" class="btn btn-default">Найти</button>
        </form>
    </div>
</nav>
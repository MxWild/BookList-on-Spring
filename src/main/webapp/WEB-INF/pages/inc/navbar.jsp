<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<nav class="navbar navbar-inverse">
    <div class="container">
        <ul class="nav navbar-nav">
            <li><a href="<c:url value="/"/>">Главная</a></li>
            <li><a href="<c:url value="/add"/>">Добавить книгу</a></li>
        </ul>
        <form action="/search" method="post" class="navbar-form navbar-left">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Искать книгу">
                <div class="input-group-btn">
                    <form class="btn btn-default">
                        <button class="btn btn-default" type="submit">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </form>
                </div>
            </div>
    </div>
    </form>
</nav>

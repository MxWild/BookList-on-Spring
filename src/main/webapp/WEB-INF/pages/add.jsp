<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Список Книг - Spring Project</title>
</head>
<body>
<div class="container">
    <h2>Добавление книги</h2>

    <form:form action="/add" method="POST" modelAttribute="book">
        <div class="form-group">
            <form:label path="title">
                <spring:message text="Название:"/>
            </form:label>
            <form:input path="title"/>
        </div>
        <div class="form-group">
            <form:label path="description" class="control-label">Описание:</form:label>
            <form:input path="description"/>
        </div>
        <div class="form-group">
            <form:label path="author" class="control-label">Автор:</form:label>
            <form:input path="author"/>
        </div>
        <div class="form-group">
            <form:label path="isbn" class="control-label">ISBN:</form:label>
            <form:input path="isbn"/>
        </div>
        <div class="form-group">
            <form:label path="printYear" class="control-label">Год печати:</form:label>
            <form:input path="printYear"/>
        </div>
        <div class="form-group">
            <form:label path="readAlready" class="control-label">Прочитано?</form:label>
            <form:input path="readAlready"/>
        </div>
        <div class="form-group">
            <form:button class="btn btn-primary">Добавить</form:button>
        </div>
    </form:form>
</div>
</body>
</html>
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
<div class="container-fluid">
    <% int count = 0; %>
    <h2>Список Книг</h2>

    <a href="add" class="btn btn-warning">Добавить книгу</a>

    <div class="table-responsive">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>№</th>
                <th>Название:</th>
                <th>Описание:</th>
                <th>Автор:</th>
                <th>ISBN</th>
                <th>Год:</th>
                <th>Читал?</th>
            </tr>
            </thead>

            <c:forEach items="${allBooks}" var="book">
                <tr>
                    <td><%= ++count %>
                    </td>
                    <td>${book.title}</td>
                    <td>${book.description}</td>
                    <td>${book.author}</td>
                    <td>${book.isbn}</td>
                    <td>${book.printYear}</td>
                    <td>${book.readAlready}</td>
                </tr>
            </c:forEach>

        </table>
    </div>

    <a href="add" class="btn btn-warning">Добавить книгу</a>
</div>
</body>
</html>

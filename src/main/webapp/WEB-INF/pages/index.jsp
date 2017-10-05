<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="inc/header.jsp"/>

<jsp:include page="inc/navbar.jsp"/>


<div class="container">
    <% int count = 0; %>
    <h2 class="page-header">Список Книг</h2>

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
                    <td>
                            ${book.title}<br>
                        <a class="btn btn-primary btn-sm <c:if test="${book.readAlready}">disabled</c:if>" href="/read/${book.id}" title="Читать"><span
                                class="glyphicon glyphicon-book"></span></a>
                        <a class="btn btn-success btn-sm" href="/edit/${book.id}" title="Обновить"><span
                                class="glyphicon glyphicon-pencil"></span></a>
                        <a class="btn btn-danger btn-sm" href="/remove/${book.id}" title="Удалить"><span
                                class="glyphicon glyphicon-trash"></span></a>

                    </td>
                    <td>${book.description}</td>
                    <td>${book.author}</td>
                    <td>${book.isbn}</td>
                    <td>${book.printYear}</td>
                    <c:choose>
                        <c:when test="${book.readAlready}">
                            <td>Читал</td>
                        </c:when>
                        <c:otherwise>
                            <td>Нет</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>

        </table>
    </div>


    <div class="text-center">
        <div class="pagination">
            <li class="active"><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
        </div>
    </div>

    <hr>
    <footer>

    </footer>
</div>
<jsp:include page="inc/footer.jsp"/>
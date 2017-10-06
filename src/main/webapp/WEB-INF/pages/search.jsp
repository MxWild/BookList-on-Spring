<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="inc/header.jsp"/>

<jsp:include page="inc/navbar.jsp"/>

<div class="container">

    <h2 class="text-center">Найдены следующие книги:</h2>

    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>Название:</th>
                <th>Описание:</th>
                <th>Автор:</th>
                <th>Год:</th>
                <th>Статус:</th>
            </tr>
            </thead>


            <c:forEach items="${searchedBooks}" var="sbook">
                <tr>
                    <td>${sbook.title}</td>
                    <td>${sbook.description}</td>
                    <td>${sbook.author}</td>
                    <td>${sbook.printYear}</td>
                    <c:choose>
                        <c:when test="${book.readAlready}">
                            <td>Прочитана</td>
                        </c:when>
                        <c:otherwise>
                            <td>Не прочитана</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>

        </table>
    </div>

</div>
<jsp:include page="inc/footer.jsp"/>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="inc/header.jsp"/>

<jsp:include page="inc/navbar.jsp"/>

<c:url var="editBook" value="/edit"/>

<div class="container">

    <form:form action="${editBook}" commandName="book" method="post">

        <div class="form-group">
            <form:label path="title" class="control-label">
                <spring:message text="Название:"/>
            </form:label>
            <form:input path="title" class="form-control"/>
        </div>

        <div class="form-group">
            <form:label path="description" class="control-label">
                <spring:message text="Описание:"/>
            </form:label>
            <form:input path="description" class="form-control"/>
        </div>

        <div class="form-group">
            <form:label path="author" class="control-label">
                <spring:message text="Автор:"/>
            </form:label>
            <form:input path="author" class="form-control" readonly="true"/>
        </div>

        <div class="form-group">
            <form:label path="isbn" class="control-label">
                <spring:message text="ISBN:"/>
            </form:label>
            <form:input path="isbn" class="form-control"/>
        </div>

        <div class="form-group">
            <form:label path="printYear" class="control-label">
                <spring:message text="Год печати:"/>
            </form:label>
            <form:input path="printYear" class="form-control"/>
        </div>

        <div class="form-group hidden">
            <form:label path="readAlready" class="control-label">
                <spring:message text="Прочитал?"/>
            </form:label>
            <form:input path="readAlready" class="form-control" value="false"/>
        </div>

        <div class="form-group hidden">
            <form:input path="id" class="form-control"/>
        </div>

        <div class="form-group">
            <form:button class="btn btn-success">Обновить</form:button>
        </div>

    </form:form>


    <div class="table-responsive">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>Название:</th>
                <th>Описание:</th>
                <th>Автор:</th>
                <th>ISBN</th>
                <th>Год:</th>
                <th>Читал?</th>
            </tr>
            </thead>

            <tr>
                <td>${book.title}<br></td>
                <td>${book.description}</td>
                <td>${book.author}</td>
                <td>${book.isbn}</td>
                <td>${book.printYear}</td>
                <td>${book.readAlready}</td>
            </tr>

        </table>
    </div>

</div>

</body>
</html>

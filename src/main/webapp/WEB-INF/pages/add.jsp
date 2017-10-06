<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="inc/header.jsp"/>

<jsp:include page="inc/navbar.jsp"/>

<c:url var="addBook" value="/add"/>

<div class="container">
    <h2>Добавление книги</h2>

    <form:form action="${addBook}" modelAttribute="book" method="post">

        <div class="form-group">
            <form:label path="title" cssClass="control-label">
                <spring:message text="Название:"/>
            </form:label>
            <form:input path="title" cssClass="form-control"/>
            <form:errors path="title" cssClass="text-danger"/>
        </div>

        <div class="form-group">
            <form:label path="description" cssClass="control-label">
                <spring:message text="Описание:"/>
            </form:label>
            <form:input path="description" cssClass="form-control"/>
            <form:errors path="description" cssClass="text-danger"/>
        </div>

        <div class="form-group">
            <form:label path="author" cssClass="control-label">
                <spring:message text="Автор:"/>
            </form:label>
            <form:input path="author" cssClass="form-control"/>
            <form:errors path="author" cssClass="text-danger"/>
        </div>

        <div class="form-group">
            <form:label path="isbn" cssClass="control-label">
                <spring:message text="ISBN:"/></form:label>
            <form:input path="isbn" cssClass="form-control"/>
            <form:errors path="isbn" cssClass="text-danger"/>
        </div>

        <div class="form-group">
            <form:label path="printYear" cssClass="control-label">
                <spring:message text="Год печати:"/>
            </form:label>
            <form:input path="printYear" cssClass="form-control"/>
            <form:errors path="printYear" cssClass="text-danger"/>
        </div>

        <div class="form-group hidden">
            <form:label path="readAlready" cssClass="control-label">
                <spring:message text="Прочитано?"/></form:label>
            <form:input path="readAlready" cssClass="form-control"/>
        </div>

        <div class="form-group">
            <form:button class="btn btn-primary">Добавить</form:button>
        </div>
    </form:form>
</div>
</body>
</html>
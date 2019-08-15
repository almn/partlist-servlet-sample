<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <title>Part List</title>
    </head>
    <body>
        <div class="container">
            <h1>Part List</h1>

            <hr>

            <%@include file="/WEB-INF/jspf/search_filter.jspf" %>

            <hr>

            <table class="table table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">
                            <a href="${commonQueryString}sort=part_number&<c:if test="${currentSort.equals('part_number')}">${descSort ? "desc=0" : "desc=1"}</c:if>" 
                               class="text-white">P/N</a> 
                            <c:if test="${currentSort.equals('part_number')}">${descSort ? "&#9660;" : "&#9650;"}</c:if>
                        </th>
                        <th scope="col">
                            <a href="${commonQueryString}sort=part_name&<c:if test="${currentSort.equals('part_name')}">${descSort ? "desc=0" : "desc=1"}</c:if>" 
                                class="text-white">Part Name</a>
                            <c:if test="${currentSort.equals('part_name')}">${descSort ? "&#9660;" : "&#9650;"}</c:if>
                        </th>
                        <th scope="col">
                            <a href="${commonQueryString}sort=vendor&<c:if test="${currentSort.equals('vendor')}">${descSort ? "desc=0" : "desc=1"}</c:if>" 
                                class="text-white">Vendor</a>
                            <c:if test="${currentSort.equals('vendor')}">${descSort ? "&#9660;" : "&#9650;"}</c:if>
                        </th>
                        <th scope="col">
                            <a href="${commonQueryString}sort=quantity&<c:if test="${currentSort.equals('quantity')}">${descSort ? "desc=0" : "desc=1"}</c:if>" 
                                class="text-white">Qty</a>
                            <c:if test="${currentSort.equals('quantity')}">${descSort ? "&#9660;" : "&#9650;"}</c:if>
                        </th>
                        <th scope="col">
                            <a href="${commonQueryString}sort=shipped&<c:if test="${currentSort.equals('shipped')}">${descSort ? "desc=0" : "desc=1"}</c:if>" 
                                class="text-white">Shipped</a>
                            <c:if test="${currentSort.equals('shipped')}">${descSort ? "&#9660;" : "&#9650;"}</c:if>
                        </th>
                        <th scope="col">
                            <a href="${commonQueryString}sort=received&<c:if test="${currentSort.equals('received')}">${descSort ? "desc=0" : "desc=1"}</c:if>" 
                                class="text-white">Received</a>
                            <c:if test="${currentSort.equals('received')}">${descSort ? "&#9660;" : "&#9650;"}</c:if>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${parts}" var="part">
                        <tr>
                            <td><c:out value="${part.getPartNumber()}"></c:out></td>
                            <td><c:out value="${part.getPartName()}"></c:out></td>
                            <td><c:out value="${part.getVendor()}"></c:out></td>
                            <td><c:out value="${part.getQuantity()}"></c:out></td>
                            <td><fmt:formatDate value="${part.getShippedDateAsDate()}" pattern="MMM dd, yyyy" /></td>
                            <td><fmt:formatDate value="${part.getReceivedDateAsDate()}" pattern="MMM dd, yyyy" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>

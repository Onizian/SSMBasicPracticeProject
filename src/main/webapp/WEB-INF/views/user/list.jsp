<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户列表</title>
    <%--引入Bootstrap CSS--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%-- 这里应该有一段代码来处理message --%>
<c:if test="${not empty message}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>操作成功!</strong> ${message} <%-- 关键在这里：${message} --%>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>

<div class="container mt-5">
    <h1 class="text-center mb-4">用户管理系统</h1>

    <%--搜索区域--%>
    <div class="row mb-3">
        <div class="col-md-6">
            <form class="d-flex" action="${pageContext.request.contextPath}/user/findById.do" method="get">
                <input type="number" class="form-control me-2" name="id" placeholder="输入用户ID" required>
                <button type="submit" class="btn btn-primary">搜索</button>
            </form>
        </div>
        <div class="col-md=6 text-end">
            <a href="${pageContext.request.contextPath}/user/add.do" class="btn btn-success">添加用户</a><%--未实现--%>
        </div>
    </div>

    <%--用户列表表格--%>
    <table class="table table-striped table-hover">
        <thead class="table-dark">
            <tr>
                <td>ID</td>
                <th>用户名</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${userdbList}" var="userdb">
                <tr>
                    <td>${userdb.id}</td>
                    <td>${userdb.username}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/user/findById.do?id=${userdb.id}" class="btn btn-sm btn-info">查看</a>
                        <a href="${pageContext.request.contextPath}/user/edit.do?id=${userdb.id}" class="btn btn-sm btn-warning">编辑</a>
                        <a href="${pageContext.request.contextPath}/user/delete.do?id=${userdb.id}" class="btn btn-sm btn-danger" onclick="return confirm('确定删除该用户吗？')">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <%--分页控件--%>
    <nav>
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link" href="#">上一页</a>
            </li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">下一页</a>
            </li>
        </ul>
    </nav>
</div>
<!-- 引入Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


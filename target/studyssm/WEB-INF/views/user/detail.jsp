<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户详情</title>
    <!-- 引入Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">用户详情</h1>

    <div class="card">
        <div class="card-header">
            <h5 class="card-title">用户信息</h5>
        </div>
        <div class="card-body">
            <c:if test="${not empty userdb}">
                <dt class="col-sm-3">用户ID</dt>
                <dd class="col-sm-9">${userdb.id}</dd>

                <dt class="col-sm-3">用户名</dt>
                <dd class="col-sm-9">${userdb.username}</dd>

            </c:if>
            <c:if test="${empty userdb}">
                <div class="alert alert-warning" role="alert">
                    未找到该用户信息
                </div>
            </c:if>
        </div>
        <div class="card-footer text-end">
            <a href="${pageContext.request.contextPath}/user/findAll.do" class="btn btn-primary">返回列表</a>
        </div>
    </div>
</div>
<!-- 引入Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


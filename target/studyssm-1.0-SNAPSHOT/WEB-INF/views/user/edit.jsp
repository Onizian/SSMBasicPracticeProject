<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>编辑用户 - SSM管理系统</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 600px;
            margin: 2rem auto;
            padding: 2rem;
            border: 1px solid #dee2e6;
            border-radius: 0.5rem;
            background-color: #f8f9fa;
        }
        .form-header {
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 1px solid #dee2e6;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <div class="form-header">
            <h2 class="text-center">编辑用户信息</h2>
        </div>

        <form action="${pageContext.request.contextPath}/user/update.do" method="post">
            <input type="hidden" name="id" value="${userdb.id}">

            <div class="mb-3">
                <label for="username" class="form-label">姓名</label>
                <input type="text" class="form-control" id="username" name="username"
                       value="${userdb.username}" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">密码</label>
                <input type="text" class="form-control" id="password" name="password"
                       value="${userdb.password}" min="1" max="120" required>
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                <button type="button" class="btn btn-secondary me-md-2"
                        onclick="history.back()">取消</button>
                <button type="submit" class="btn btn-primary">保存更改</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

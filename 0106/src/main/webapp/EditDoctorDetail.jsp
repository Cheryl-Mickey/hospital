<%--@elvariable id="doctor" type="jmu.fxy.hospital.Entity.Doctor"--%>
<%--
  Created by IntelliJ IDEA.
  User: 方欣渝
  Date: 2025/1/8
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>编辑医生信息</title>
    <style>
        /* 整体页面布局，可根据实际需求调整样式 */
        body {
            display: flex;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(to bottom, #87CEEB, #00BFFF); /* 渐变色背景 */
            background-size: cover;
            background-position: center;
            background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
        }

        form {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            width: 500px;
            margin: 50px auto;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        button {
            padding: 8px 15px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
        .error-msg {
            color: red;
            margin-top: 5px;
            font-size: 14px;
        }

        .backend-error {
            color: red;
            background-color: #f8d7da;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
        }
    </style>
</head>

<body>
<c:if test="${not empty errorMessage}">
    <div class="backend-error">${errorMessage}</div>
</c:if>

<form action="${pageContext.request.contextPath}/edit-doctor/edit" method="post">
    <input type="number" name="doctor_id" placeholder="医生编号" required><br>
    <input type="number" name="department_id" placeholder="科室编号" required><br>
    <input type="text" name="doctor_name" placeholder="医生姓名" required><br>
    <input type="text" name="doctor_sex" placeholder="医生性别"><br>
    <input type="text" name="doctor_picture" placeholder="医生照片"><br>
    <textarea name="doctor_skill" placeholder="医生技能"></textarea><br>
    <button type="submit">提交更新</button>
</form>
<script>
    const departmentIdInput = document.getElementById('departmentId');
    const departmentIdError = document.getElementById('departmentIdError');

    departmentIdInput.addEventListener('blur', function () {
        const value = departmentIdInput.value;
        if (isNaN(value) || value <= 0) {
            departmentIdError.textContent = '请输入正整数作为科室编号';
        } else {
            departmentIdError.textContent = '';
        }
    });

    const form = document.querySelector('form');
    form.addEventListener('submit', function (e) {
        if (departmentIdError.textContent) {
            e.preventDefault();
        }
    });
</script>
</body>

</html>
<%--
  Created by IntelliJ IDEA.
  User: 方欣渝
  Date: 2025/1/8
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>编辑科室信息</title>
  <style>
    /* 整体页面布局，使用flex，左右分栏 */
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(to bottom, #87CEEB, #00BFFF); /* 渐变色背景 */
      background-size: cover;
      background-position: center;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    /* 右侧内容区域样式 */
    .right-content {
      width: 80%;
      max-width: 600px;
      padding: 30px;
      background-color: rgba(255, 255, 255, 0.9);
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      border-radius: 10px;
    }
    h2 {
      color: #333;
      margin-top: 0;
      margin-bottom: 20px;
      text-align: center;
      font-size: 24px;
    }

    form {
      margin-bottom: 0;
      background-color: transparent;
      padding: 0;
      box-shadow: none;
    }
    /* 输入框容器样式 */
    .input-container {
      margin-bottom: 20px;
    }

    label {
      display: block;
      margin-bottom: 5px;
      color: #555;
      font-weight: bold;
    }
    input[type="text"],
    input[type="number"],
    textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      transition: border-color 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="number"]:focus,
    textarea:focus {
      border-color: #007BFF;
      outline: none;
    }

    textarea {
      resize: vertical;
      min-height: 100px;
    }

    button {
      display: block;
      width: 100%;
      padding: 10px 0;
      background-color: #007BFF;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
      font-size: 16px;
      margin-top: 20px;
    }

    button:hover {
      background-color: #0056b3;
    }

    /* 错误提示信息样式 */
    .error-message {
      color: red;
      margin-bottom: 10px;
      text-align: center;
    }

    /* 整体页面布局微调，使用flex让表单元素排列更整齐 */
    #page-content {
      display: flex;
      flex-direction: column;
      align-items: center;
    }
  </style>
</head>

<body>
<!-- 右侧内容区域 -->
<div class="right-content">
  <div id="page-content">
    <!-- 显示后端返回的错误消息 -->
    <c:if test="${not empty errorMessage}">
      <div class="error-message">${errorMessage}</div>
    </c:if>

    <h2>编辑科室信息</h2>

    <form action="${pageContext.request.contextPath}/edit-department/edit" method="post">
      <!-- 隐藏字段，用于传递科室编号，确保更新对应的科室记录 -->
      <div class="input-container">
        <label for="department_id">科室编号：</label><br>
        <input type="number" id="department_id" name="department_id" placeholder="请输入科室编号" value="${hospitalDetail.department_id}">
      </div>

      <div class="input-container">
        <label for="department">科室名称：</label><br>
        <input type="text" id="department" name="department" placeholder="请输入科室名称" value="${hospitalDetail.department}" required><br>
      </div>
      <div class="input-container">
        <label for="department_detail">科室详情：</label><br>
        <textarea id="department_detail" name="department_detail" placeholder="请输入科室详细介绍">${hospitalDetail.department_detail}</textarea><br>
      </div>
      <div class="input-container">
        <button type="submit">保存修改</button>
      </div>
    </form>
  </div>
</div>

<script>
  const form = document.querySelector('form');
  form.addEventListener('submit', function (e) {
    // 简单验证科室名称是否为空，如果为空则阻止表单提交并提示用户
    const departmentInput = document.getElementById('department');
    if (departmentInput.value.trim() === '') {
      alert('科室名称不能为空，请填写完整信息');
      e.preventDefault();
    }
  });
  // 为所有输入框添加获取焦点和失去焦点时的样式变化效果
  const inputs = document.querySelectorAll('input[type="text"], input[type="number"], textarea');
  inputs.forEach(input => {
    input.addEventListener('focus', function () {
      this.style.borderColor = '#007BFF';
    });
    input.addEventListener('blur', function () {
      this.style.borderColor = '#ccc';
    });
  });
</script>
</body>

</html>
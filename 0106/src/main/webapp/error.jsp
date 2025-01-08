<%--
  Created by IntelliJ IDEA.
  User: 方欣渝
  Date: 2025/1/7
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>错误页面</title>
  <style>
    body {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
      background: linear-gradient(to bottom, #87CEEB, #00BFFF); /* 渐变色背景 */
      background-size: cover;
      background-position: center;
      background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
      font-family: '微软雅黑', Arial, sans-serif; /* 字体样式 */
    }
    .error-container {
      text-align: center;
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.8); /* 半透明背景 */
      border-radius: 10px; /* 圆角效果 */
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2); /* 阴影效果 */
    }
    .error-icon {
      font-size: 48px;
      color: red;
      margin-bottom: 10px;
    }
    .error-message {
      color: red;
      font-size: 18px;
      margin-bottom: 20px;
    }
    .button {
      padding: 10px 20px;
      background-color: #007BFF;
      color: white;
      border: none;
      cursor: pointer;
      font-size: 16px;
      border-radius: 5px; /* 圆角效果 */
      transition: background-color 0.3s ease, transform 0.1s ease; /* 动画效果 */
    }
    .button:hover {
      background-color: #0056b3;
      transform: translateY(-2px); /* 鼠标悬停时轻微上移 */
    }
  </style>
</head>
<body>
<div class="error-container">
  <div class="error-icon">&#10060;</div> <!-- 错误图标 -->
  <h1>发生错误</h1>
  <div class="error-message">${errorMessage}</div>
  <div>
    <a href="${pageContext.request.contextPath}/edit-doctor">
      <button class="button">返回医生信息管理页面</button>
    </a>
  </div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" width="device-width, initial-scale=1.0">
    <title>系统管理</title>
    <style>
        /* 整体页面布局，使用flex，左右分栏 */
        body {
            display: flex;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(to bottom, #87CEEB, #00BFFF); /* 渐变色背景 */
            background-size: cover;
            background-position: center;
        }

        /* 左侧导航栏样式 */
        .left-nav {
            width: 200px;
            background-color: rgba(255, 255, 255, 0.8); /* 半透明背景 */
            padding: 15px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2); /* 阴影效果 */
        }

        /* 导航栏按钮样式 */
        .left-nav button {
            display: block;
            width: 100%;
            padding: 10px 15px;
            margin-bottom: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px; /* 圆角效果 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 阴影效果 */
        }

        .left-nav button:hover {
            background-color: #0056b3;
        }

        /* 右侧内容区域样式 */
        .right-content {
            flex: 1;
            padding: 15px;
            overflow-y: auto; /* 当内容超出时出现滚动条 */
            background-color: rgba(255, 255, 255, 0.9); /* 半透明背景 */
            box-shadow: -2px 0 5px rgba(0, 0, 0, 0.2); /* 阴影效果 */
        }
    </style>
</head>

<body>
<!-- 左侧导航栏 -->
<div class="left-nav">
    <button type="button" onclick="window.location.href='http://localhost:8080/0106/edit-department'">科室信息管理</button>
    <button type="button" onclick="window.location.href='http://localhost:8080/0106/edit-doctor'">医生信息管理</button>
    <button type="button" onclick="window.location.href='http://localhost:8080/0106/edit-register'">挂号信息管理</button>
    <button type="button" onclick="window.location.href='http://localhost:8080/0106/loginAdmin.jsp'">退出系统</button>
</div>
<!-- 右侧内容区域 -->
<div class="right-content">
    <!-- 可添加具体要显示的内容相关代码 -->
</div>
</body>

</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>厦门曙光医院线上挂号系统 - 系统管理</title>
    <style>
        /* 全局样式重置，去除浏览器默认的一些边距和内边距等 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            /* 设置body的最小高度为100vh，确保能撑满整个视口高度 */
            min-height: 100vh;
            /* 使用flex布局 */
            display: flex;
            /* 主轴方向为列，即垂直排列元素 */
            flex-direction: column;
            /* 主轴对齐方式为居中 */
            justify-content: center;
            /* 交叉轴对齐方式为居中 */
            align-items: center;
            /* 背景相关设置保持不变 */
            background-image: url('https://dsboss.nbwbwx.com//2022/06/11/12807588487936588.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif; /* 设置通用字体 */
        }

        h1 {
            /* 增大标题字体大小，调整颜色，添加文字阴影 */
            font-size: 36px;
            color: #fff;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            margin-bottom: 30px;
        }

        /* 按钮通用样式 */
        button {
            padding: 12px 20px; /* 增大内边距 */
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px; /* 添加圆角效果 */
            transition: background-color 0.3s ease; /* 过渡效果，鼠标悬停时背景色变化更平滑 */
        }

        button:hover {
            background-color: #0056b3;
        }

        .btn-group {
            margin-top: 15px;
            display: flex; /* 使用flex布局，让按钮水平排列 */
            justify-content: center; /* 水平居中对齐按钮 */
            gap: 15px; /* 按钮之间添加间隔 */
        }

        .input-group {
            margin-bottom: 15px;
            position: relative; /* 相对定位，用于后面输入框聚焦时的样式调整 */
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #005efd; /* 调整标签文字颜色为白色，使其在背景图上更清晰 */
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            opacity: 0.8; /* 适当提高透明度，让输入框更清晰可见 */
            border: none;
            border-bottom: 2px solid #ccc; /* 底部边框样式 */
            background-color: rgba(255, 255, 255, 0.2); /* 半透明背景色 */
            border-radius: 3px; /* 输入框添加圆角效果 */
            transition: border-bottom-color 0.3s ease; /* 过渡效果，聚焦时边框颜色变化更平滑 */
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-bottom-color: #007BFF; /* 输入框聚焦时改变底部边框颜色 */
            outline: none; /* 去除默认的聚焦外边框 */
        }

        /* 为登录弹出框添加过渡效果相关样式 */
        .login-popup {
            position: fixed; /* 固定定位，使其在页面上弹出来时覆盖其他内容 */
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%); /* 居中显示弹出框 */
            background-color: rgb(255, 255, 255); /* 背景*/
            padding: 30px;
            border-radius: 10px; /* 弹出框添加圆角效果 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* 添加阴影效果 */
            width: 300px;
            z-index: 999; /* 设置较高的层级，确保弹出框在最上层显示 */
            opacity: 0; /* 初始透明度为0，隐藏状态 */
            transition: opacity 0.3s ease; /* 添加透明度过渡效果 */
        }

        /* 定义显示状态的类名对应的样式 */
        .visible {
            opacity: 1; /* 显示时透明度为1 */
        }
        .hidden {
            display: none;
        }

        .btn-group-login {
            display: flex;
            flex-direction: column; /* 将按钮排列方向改为垂直方向，使其上下排列 */
            align-items: center; /* 水平方向居中对齐按钮，让按钮在弹出框内水平居中显示 */
            gap: 10px; /* 按钮之间添加适当间隔 */
        }

        /* 登录表单内的按钮样式微调 */
        #loginForm button {
            margin-top: 20px;
            width: 100%;
        }
        /* 定义错误提示信息的样式，设置为红色字体 */
        .error-message {
            color: red;
            margin-bottom: 10px;
            text-align: center;
        }
    </style>
</head>

<body>
<h1>欢迎来到厦门曙光医院线上挂号系统</h1>
<form action="${pageContext.request.contextPath}/welcome/login" method="post">
    <div class="btn-group">
        <button type="button" onclick="window.location.href='information.jsp'">预约挂号</button>
        <button type="button" onclick="showLoginPopup()">系统管理</button>
    </div>
    <div id="loginPopup" class="login-popup hidden">
        <form id="loginForm" action="${pageContext.request.contextPath}/welcome/login" method="post">
            <c:if test="${not empty errorMessage}">
                <div class="error-message">${errorMessage}</div>
            </c:if>
            <div class="input-group">
                <label for="username">用户名:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">密码:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="btn-group-login">
                <button type="submit">登录</button>
                <button type="button" onclick="hideLoginPopup()">取消</button>
            </div>


        </form>
    </div>
</form>
<script>
    function showLoginPopup() {
        document.getElementById('loginPopup').classList.remove('hidden');
        document.getElementById('loginPopup').classList.add('visible');
    }
    function hideLoginPopup() {
        document.getElementById('loginPopup').classList.remove('visible');
        document.getElementById('loginPopup').classList.add('hidden');
    }
</script>
</body>

</html>
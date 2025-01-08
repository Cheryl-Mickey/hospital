<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>医生信息管理</title>
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

        table {
            border-collapse: collapse;
            width: 100%;
            border: 1px solid #ddd; /* 表格边框 */
        }


        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
            background-color: #f9f9f9; /* 表格背景色 */
        }

        th {
            background-color: #007BFF; /* 标题行背景色 */
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2; /* 条纹背景色 */
        }


        form {
            margin-bottom: 15px;
        }

        input[type="text"],
        input[type="number"] {
            padding: 5px;
            margin-right: 5px;
            border: 1px solid #ddd;
            border-radius: 5px; /* 圆角效果 */
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1); /* 阴影效果 */
        }

        button {
            padding: 5px 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px; /* 圆角效果 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 阴影效果 */
            transition: background-color 0.3s ease; /* 动画效果 */
        }

        button:hover {
            background-color: #0056b3;
        }

        /* 新增的加载提示样式 */
        .loading {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 20px;
            z-index: 9999;
        }

        /* 错误提示信息样式，新增部分，用于显示后端返回的错误消息 */
        .error-message {
            color: red;
            margin-bottom: 10px;
        }
        /* 分页导航栏样式 */
        .pagination {
            margin-top: 15px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .pagination button {
            margin: 0 5px;
            padding: 5px 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px; /* 圆角效果 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 阴影效果 */
        }

        .pagination button:hover {
            background-color: #0056b3;
        }

        .pagination span {
            margin: 0 5px;
            color: #333;
        }

        /* 模态框样式 */
        .modal {
            display: none;
            position: fixed;
            z-index: 10000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
            border-radius: 10px; /* 圆角效果 */
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3); /* 阴影效果 */
            animation: fadeIn 0.5s ease; /* 动画效果 */
            text-align: center; /* 添加文本居中对齐 */
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }


        .modal form {
            margin-bottom: 0;
        }

        .modal input[type="text"],
        .modal input[type="number"] {
            padding: 5px;
            margin-right: 5px;
            margin-bottom: 10px;
            border:1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .modal textarea {
            margin-bottom: 10px;
        }

        .modal button {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<!-- 左侧导航栏 -->
<div class="left-nav">
    <button type="button" onclick="window.location.href='edit-department'">科室信息管理</button>
    <button type="button" onclick="window.location.href='edit-doctor'">医生信息管理</button>
    <button type="button" onclick="window.location.href='edit-register'">挂号信息管理</button>
    <button type="button" onclick="window.location.href='login.jsp'">退出系统</button>
</div>
<!-- 右侧内容区域 -->
<div class="right-content">
    <div id="loading" class="loading">加载中...</div>
    <div id="page-content">
        <!-- 显示后端返回的错误消息 -->
        <c:if test="${not empty errorMessage}">
            <div class="error-message">${errorMessage}</div>
        </c:if>
        <!-- 显示医生信息表格 -->
        <h2>医生信息列表</h2>
        <table id="doctorTable">
            <thead>
            <tr>
                <th>医生编号</th>
                <th>科室编号</th>
                <th>医生姓名</th>
                <th>医生性别</th>
                <th>医生照片</th>
                <th>主治症状介绍</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="doctor" items="${doctors}">
                <tr>
                    <td>${doctor.doctorId}</td>
                    <td>${doctor.departmentId}</td>
                    <td>${doctor.doctorName}</td>
                    <td>${doctor.doctorSex}</td>
                    <td>
                        <img src="${doctor.doctorPicture}" alt="医生照片" style="width: 100px; height: auto;">
                    </td>
                    <td>${doctor.doctorSkill}</td>
                    <td>
                        <button onclick="editDoctor('${doctor.doctorId}')">编辑</button>
                        <button onclick="deleteDoctor('${doctor.doctorId}')">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <!-- 新增分页导航栏 -->
        <div class="pagination">
            <c:if test="${pageNum > 1}">
                <button onclick="goToPage(1)">首页</button>
            </c:if>
            <c:if test="${pageNum > 1}">
                <button onclick="goToPage(${pageNum - 1})">上一页</button>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" var="i">
                <c:if test="${i == pageNum}">
                    <span>${i}</span>
                </c:if>
                <c:if test="${i!= pageNum}">
                    <button onclick="goToPage(${i})">${i}</button>
                </c:if>
            </c:forEach>
            <c:if test="${pageNum < totalPages}">
                <button onclick="goToPage(${pageNum + 1})">下一页</button>
            </c:if>
            <c:if test="${pageNum < totalPages}">
                <button onclick="goToPage(${totalPages})">末页</button>
            </c:if>
        </div>

        <!-- 新增医生信息按钮，点击弹出模态框 -->
        <button id="addDoctorBtn" onclick="openModal()">新增医生信息</button>

        <!-- 模态框（新增医生信息表单所在容器） -->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2>新增医生信息</h2>
                <form action="${pageContext.request.contextPath}/edit-doctor/add" method="post">
                    <div class="input-container">
                        <input type="number" name="doctor_id" placeholder="医生编号" required>
                    </div>
                    <div class="input-container">
                        <input type="number" name="department_id" placeholder="科室编号" required>
                    </div>
                    <div class="input-container">
                        <input type="text" name="doctor_name" placeholder="医生姓名" required>
                    </div>
                    <div class="input-container">
                        <input type="text" name="doctor_sex" placeholder="医生性别">
                    </div>
                    <div class="input-container">
                        <input type="text" name="doctor_picture" placeholder="医生照片文件地址">
                    </div>
                    <div class="input-container">
                        <textarea name="doctor_skill" placeholder="医生技能"></textarea>
                    </div>
                    <div class="input-container">
                        <button type="submit">新增</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function showLoading() {
        document.getElementById('loading').style.display = 'flex';
    }

    function hideLoading() {
        document.getElementById('loading').style.display = 'none';
    }

    function editDoctor(doctorId) {
        window.location.href = 'EditDoctorDetail.jsp?doctorId=' + doctorId;
    }

    function deleteDoctor(doctorId) {
        if (confirm("确认删除医生ID为 " + doctorId + " 的信息吗？")) {
            showLoading();
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    hideLoading();
                    window.location.reload();
                }
            };
            xhr.open("POST", '${pageContext.request.contextPath}/edit-doctor/delete/' + doctorId, true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send();
        }
    }
    function goToPage(page) {
        window.location.href = 'edit-doctor?pageNum=' + page;
    }
    // 打开模态框函数
    function openModal() {
        document.getElementById('myModal').style.display = "block";
    }

    // 关闭模态框函数
    function closeModal() {
        document.getElementById('myModal').style.display = "none";
    }
</script>
</body>
</html>
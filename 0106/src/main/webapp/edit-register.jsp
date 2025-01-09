<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" width="device-width, initial-scale=1.0">
    <title>挂号信息管理</title>
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
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        form {
            margin-bottom: 15px;
        }

        input[type="text"],
        input[type="number"] {
            padding: 5px;
            margin-right: 5px;
        }

        button {
            padding: 5px 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
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
        <!-- 显示挂号信息表格 -->
        <h2>挂号信息列表</h2>
        <table id="doctorTable">
            <thead>
            <tr>
                <th>病人编号</th>
                <th>医生编号</th>
                <th>医生姓名</th>
                <th>科室编号</th>
                <th>就诊日期</th>
                <th>挂号状态</th>
                <th>更新状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <!-- 遍历从后端传递过来的挂号信息列表并展示 -->
            <c:forEach items="${registers}" var="register">
                <tr>
                    <td>${register.patient_id}</td>
                    <td>${register.doctor_id}</td>
                    <td>${register.doctor_name}</td>
                    <td>${register.department_id}</td>
                    <td>${register.register_date}</td>
                    <td>${register.register_status}</td>
                    <td>
                        <select name="update_status" id="status-${register.patient_id}-${register.doctor_id}">
                            <option value="已预约" ${register.register_status == '已预约' ? 'selected' : ''}>已预约</option>
                            <option value="已就诊" ${register.register_status == '已就诊' ? 'selected' : ''}>已就诊</option>
                        </select>
                    </td>
                    <td>
                        <button onclick="updateRegisterStatus('${register.patient_id}','${register.doctor_id}')">更新状态</button>
                        <button onclick="deleteRegister('${register.patient_id}','${register.doctor_id}')">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>


    </div>
</div>

<script>
    function loadPage(pageUrl) {
        // 显示加载提示
        document.getElementById('loading').style.display = 'flex';
        // 使用AJAX获取页面内容并加载到右侧区域
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 隐藏加载提示
                document.getElementById('loading').style.display = 'none';
                document.getElementById('page-content').innerHTML = xhr.responseText;
            }else if (xhr.readyState === 4) {
                alert('请求失败，请检查网络或联系管理员');
            }
        };
        xhr.open("GET", pageUrl, true);
        xhr.send();
    }

    function updateRegisterStatus(patientId,doctorId) {
        var status = document.getElementById('status-' + patientId + '-'+doctorId).value;
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                alert('挂号状态更新成功');
                window.location.reload(); // 刷新页面以显示最新状态
            }else if (xhr.readyState === 4) {
                alert('请求失败，请检查网络或联系管理员');
            }
        };
        xhr.open("POST", "${pageContext.request.contextPath}/edit-register/update-status", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        // xhr.send("patientId=" + patientId + "&registerStatus=" + encodeURIComponent(status));
        // 发送请求，包含要更新的病人ID、医生ID和挂号状态
        xhr.send("patientId=" + patientId + "&doctorId=" + doctorId + "&registerStatus=" + encodeURIComponent(status));
    }
    function showLoading() {
        document.getElementById('loading').style.display = 'flex';
    }

    function hideLoading() {
        document.getElementById('loading').style.display = 'none';
    }
    function deleteRegister(patientId,doctorId) {
        if (isNaN(patientId) || isNaN(doctorId)) {
            alert("病人编号和医生编号必须为数字，请检查！");
            return;
        }
        if (confirm("确认删除病人ID为"+patientId+",医生ID为 " + doctorId + " 的信息吗？")) {
            showLoading();
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    hideLoading();
                    window.location.reload();
                }
            };
            xhr.open("POST", '${pageContext.request.contextPath}/edit-register/delete/' + patientId + '/' + doctorId, true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send();
        }
    }
</script>
</body>

</html>
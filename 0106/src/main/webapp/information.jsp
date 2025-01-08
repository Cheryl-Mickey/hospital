<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>医院信息</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .header {
            background-color: #f4f4f4;
            padding: 20px;
            text-align: center;
        }
        .hospital-info {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #ddd;
        }
        .hospital-photo img {
            max-width: 200px;
            height: auto;
            margin-bottom: 10px;
        }
        .hospital-details {
            text-align: center;
        }
        .search-container {
            text-align: center;
            padding: 20px;
        }
        .search-input {
            width: 300px;
            padding: 10px;
            margin-right: 10px;
        }
        .departments {
            padding: 20px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .department-section {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 200px;
        }
        .department-section h3 {
            margin-top: 0;
        }
        .department-list {
            list-style-type: none;
            padding: 0;
        }
        .department-list li {
            margin: 5px 0;
        }
        .department-list a {
            text-decoration: none;
            color: #007BFF;
            transition: color 0.3s;
        }
        .department-list a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>欢迎来到厦门曙光医院</h1>
</div>

<div class="hospital-info">
    <div class="hospital-photo">
        <img src="https://tse3-mm.cn.bing.net/th/id/OIP-C.8YkQR4KGVQyHH6pZXRv9BwHaFi?rs=1&pid=ImgDetMain" alt="医院照片">
    </div>
    <div class="hospital-details">
        <h2>厦门曙光医院</h2>
        <p>地址：厦门市集美区111路111号</p>
        <p>电话：123456</p>
        <p>简介：厦门曙光医院是一家集医疗、教学、科研为一体的现代化综合性医院。</p>
    </div>
</div>

<div class="search-container">
    <input type="text" id="searchInput" class="search-input" placeholder="请输入搜索内容...">
    <button onclick="performSearch()">院内搜索</button>
</div>

<div class="departments">
    <div class="department-section">
        <h3>内科</h3>
        <ul class="department-list">
            <li><a href="/departments/neurology">心内科</a></li>
            <li><a href="/departments/neurology">神经科</a></li>
        </ul>
    </div>
    <div class="department-section">
        <h3>外科</h3>
        <ul class="department-list">
            <li><a href="/departments/surgery">基本外科</a></li>
            <li><a href="/departments/cardiac-surgery">心外科</a></li>
        </ul>
    </div>
    <div class="department-section">
        <h3>儿科</h3>
        <ul class="department-list">
            <li><a href="/departments/pediatrics">儿科</a></li>
        </ul>
    </div>
    <div class="department-section">
        <h3>妇产科</h3>
        <ul class="department-list">
            <li><a href="/departments/surgery">妇科</a></li>
            <li><a href="/departments/cardiac-surgery">产科</a></li>
        </ul>
    </div>
    <div class="department-section">
        <h3>中医科</h3>
        <ul class="department-list">
            <li><a href="/departments/pediatrics">中医科</a></li>
        </ul>
    </div>
</div>

<script>
    function performSearch() {
        const query = document.getElementById('searchInput').value.toLowerCase();
        const departments = document.querySelectorAll('.department-list');

        departments.forEach(department => {
            const items = department.getElementsByTagName('li');
            let found = false;

            Array.from(items).forEach(item => {
                if (item.textContent.toLowerCase().includes(query)) {
                    item.style.display = '';
                    found = true;
                } else {
                    item.style.display = 'none';
                }
            });

            department.parentElement.style.display = found ? '' : 'none';
        });
    }
</script>

</body>
</html>
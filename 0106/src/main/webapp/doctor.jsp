<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>医生信息</title>
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
        .doctor-info {
            display: flex;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #ddd;
        }
        .doctor-photo img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 20px;
        }
        .doctor-details {
            text-align: left;
        }
        .doctor-name {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .doctor-specialty {
            font-size: 18px;
            color: #555;
            margin-bottom: 10px;
        }
        .doctor-description {
            font-size: 14px;
            color: #777;
        }
        .appointment-container {
            padding: 20px;
            text-align: center;
        }
        .appointment-button {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .appointment-button:hover {
            background-color: #0056b3;
        }
        .appointment-form {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }
        .form-content {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: left;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group button {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
        .cancel-button {
            background-color: #dc3545;
            margin-left: 10px;
        }
        .cancel-button:hover {
            background-color: #c82333;
        }
        .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: transparent;
            border: none;
            color: #aaa;
            font-size: 20px;
            cursor: pointer;
        }
        .close-button:hover {
            color: #000;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>医生信息</h1>
</div>

<div class="doctor-info">
    <div class="doctor-photo">
        <img src="https://pic.52112.com/180402/180402_65/gbYqiCStTm_small.jpg" alt="医生照片">
    </div>
    <div class="doctor-details">
        <div class="doctor-name">张医生</div>
        <div class="doctor-specialty">心内科专家</div>
        <div class="doctor-description">张医生是一位经验丰富的心内科专家，专注于心脏病的诊断和治疗。</div>
    </div>
</div>

<div class="appointment-container">
    <button class="appointment-button" onclick="showForm()">在线预约</button>
</div>

<div class="appointment-form" id="appointmentForm">
    <div class="form-content">
        <span class="close-button" onclick="hideForm()">&times;</span>
        <h2>在线预约</h2>
        <form>
            <div class="form-group">
                <label for="hospital">就诊医院</label>
                <input type="text" id="hospital" name="hospital" value="厦门曙光医院" readonly>
            </div>
            <div class="form-group">
                <label for="department">所挂科室</label>
                <input type="text" id="department" name="department" value="心内科" readonly>
            </div>
            <div class="form-group">
                <label for="doctor">就诊医生</label>
                <input type="text" id="doctor" name="doctor" value="张医生" readonly>
            </div>
            <div class="form-group">
                <label for="name">姓名</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="idCard">身份证号</label>
                <input type="text" id="idCard" name="idCard" required>
            </div>
            <div class="form-group">
                <label for="contact">联系方式</label>
                <input type="tel" id="contact" name="contact" required>
            </div>
            <div class="form-group">
                <label for="date">预约日期</label>
                <input type="date" id="date" name="date" required>
            </div>
            <div class="form-group">
                <label for="time">预约时间</label>
                <input type="time" id="time" name="time" required>
            </div>
            <div class="form-group">
                <label for="amount">就诊金额</label>
                <input type="number" id="amount" name="amount" step="0.01" required>
            </div>
            <div class="form-group">
                <button type="submit">提交预约</button>
                <button type="button" class="cancel-button" onclick="hideForm()">退出预约</button>
            </div>
        </form>
    </div>
</div>

<script>
    function showForm() {
        document.getElementById('appointmentForm').style.display = 'flex';
    }

    function hideForm() {
        document.getElementById('appointmentForm').style.display = 'none';
    }
</script>

</body>
</html>

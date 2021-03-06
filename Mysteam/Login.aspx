﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
	<input id="UserName" type="text" placeholder="在此输入你的用户名">
	<br>
	<br>
	<input id="UserPwd"  type="text" placeholder="在此输入你的密码">
	<br>
	<br>
	<button id="Login">登录</button>
    <!-- Latest jQuery form server -->
    <script src="https://code.jquery.com/jquery.min.js"></script>

    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>

    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>

    <!-- Main Script -->
    <script src="js/main.js"></script>
    <!--</form>-->
    <script type='text/javascript'>
        jQuery(document).ready(function ($) {

            $('#Login').click(function () {


                var user_name = $('#UserName').val();
                var user_pwd = $('#UserPwd').val();
              
                /*后台：新建CheckLoginHandler.ashx，
（1）获取提交的UserId和UserPwd
（2）设置返回变量msg
（3）调用CustomerFactory类中的GetCustomerByUserId方法，
                如果不能取得Customer对象表示用户名正确错误，设定msg为"userIdError"，
                否则表示用户名正确，在判断Customer对象中的UserPwd属性与用户提交的UserPwd是否一致
                如果不一致，设定msg为"userPwdError"，
                否则设定msg为"ok"，并把Customer对象写入Session。
（4）输出msg变量*/

               $.post(
                    "handles/CheckLoginHandler.ashx",
                    { type: "login", name: user_name, pwd:user_pwd},
                    function (data) {
                        if (data == "userNameError") {
                            alert("用户名错误");
                        }
                        else if (data == "userPwdError")
                        {
                            alert("密码错误");
                        }
                        else {
                            var jsonObj = JSON.parse(data);
                           
                           alert("登录成功!欢迎你，" + jsonObj.UserName + ",您的用户id为" + jsonObj.UserId);
                            window.location .href= "Index.aspx";
                        }
                    }
                );
               
                return false;
            })
        })
    </script>
</body>
</html>

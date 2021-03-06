<%--
  Created by IntelliJ IDEA.
  User: 11873
  Date: 2017/11/5
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录/注册</title>
    <link rel="shortcut icon" href="static/image/favicon.ico">

    <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">
    <link href="static/css/regisiter.css" type="text/css" rel="stylesheet">
</head>
<body>

<div class="container modal-content">
    <div class="center-block">
        <div id="tabs" class="">
            <ul id="login_signup" class="nav nav-tabs">
                <li class="active"><a href="#login" data-toggle="tab">登录</a></li>
                <li><a href="#signup" data-toggle="tab">注册</a></li>
            </ul>
            <div class="login_signup_tabs tab-content">
                <div id="login" class="tab-pane fade in active ">
                    <form action="LoginAction" class="col-lg-5 col-lg-offset-3" method="post">
                        <div class="form-group" id="username">
                            <input required class="form-control input" name="id" id="login_username"
                                   placeholder="学号/教工号"
                                   type="text" maxlength="20">
                        </div>
                        <div class="form-group" id="password">
                            <input required type="password" name="password" class="form-control input"
                                   id="login_password"
                                   placeholder="密码">
                            <a href="#" id="forget_password" class="pull-right">忘记密码</a>
                        </div>
                        <div id="drag" class="center-block hidden"></div>
                        <div class="submit-block">
                            &nbsp;
                            <button type="submit" class="btn btn-default center-block" id="login_submit">提交</button>
                        </div>
                    </form>
                </div>
                <div id="signup" class="tab-pane fade">
                    <form action="RegisterAction" class="col-lg-5 col-lg-offset-3" method="post">
                        <div class="form-group">
                            <input required class="form-control input" name="name" id="signup_username" placeholder="姓名"
                                   type="text" maxlength="20">
                        </div>
                        <div class="form-group">
                            <input required class="form-control input" name="id" id="signup_number" placeholder="学号/教工号"
                                   type="text" maxlength="20">
                            <img src="static/image/load.gif" id="load_img" class="hidden">
                            <span class="hidden important" id="has_id">学号或教工号已存在</span>
                        </div>
                        <div class="form-group">
                            <div class="form-inline">
                                <input required type="password" class="form-control input" name="password"
                                       id="signup_password1"
                                       placeholder="密码">
                                <span class="glyphicon glyphicon-eye-open" id="eye"></span>
                            </div>
                            <span class="hidden important" id="password_message">请输入至少六位密码</span>
                            <div id="level" class="pw-strength hidden">
                                <div class="pw-bar"></div>
                                <div class="pw-bar-on"></div>
                                <div class="pw-txt">
                                    <span>弱</span>
                                    <span>中</span>
                                    <span>强</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input required class="form-control input" name="email" type="email" id="signup_email"
                                   placeholder="邮箱" maxlength="20">
                        </div>
                        <div class="form-group" id="type">
                            <label class="radio-inline col-lg-5 text-center">
                                <input type="radio" name="type" id="student" value="0" checked="checked">学生
                            </label>
                            <label class="radio-inline col-lg-5 text-center">
                                <input type="radio" name="type" id="teacher" value="1">教师
                            </label>
                        </div>
                        <br/>
                        <div class="submit-block">
                            &nbsp;
                            <button type="submit" class="btn btn-default center-block" id="signup_submit">提交</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="static/js/jquery-3.1.1.min.js"></script>
<script src="static/js/regisiter.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script>

    $(function () {
//        登录滑块
        $("#login_password").blur(function () {
            if($("#login_username").val()!=''&&$("#login_password").val()!=''){
                $("#drag").removeClass("hidden");
            }
        });
        $('#drag').drag();
    });
    $(function () {
//        验证ID是否存在
        $("#signup_number").blur(function(){
            if($(this).val()!=''){
                $("#load_img").removeClass("hidden");
                $.post("VerifyIdAction",{
                    Id:$("#signup_number").val()
                },function(data,textStatus){
                    if(data.verifyId==0){
                        $("#has_id").addClass("hidden");
                    }else{
                        $("#has_id").removeClass("hidden");
                        $("#signup_submit").attr({"disabled": "disabled"});
                    }
                    $("#load_img").addClass("hidden");
                })
            }
            else{
                $("#load_img").addClass("hidden")
            }
        });
    });

    $(function () {
//        密码判断
        var $password=$("#signup_password1");
        var $msg=$("#password_message");
        var $level=$("#level");
        $password.blur(function () {
            if ($(this).val().length < 6) {
                $msg.removeClass("hidden");
            }
            else {
                $msg.addClass("hidden");
            }
            $level.addClass("hidden");
        });
        $password.focus(function () {
            $level.removeClass("hidden");
        });
        $password.keyup(function () {
            var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
            var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
            var enoughRegex = new RegExp("(?=.{6,}).*", "g");

            var $signup_submit=$("#signup_submit");
            if (false == enoughRegex.test($(this).val())) {
                $level.removeClass('pw-weak');
                $level.removeClass('pw-medium');
                $level.removeClass('pw-strong');
                $level.addClass(' pw-defule');
                $signup_submit.attr({"disabled": "disabled"});
                //密码小于六位的时候，密码强度图片都为灰色
            }
            else if (strongRegex.test($(this).val())) {
                $level.removeClass('pw-weak');
                $level.removeClass('pw-medium');
                $level.removeClass('pw-strong');
                $level.addClass(' pw-strong');
                $signup_submit.removeAttr("disabled");
                //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强
            }
            else if (mediumRegex.test($(this).val())) {
                $level.removeClass('pw-weak');
                $level.removeClass('pw-medium');
                $level.removeClass('pw-strong');
                $level.addClass(' pw-medium');
                $signup_submit.removeAttr("disabled");
                //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等
            }
            else {
                $level.removeClass('pw-weak');
                $level.removeClass('pw-medium');
                $level.removeClass('pw-strong');
                $level.addClass('pw-weak');
                $signup_submit.removeAttr("disabled");
                //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的
            }
            return true;
        });
    });
</script>
</body>
</html>

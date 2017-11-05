<%--
  Created by IntelliJ IDEA.
  User: 11873
  Date: 2017/11/5
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>请求预约</title>

    <!--bootstrap 和 jquery,jquery-ui 引入-->
    <link href="static/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/main.css" type="text/css" rel="stylesheet">
    <link href="static/css/jquery-ui.min.css" type="text/css" rel="stylesheet">

    <!--nifty 动态弹出框引入-->
    <link rel="stylesheet" type="text/css" href="static/niftyModal/css/component.css" />
    <script src="static/niftyModal/js/modernizr.custom.js"></script>

    <!--临时css设置-->
    <style>
        #left{
            position: fixed;
            margin-left:-7%;
            padding-top:40px;
            padding-bottom:40px;
        }
    </style>
</head>
<body background="static/image/681662.jpg">
<div class="md-modal md-effect-1" id="modal-1">
    <div class="md-content">
        <h3>确认取消预约</h3>
        <div class="text-center">
            <p>确认请求取消8:00-8:30预约？</p>
            <a class="btn btn-default" href="request_order.html">确认</a>
            <a class="md-close btn btn-default">取消</a>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-lg-2 modal-content" id="left">
            <img src="static/image/yellow_people.jpg" class="img-responsive"><br/>
            <span>张三</span><br/>
            <span>1150310604</span><br/>
            <span>女</span><br/>
            <span>计算机科学与技术学院</span><br/>
            <span>1171163631@qq.com</span><br/>
            <span>155044661873</span><br/>
            <p>个人简介:</p>
            <span>力支持舰队开发地方看到看到房价肯定</span><br/><br/>
            <p id="follow">关注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-star-empty"></span></p>
            <p id="followed">取消关注 <span class="glyphicon glyphicon-star"></span></p>
        </div>
        <div class="col-lg-11 modal-content col-lg-offset-2">
            <br/><br/>
            <div class="col-lg-4 col-lg-offset-3 input-group">
                <input type="date" class="form-control input-lg" placeholder="请选择时间"/><span class="input-group-btn">
                <button class="btn btn-default" type="button" id="date_button">确认</button>
            </span>
            </div>
            <div id="2">
                <table class="table table-striped table-hover" >
                    <caption class="text-center">2017-9-9</caption>
                    <thead style="display:block;border-bottom:1px solid #eee;">
                    <tr>
                        <th>时间段</th>
                        <th>预约状态</th>
                        <th>预约地点</th>
                        <th>教师姓名</th>
                        <th>教师联系方式</th>
                        <th>预约主题</th>
                        <th>操作</th>
                        <th>发布</th>
                    </tr>
                    </thead>
                    <tbody style="display:block;overflow-y: scroll;" id="request_table">
                    <tr>
                        <td>8:00-8:30</td>
                        <td>未预约</td>
                        <td>综合楼</td>
                        <td>李志琛</td>
                        <td>18845897065</td>
                        <td>机器学习</td>
                        <td><a class=" md-trigger btn btn-default" data-modal="modal-1">取消预约</a></td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox">
                            </label>
                        </div></td>
                    </tr>
                    <tr>
                        <td>8:30-9:00</td>
                        <td>未预约</td>
                        <td>综合楼</td>
                        <td>李志琛</td>
                        <td>18845897065</td>
                        <td>机器学习</td>
                        <td><a class="btn btn-default md-trigger" data-toggle="modal-2">取消预约</a></td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox">
                            </label>
                        </div></td>
                    </tr>
                    <tr>
                        <td>9:00-9:30</td>
                        <td>未预约</td>
                        <td>综合楼</td>
                        <td>李志琛</td>
                        <td>18845897065</td>
                        <td>机器学习</td>
                        <td><a class="btn btn-default">取消预约</a></td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox">
                            </label>
                        </div></td>
                    </tr>
                    <tr>
                        <td>9:30-10:00</td>
                        <td>未预约</td>
                        <td>综合楼</td>
                        <td>李志琛</td>
                        <td>18845897065</td>
                        <td>机器学习</td>
                        <td><a class="btn btn-default">取消预约</a></td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox">
                            </label>
                        </div></td>
                    </tr>
                    <tr>
                        <td>10:00-10:30</td>
                        <td>未预约</td>
                        <td>综合楼</td>
                        <td>李志琛</td>
                        <td>18845897065</td>
                        <td>机器学习</td>
                        <td><a class="btn btn-default">取消预约</a></td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox">
                            </label>
                        </div></td>
                    </tr>
                    <tr>
                        <td>10:30-11:00</td>
                        <td>未预约</td>
                        <td>综合楼</td>
                        <td>李志琛</td>
                        <td>18845897065</td>
                        <td>机器学习</td>
                        <td><a class="btn btn-default">取消预约</a></td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox">
                            </label>
                        </div></td>
                    </tr>
                    <tr>
                        <td>11:00-11:30</td>
                        <td>未预约</td>
                        <td>综合楼</td>
                        <td>李志琛</td>
                        <td>18845897065</td>
                        <td>机器学习</td>
                        <td><a class="btn btn-default">取消预约</a></td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox">
                            </label>
                        </div></td>
                    </tr>
                    <tr>
                        <td>11:30-12:00</td>
                        <td>未预约</td>
                        <td>综合楼</td>
                        <td>李志琛</td>
                        <td>18845897065</td>
                        <td>机器学习</td>
                        <td><a class="btn btn-default">取消预约</a></td>
                        <td><div class="checkbox">
                            <label>
                                <input type="checkbox">
                            </label>
                        </div></td>
                    </tr>
                    </tbody>
                </table>
                <button class="btn btn-lg btn-primary pull-right">请求预约</button>
            </div>
        </div>
    </div>
</div>
<div class="md-overlay"></div>
<!--jquery bootstrap jquery-ui js文件引入-->
<script src="static/js/jquery-3.1.1.min.js"></script>
<script src="static/bootstrap/js/bootstrap.min.js"></script>
<script src="static/js/jquery-ui.min.js"></script>
<!--niftyModal js文件引入及必要操作-->
<script src="static/niftyModal/js/classie.js"></script>
<script src="static/niftyModal/js/modalEffects.js"></script>
<script>
    var polyfilter_scriptpath = '/js/';
</script>
<script src="static/niftyModal/js/css-filters-polyfill.js"></script>
<!--自己的js-->
<script>
    var follow=true;
    $(document).ready(function(){
        $("#request_table").css("max-height",$(window).height()*0.6);
        if(follow==true){
            $("#follow").addClass("hidden");
            $("#followed").removeClass("hidden");
        }
        else{
            $("#follow").removeClass("hidden");
            $("#followed").addClass("hidden");
        }
        var _width=$('#2').width();
        var table_th=$("#2 th");
        var table_td=$("#2 td");
        table_th.eq(0).width(_width*0.11);
        table_td.eq(0).width(_width*0.11);
        table_th.eq(1).width(_width*0.1);
        table_td.eq(1).width(_width*0.1);
        table_th.eq(2).width(_width*0.1);
        table_td.eq(2).width(_width*0.1);
        table_th.eq(3).width(_width*0.08);
        table_td.eq(3).width(_width*0.08);
        table_th.eq(4).width(_width*0.12);
        table_td.eq(4).width(_width*0.12);
        table_th.eq(5).width(_width*0.25);
        table_td.eq(5).width(_width*0.25);
        table_th.eq(6).width(_width*0.05);
        table_td.eq(6).width(_width*0.05);
        table_th.eq(7).width(_width*0.05);
        table_td.eq(7).width(_width*0.05);
    });
    $("#follow").click(function(){
        $(this).addClass("hidden");
        $("#followed").removeClass("hidden");
    });
    $("#followed").click(function(){
        $(this).addClass("hidden");
        $("#follow").removeClass("hidden");
    });
</script>
</body>
</html>
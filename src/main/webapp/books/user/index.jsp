<%@page import="com.cya.dao.NoticeDao,com.cya.pojo.Notice" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.cya.pojo.Admin,com.cya.dao.AdminDao" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>图书管理-用户系统</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/books/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/books/css/bootstrap-theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/books/css/bootstrap-admin-theme.css">
    <script src="${pageContext.request.contextPath}/books/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/books/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/books/js/bootstrap-dropdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/books/js/reader.js"></script>

    <script src="${pageContext.request.contextPath}/books/js/readerUpdateInfo.js"></script>
    <script src="${pageContext.request.contextPath}/books/js/readerUpdatePwd.js"></script>
    <script src="${pageContext.request.contextPath}/books/js/index.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/books/css/index.css"/>
</head>

<body>

<%@include file="user-head.jsp"%>
<div class="body">
    <div class="content">
        <%@include file="../bulletin_board/user_gongGao.jsp" %>
        <div class="left">
            <div class="container">

                <div class="row">


                    <div class="col-md-10">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="text-muted bootstrap-admin-box-title">图书查询</div>
                                    </div>
                                    <div class="bootstrap-admin-panel-content">
                                        <ul>
                                            <li>根据图书编号、图书名称查询图书信息</li>
                                            <li>可查询图书的编号、名称、分类、作者、价格、在馆数量等</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="text-muted bootstrap-admin-box-title">借阅信息</div>
                                    </div>
                                    <div class="bootstrap-admin-panel-content">
                                        <ul>
                                            <li>可查询除图书的基本信息、借阅日期、截止还书日期、超期天数等</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="text-muted bootstrap-admin-box-title">借阅历史</div>
                                    </div>
                                    <div class="bootstrap-admin-panel-content">
                                        <ul>
                                            <li>查询自己以往的借阅历史，包括哪些图书等具体信息</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="text-muted bootstrap-admin-box-title">我的</div>
                                    </div>
                                    <div class="bootstrap-admin-panel-content">
                                        <ul>
                                            <li>查看个人资料</li>
                                            <li>修改账户密码</li>
                                            <li>退出系统</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<div class="foot"><label class="lable">获取更多资源请关注公众号：C you again,版权申明：使用请注明原地址</label></div>

<%@include file="../admin/admin_modal.jsp"%>


</body>


</html>
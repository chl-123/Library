<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.cya.pojo.Admin,com.cya.pojo.History,com.cya.dao.AdminDao" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>图书管理-管理员系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<!-- 判断是否已经登录 -->
<%
    Admin admin = new Admin();
    String aid = (String) session.getAttribute("aid");
    if (aid == null || aid.equals("")) {
        //没有登录
        response.sendRedirect("../login.jsp"); //重定向到登录页面
        return;
    } else {
        AdminDao admindao = new AdminDao();
        admin = admindao.get_AidInfo2(aid);
    }

%>
<%@include file="admin_head.jsp"%>
<div class="body">
    <div class="content">
        <%@include file="../bulletin_board/admin_gongGao.jsp" %>
        <div class="left">
            <div class="container">
                <!-- left, vertical navbar & content -->
                <div class="row">

                    <!-- content -->
                    <div class="col-md-10">


                        <div class="row">
                            <div class="col-md-6">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="text-muted bootstrap-admin-box-title">图书管理</div>
                                    </div>
                                    <div class="bootstrap-admin-panel-content">
                                        <ul>
                                            <li>根据图书编号、图书名称查询图书基本信息</li>
                                            <li>添加、修改、删除图书</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="text-muted bootstrap-admin-box-title">图书分类管理</div>
                                    </div>
                                    <div class="bootstrap-admin-panel-content">
                                        <ul>
                                            <li>根据分类名称查询图书分类信息</li>
                                            <li>添加、修改、删除图书分类</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="text-muted bootstrap-admin-box-title">图书借阅</div>
                                    </div>
                                    <div class="bootstrap-admin-panel-content">
                                        <ul>
                                            <li>展示所有正在借阅图书的信息</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="text-muted bootstrap-admin-box-title">图书归还</div>
                                    </div>
                                    <div class="bootstrap-admin-panel-content">
                                        <ul>
                                            <li>展示所有已归还图书的信息</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-6">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="text-muted bootstrap-admin-box-title">公告管理</div>
                                    </div>
                                    <div class="bootstrap-admin-panel-content">
                                        <ul>
                                            <li>向用户发布公告</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="text-muted bootstrap-admin-box-title">读者管理</div>
                                    </div>
                                    <div class="bootstrap-admin-panel-content">
                                        <ul>
                                            <li>根据账号、姓名查询读者基本信息</li>
                                            <li>添加、修改、删除读者信息</li>
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

<%@include file="admin_modal.jsp"%>


</body>


</html>
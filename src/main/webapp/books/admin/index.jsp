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
<div class="head">
    <img class="img" src="${pageContext.request.contextPath}/books/img/title-yellow1.png"></img>
    <div class="userName">
        <a href="${pageContext.request.contextPath}/books/admin/index.jsp"><% out.write(admin.getName());%></a>
    </div>
    <div class="daohang">
        <ul>
            <li style="margin-left: 100px;">
                <a href="${pageContext.request.contextPath}/books/admin/admin_books.jsp">图书管理</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/books/admin/admin_booksType.jsp">图书分类管理</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/books/admin/admin_borrows.jsp">图书借阅信息</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/books/admin/admin_history.jsp">图书归还信息</a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/books/admin/admin_notice.jsp">公告管理</a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/books/admin/admin_users.jsp">读者管理</a>
            </li>

            <li class="dropdown">
                <a href="#" class="" role="button" data-hover="dropdown">我的</a>
                <ul class="dropdown-menu">
                    <li><a href="#updateinfo" data-toggle="modal">个人资料</a></li>
                    <li><a href="#updatepwd" data-toggle="modal">修改密码</a></li>
                    <li><a href="${pageContext.request.contextPath}/ExitServlet?id=<%=aid %>&&status=aid">退出</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<div style="width: 100%;float: left;height: 310px;"></div>
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


<!-------------------------个人资料模糊框------------------------------------->

<form class="form-horizontal" method="post" action="/manage_books/AdminServlet">   <!--保证样式水平不混乱-->
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="updateinfo" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="ModalLabel">
                        个人资料
                    </h4>
                </div>

                <div class="modal-body">

                    <!--正文-->
                    <input type="hidden" name="tip" value="2">
                    <input type="hidden" name="url" value="admin/index">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">真实姓名</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="name" name="name" placeholder="请输入您的真实姓名"
                                   value='<% out.write(admin.getName());%>'>
                            <label class="control-label" for="name" style="display: none"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">手机号</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="请输入您的手机号"
                                   value='<% out.write(admin.getPhone());%>'>
                            <label class="control-label" for="phone" style="display: none"></label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">邮箱</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="email" name="email" placeholder="请输入您的邮箱"
                                   value='<% out.write(admin.getEmail());%>'>
                            <label class="control-label" for="email" style="display: none"></label>
                        </div>
                    </div>

                    <!--正文-->


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        修改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</form>
<!-------------------------------------------------------------->

<!-------------------------------------------------------------->

<form class="form-horizontal" method="post" action="/manage_books/AdminServlet">   <!--保证样式水平不混乱-->
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="updatepwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        修改密码
                    </h4>
                </div>
                <div class="modal-body">

                    <!--正文-->
                    <input type="hidden" name="tip" value="1">
                    <input type="hidden" name="url" value="admin/index">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">原密码</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" name="password" id="oldPwd"
                                   placeholder="请输入原密码">
                            <label class="control-label" for="oldPwd" style="display: none"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">新密码</label>
                        <div class="col-sm-7">
                            <input type="password" class="form-control" name="password2" id="newPwd"
                                   placeholder="请输入新密码">
                            <label class="control-label" for="newPwd" style="display: none"></label>
                        </div>
                    </div>

                    <!--正文-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        修改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</form>
<!-------------------------------------------------------------->


</body>


</html>
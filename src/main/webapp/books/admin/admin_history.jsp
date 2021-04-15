<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page
        import="com.cya.pojo.History,com.cya.dao.AdminDao,com.cya.dao.TypeDao,com.cya.dao.BookDao,com.cya.pojo.Admin" %>
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
                            <div class="col-lg-12">
                                <div class="panel panel-default bootstrap-admin-no-table-panel">
                                    <div class="panel-heading">
                                        <div class="text-muted bootstrap-admin-box-title">图书归还信息</div>
                                    </div>

                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-lg-12">
                                <table id="data_list" class="table table-hover table-bordered" cellspacing="0"
                                       width="100%">
                                    <thead>
                                    <tr>
                                        <th>图书号</th>
                                        <th>图书名称</th>
                                        <th>读者账号</th>
                                        <th>读者名称</th>
                                        <th>借阅日期</th>
                                        <th>还书日期</th>

                                    </tr>
                                    </thead>


                                    <!---在此插入信息-->
                                    <%
                                        ArrayList<History> bookdata = new ArrayList<History>();
                                        bookdata = (ArrayList<History>) request.getAttribute("data");
                                        if (bookdata == null) {
                                            BookDao bookdao = new BookDao();
                                            bookdata = (ArrayList<History>) bookdao.get_HistoryListInfo2(0);
                                        }
                                        for (History bean : bookdata) {
                                    %>
                                    <tbody>
                                    <td><%= bean.getCard() %>
                                    </td>
                                    <td><%= bean.getBookname() %>
                                    </td>
                                    <td><%= bean.getAdminname() %>
                                    </td>
                                    <td><%= bean.getUsername() %>
                                    </td>
                                    <td><%= bean.getBegintime() %>
                                    </td>
                                    <td><%= bean.getEndtime() %>
                                    </td>

                                    </tbody>
                                    <%} %>
                                </table>
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
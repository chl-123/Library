<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page
        import="com.cya.pojo.Notice,com.cya.pojo.Admin,com.cya.pojo.History,com.cya.dao.NoticeDao,com.cya.dao.BookDao,com.cya.dao.AdminDao" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>图书管理系统</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/books/css/index.css"/>
</head>

<body>

<%@include file="user-head.jsp"%>
<div class="body">
    <div class="content">
        <%@include file="../bulletin_board/user_gongGao.jsp" %>
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
                                        <div class="text-muted bootstrap-admin-box-title">借阅记录</div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">

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

                                    <%
                                        ArrayList<History> bookdata = new ArrayList<History>();
                                        bookdata = (ArrayList<History>) request.getAttribute("data");
                                        if (bookdata == null) {
                                            BookDao bookdao = new BookDao();
                                            bookdata = (ArrayList<History>) bookdao.get_HistoryListInfo(0, uid);
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

<%@include file="../admin/admin_modal.jsp"%>


</body>

</html>
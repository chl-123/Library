<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page
        import="com.cya.dao.NoticeDao,com.cya.pojo.Notice,com.cya.pojo.Admin,com.cya.dao.AdminDao,com.cya.pojo.Book,com.cya.dao.BookDao" %>
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
                                        <div class="text-muted bootstrap-admin-box-title">查询</div>
                                    </div>
                                    <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                        <form class="form-horizontal" action="/manage_books/books/admin/displayServlet?action=showInfo"
                                              method="post">
                                            <input type="hidden" name="tip" value="2">
                                            <div class="col-lg-8 form-group">
                                                <label class="col-lg-4 control-label" for="query_bname">图书名称</label>
                                                <div class="col-lg-8">
                                                    <input class="form-control" id="bookName" name="name" type="text"
                                                           value="">
                                                    <label class="control-label" for="query_bname"
                                                           style="display: none;"></label>
                                                </div>
                                            </div>


                                            <div class="col-lg-4 form-group">

                                                <button type="submit" class="btn btn-primary" id="btn_query">查询</button>
                                            </div>
                                        </form>
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
                                        <th>图书类型</th>
                                        <th>图书名称</th>
                                        <th>作者名称</th>
                                        <th>出版社</th>
                                        <th>总数量</th>
                                        <th>操作</th>

                                    </tr>
                                    </thead>


                                    <!---在此插入信息-->
                                    <!---在此插入信息-->
                                    <%
                                        ArrayList<Book> bookdata = new ArrayList<Book>();
                                        bookdata = (ArrayList<Book>) request.getAttribute("data");
                                        if (bookdata == null) {
                                            BookDao bookdao = new BookDao();
                                            bookdata = (ArrayList<Book>) bookdao.get_ListInfo();

                                        }

                                        for (Book bean : bookdata) {
                                    %>

                                    <tbody>
                                    <td><%=bean.getCard() %>
                                    </td>
                                    <td><%=bean.getType() %>
                                    </td>
                                    <td><%=bean.getName() %>
                                    </td>
                                    <td><%=bean.getAutho() %>
                                    </td>
                                    <td><%=bean.getPress() %>
                                    </td>
                                    <td><%=bean.getNum() %>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-info btn-xs" data-toggle="modal"
                                                onclick="borrowbook(<%= bean.getBid() %>)">借阅
                                        </button>
                                    </td>

                                    </tbody>
                                    <%} %>


                                </table>


                            </div>
                        </div>

                        <script type="text/javascript">


                            function borrowbook(bid) {
                                con = confirm("是否借阅?");
                                if (con == true) {
                                    location.href = "/manage_books/books/admin/borrowServlet?action=borrowManage&status=user&tip=1&bid=" + bid;
                                }
                            }
                        </script>
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
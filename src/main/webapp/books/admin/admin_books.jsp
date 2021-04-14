<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page
        import="com.cya.pojo.Type,com.cya.dao.AdminDao,com.cya.dao.TypeDao,com.cya.pojo.Book,com.cya.dao.BookDao,com.cya.pojo.Admin" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/books/css/pagination.css">
    <script src="${pageContext.request.contextPath}/books/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/books/js/jquery.pagination.js"></script>
    <script src="${pageContext.request.contextPath}/books/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/books/js/bootstrap-dropdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/books/js/reader.js"></script>
    <script src="${pageContext.request.contextPath}/books/js/readerUpdateInfo.js"></script>
    <script src="${pageContext.request.contextPath}/books/js/readerUpdatePwd.js"></script>
    <script src="${pageContext.request.contextPath}/books/js/index.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/books/css/index.css"/>
    <script type="text/javascript">
        $(function () {
            initPagination();
        });

        //生成页面导航条
        function initPagination() {
            //获取总记录数
            var totalRecord = "${requestScope.pageInfo.pageTotalCount}";
            //声明一个JSON对象存储Pagination要设置的属性
            var properties = {
                num_edge_entries: 1, //边缘页数
                num_display_entries: 5, //主体页数
                callback: pageselectCallback,
                items_per_page:${requestScope.pageInfo.pageSize},//每页显示页数
                current_page:${requestScope.pageInfo.pageNum - 1},//当前页
                prev_text: "上一页",
                next_text: "下一页"
            };
            //生成页码导航条
            $("#Pagination").pagination(totalRecord, properties)
        }

        //用户点击“1,2.3”这样的页码时调用这个函数实现页面跳转
        function pageselectCallback(pageIndex, JQuery) {
            var pageNum = pageIndex + 1;
            window.location.href = "/manage_books/books/admin/displayServlet?action=getBookPage" +
                "" +
                "" +
                "&pageNum=" + pageNum;
            //由于每一个页码按钮都是超链接，所以在这个函数最后取消超链接的默认行为
            return false;
        }
    </script>
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
                                        <div class="text-muted bootstrap-admin-box-title">查询</div>
                                    </div>
                                    <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                        <form class="form-horizontal"
                                              action="${pageContext.request.contextPath}/selectServlet" method="post">
                                            <input type="hidden" name="tip" value="1">
                                            <div class="col-lg-7 form-group">
                                                <label class="col-lg-4 control-label" for="query_bname">图书名称</label>
                                                <div class="col-lg-8">
                                                    <input class="form-control" id="bookName" name="name" type="text"
                                                           value="">
                                                    <label class="control-label" for="query_bname"
                                                           style="display: none;"></label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 form-group">

                                                <button type="submit" class="btn btn-primary" id="btn_query" onclick="">
                                                    查询
                                                </button>
                                            </div>
                                            <div class="col-lg-3 form-group">

                                                <button type="button" class="btn btn-primary" id="btn_add"
                                                        data-toggle="modal"
                                                        data-target="#addBooksModal">添加图书
                                                </button>
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

                                    <tbody>
                                    <%--实现呈现表格--%>
                                    <c:if test="${empty requestScope.pageInfo.items}">
                                        <tr>
                                            <td colspan="6" align="center">抱歉！沒有查到你要的数据</td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${!empty requestScope.pageInfo.items}">
                                        <c:forEach items="${requestScope.pageInfo.items}" var="books" varStatus="myStatus">
                                            <tr>
                                                <td>${books.card}</td>
                                                <td>${books.type}</td>
                                                <td>${books.name}</td>
                                                <td>${books.autho}</td>
                                                <td>${books.press}</td>
                                                <td>${books.num}</td>
                                                <td>
                                                    <button type="button" class="btn btn-warning btn-xs" data-toggle="modal"
                                                            data-target="#updateBooksModal"
                                                            id="btn_update"
                                                            onclick="showInfo2('${books.bid}','${books.card}','${books.type}','${books.name}'
                                                                    ,'${books.autho}','${books.press}','${books.num}')">
                                                        修改
                                                    </button>
                                                    <button type="button" class="btn btn-danger btn-xs"
                                                            onclick="deletebook(${books.bid})">删除
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>

                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="7" align="center">
                                            <div id="Pagination" class="pagination"><!-- 这里显示分页 --></div>
                                        </td>
                                    </tr>

                                    </tfoot>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
                <script type="text/javascript">
                    function showInfo2(bid, card, type, name, autho, press, num) {
                        document.getElementById("updateISBN").value = card;
                        document.getElementById("updateBookName").value = name;
                        document.getElementById("updateAutho").value = autho;
                        document.getElementById("updatePress").value = press;
                        document.getElementById("updateBookType").value = type;
                        document.getElementById("updateNum").value = num;
                        document.getElementById("updateBookId").value = bid;
                    }

                    function deletebook(bid) {
                        con = confirm("是否删除?");
                        if (con == true) {
                            location.href = "/manage_books/books/admin/booksServlet?action=removeBooks&bid=" + bid;
                        }
                    }
                </script>
            </div>
        </div>
    </div>

</div>

<div class="foot"><label class="lable">获取更多资源请关注公众号：C you again,版权申明：使用请注明原地址</label></div>


<%@include file="admin_modal.jsp"%>

</body>


</html>
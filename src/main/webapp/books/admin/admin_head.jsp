<%--
  Created by IntelliJ IDEA.
  User: chl
  Date: 2021/4/13
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="head">
    <img class="img" src="${pageContext.request.contextPath}/books/img/title-yellow1.png"></img>
    <div class="userName">
        <a href="${pageContext.request.contextPath}/books/admin/index.jsp"><% out.write(admin.getName());%></a>
    </div>
    <div class="daohang">
        <ul>
            <li style="margin-left: 100px;">
                <a href="${pageContext.request.contextPath}/books/admin/displayServlet?action=getBookPage">图书管理</a>
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
                    <li><a href="${pageContext.request.contextPath}/books/admin/login_register_loginOutServlet?action=doLoginOut&id=<%=aid %>&&status=aid">退出</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<div style="width: 100%;float: left;height: 200px;"></div>

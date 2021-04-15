<%--
  Created by IntelliJ IDEA.
  User: chl
  Date: 2021/4/15
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Admin admin = new Admin();
    String uid = (String) session.getAttribute("uid");
    if (uid == null || uid.equals("")) {
        //没有登录
        response.sendRedirect("../login.jsp"); //重定向到登录页面
        return;
    } else {
        AdminDao admindao = new AdminDao();
        admin = admindao.get_AidInfo2(uid);
    }


%>

<div class="head">
    <img class="img" src="${pageContext.request.contextPath}/books/img/title-yellow1.png"></img>
    <div class="userName">
        <a href="${pageContext.request.contextPath}/books/user/index.jsp"><% out.write(admin.getName());%></a>
    </div>
    <div class="daohang">
        <ul>
            <li style="margin-left: 100px;">
                <a href="${pageContext.request.contextPath}/books/user/select.jsp">图书查询</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/books/user/borrow.jsp">借阅信息</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/books/user/history.jsp">借阅历史</a>
            </li>
            <li class="dropdown">
                <a href="#" class="" role="button" data-hover="dropdown">我的</a>
                <ul class="dropdown-menu">
                    <li><a href="#updateinfo" data-toggle="modal">个人资料</a></li>
                    <li><a href="#updatepwd" data-toggle="modal">修改密码</a></li>
                    <li><a href="/manage_books/books/admin/login_register_loginOutServlet?action=doLoginOut&id=<%=uid %>&&status=uid">退出</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<div style="width: 100%;float: left;height: 200px;"></div>

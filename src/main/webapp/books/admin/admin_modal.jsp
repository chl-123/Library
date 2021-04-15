<%@ page import="com.cya.dao.TypeDao" %>
<%@ page import="com.cya.pojo.Type" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: chl
  Date: 2021/4/13
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-------------------------个人资料模糊框------------------------------------->

<form class="form-horizontal" method="post" action="/manage_books/books/admin/adminServlet?action=adminManage">   <!--保证样式水平不混乱-->
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
                    <input type="hidden" name="url" value="${pageContext.request.requestURL}">
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

<!-------------------------修改密码------------------------------------->

<form class="form-horizontal" method="post" action="/manage_books/books/admin/adminServlet?action=adminManage">   <!--保证样式水平不混乱-->
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
                    <input type="hidden" name="url" value="${pageContext.request.requestURL}">
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-labe
                        l">原密码</label>
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

<!-------------------------修改图书------------------------------------->

<!-- 修改图书模态框（Modal） -->
<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/books/admin/booksServlet?action=updateBooks">
    <!--保证样式水平不混乱-->
    <div class="modal fade" id="updateBooksModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="updateModalLabel">
                        修改图书信息
                    </h4>
                </div>
                <div class="modal-body">

                    <!---------------------表单-------------------->

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">图书号</label>
                        <div class="col-sm-7">
                            <input type="hidden" id="updateBookId" name="updatebid">
                            <input type="text" class="form-control" id="updateISBN" name="card" placeholder="请输入书号" value="${books.card}">
                            <label class="control-label" for="updateISBN" style="display: none;"></label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">图书名称</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="updateBookName" name="name"
                                   placeholder="请输入图书名称">
                            <label class="control-label" for="updateBookName" style="display: none;"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">图书类型</label>
                        <div class="col-sm-7">
                            <select class="form-control" id="updateBookType" name="type"
                                    onPropertyChange="showValue(this.value)">
                                <option value="-1">请选择</option>
                                <%
                                    TypeDao typedao = new TypeDao();
                                    ArrayList<Type> data = (ArrayList<Type>) typedao.get_ListInfo();
                                    data = (ArrayList<Type>) typedao.get_ListInfo();
                                    for (Type bean : data) {
                                %>
                                <option value="<%= bean.getName() %>"><%= bean.getName() %>
                                </option>
                                <%} %>
                            </select>
                            <label class="control-label" for="updateBookType" style="display: none;"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">作者名称</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="updateAutho" name="autho"
                                   placeholder="请输入作者名称">
                            <label class="control-label" for="updateAutho" style="display: none;"></label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">出版社</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="updatePress" name="press"
                                   placeholder="请输入出版社">
                            <label class="control-label" for="updatePress" style="display: none;"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">总数量</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="updateNum" name="num" placeholder="请输入总数量">
                            <label class="control-label" for="updatePress" style="display: none;"></label>
                        </div>
                    </div>
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


<!--------------------------------------添加的图书模糊框------------------------>
<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/books/admin/booksServlet?action=addBooks">
    <!--保证样式水平不混乱-->
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="addBooksModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        添加新图书
                    </h4>
                </div>
                <div class="modal-body">

                    <!---------------------表单-------------------->

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">图书号</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="addISBN" required="required" name="card"
                                   placeholder="请输入书号">
                            <label class="control-label" for="addISBN" style="display: none;"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">图书名称</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="addBookName" required="required" name="name"
                                   placeholder="请输入图书名称">
                            <label class="control-label" for="addBookName" style="display: none;"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">图书类型</label>
                        <div class="col-sm-7">
                            <select class="form-control" id="addBookType" name="type">
                                <option value="无分类">请选择</option>
                                <%

                                    data = (ArrayList<Type>) typedao.get_ListInfo();
                                    for (Type bean : data) {
                                %>
                                <option value="<%= bean.getName() %>"><%= bean.getName() %>
                                </option>
                                <%} %>
                            </select>
                            <label class="control-label" for="addBookType" style="display: none;"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">作者名称</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="addAutho" required="required" name="autho"
                                   placeholder="请输入作者名称">
                            <label class="control-label" for="addAutho" style="display: none;"></label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">出版社</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="addPress" required="required" name="press"
                                   placeholder="请输入出版社">
                            <label class="control-label" for="addPress" style="display: none;"></label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">总数量</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="addNum" required="required" name="num"
                                   placeholder="请输入图书总数量">
                            <label class="control-label" for="addNum" style="display: none;"></label>
                        </div>
                    </div>


                    <!---------------------表单-------------------->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        添加
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</form>






<!-- ————————————————————修改图书分类的模态框（Modal） -->
<form class="form-horizontal" method="post" action="/manage_books/books/admin/bookTypeServlet?action=updateBookType">   <!--保证样式水平不混乱-->
    <div class="modal fade" id="updateBookTypeModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="updateModalLabel">
                        修改图书分类
                    </h4>
                </div>
                <div class="modal-body">

                    <!---------------------表单-------------------->

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">图书名称</label>
                        <div class="col-sm-7">
                            <input type="hidden" name="tid" id="updatetid">
                            <input type="text" class="form-control" id="updatename" name="name"
                                   placeholder="请输入图书分类名称">
                            <label class="control-label" for="updateBookName" style="display: none;"></label>
                        </div>
                    </div>

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


<!--------------------------------------添加图书分类的模糊框------------------------>
<form class="form-horizontal" method="post" action="/manage_books/books/admin/bookTypeServlet?action=addBookType">   <!--保证样式水平不混乱-->
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="addBookTypeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        添加新图书分类
                    </h4>
                </div>
                <div class="modal-body">

                    <!---------------------表单-------------------->

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">分类名称</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="addBookName" required="required" name="name"
                                   placeholder="请输入图书分类名称">
                            <label class="control-label" for="addBookName" style="display: none;"></label>
                        </div>
                    </div>

                    <!---------------------表单-------------------->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        添加
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</form>







<!-- 修改公告模态框（Modal） -->
<form class="form-horizontal" method="post" action="/manage_books/books/admin/noticeServlet?action=updateNotice">   <!--保证样式水平不混乱-->
    <div class="modal fade" id="updateNoticeModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="updateModalLabel">
                        修改公告
                    </h4>
                </div>
                <div class="modal-body">

                    <!---------------------表单-------------------->

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">公告内容</label>
                        <div class="col-sm-7">
                            <input type="hidden" name="nId" id="updatetid">
                            <input type="text" class="form-control" id="updatename" name="nContext"
                                   placeholder="请输入公告内容">
                            <label class="control-label" for="updateBookName" style="display: none;"></label>
                        </div>
                    </div>

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


<!--------------------------------------添加公告的模糊框------------------------>
<form class="form-horizontal" method="post" action="/manage_books/books/admin/noticeServlet?action=addNotice">   <!--保证样式水平不混乱-->
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="addNoticeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        添加新公告
                    </h4>
                </div>
                <div class="modal-body">

                    <!---------------------表单-------------------->

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">公告内容</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="addBookName" required="required" name="nContext"
                                   placeholder="请输入公告内容">
                            <input type="hidden" value="<%=admin.getName() %>" name="nPerson">
                            <label class="control-label" for="addBookName" style="display: none;"></label>

                        </div>
                        <label style="font-weight:normal;margin:20px;">注：公告内容中若出现英文状态下的双引号(""),请用单引号('')代替</label>
                    </div>

                    <!---------------------表单-------------------->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        添加
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</form>
<!--------------------------------------添加的模糊框------------------------>









<!-- 修改读者模态框（Modal） -->
<form class="form-horizontal" method="post" action="/manage_books/books/admin/userServlet?action=updateUser">   <!--保证样式水平不混乱-->
    <div class="modal fade" id="updateUserModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="updateModalLabel">
                        修改读者信息
                    </h4>
                </div>
                <div class="modal-body">

                    <!---------------------表单-------------------->

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">账号</label>
                        <div class="col-sm-7">
                            <input type="hidden" id="updateaid" name="aid">
                            <input type="text" class="form-control" id="updateusername" name="username"
                                   placeholder="">
                            <label class="control-label" for="updateISBN" style="display: none;"></label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">姓名</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="updatename" name="name" placeholder="">
                            <label class="control-label" for="updateBookName" style="display: none;"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">邮箱</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="updateemail" name="email" placeholder="">
                            <label class="control-label" for="updateAutho" style="display: none;"></label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">手机号</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="updatephone" name="phone" placeholder="">
                            <label class="control-label" for="updatePress" style="display: none;"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">密码</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="updatepassword" name="password"
                                   placeholder="">
                            <label class="control-label" for="updatePress" style="display: none;"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">可借阅天数</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="updatelend_num" name="lend_num"
                                   placeholder="">
                            <label class="control-label" for="updatePress" style="display: none;"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">最大借阅数</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" id="updatemax_num" name="max_num"
                                   placeholder="">
                            <label class="control-label" for="updatePress" style="display: none;"></label>
                        </div>
                    </div>
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


<!--------------------------------------添加的模糊框------------------------>
<form class="form-horizontal" method="post" action="/manage_books/books/admin/userServlet?action=addUser">   <!--保证样式水平不混乱-->
    <!-- 添加读者模态框（Modal） -->
    <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        添加新读者
                    </h4>
                </div>
                <div class="modal-body">

                    <!---------------------表单-------------------->

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">账号</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="username" id="addISBN" required="required"
                                   placeholder="请输入账号">
                            <label class="control-label" for="addISBN" style="display: none;"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">姓名</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="name" id="addBookName" required="required"
                                   placeholder="请输入姓名">
                            <label class="control-label" for="addBookName" style="display: none;"></label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">邮箱</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="email" id="addAutho" required="required"
                                   placeholder="请输入邮箱">
                            <label class="control-label" for="addAutho" style="display: none;"></label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">手机号</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="phone" id="addPress" required="required"
                                   placeholder="请输入手机号">
                            <label class="control-label" for="addPress" style="display: none;"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">密码</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="password" id="addPress"
                                   required="required" placeholder="请输入密码">
                            <label class="control-label" for="addPress" style="display: none;"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">可借阅天数</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="lend_num" id="updatelend_num"
                                   required="required" placeholder="请输入可借阅天数">
                            <label class="control-label" for="addNum" style="display: none;"></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstname" class="col-sm-3 control-label">最大可借数</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control" name="max_num" id="updatemax_num"
                                   required="required" placeholder="请输入最大可借数">
                            <label class="control-label" for="addPress" style="display: none;"></label>
                        </div>
                    </div>


                    <!---------------------表单-------------------->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        添加
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</form>
<!--------------------------------------添加的模糊框------------------------>

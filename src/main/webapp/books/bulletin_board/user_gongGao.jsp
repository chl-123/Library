<%@ page import="com.cya.pojo.Notice" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cya.dao.NoticeDao" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<div class="right">
    <div class="gongGao">
        <%
            //获取公告
            List<Notice> noticeList = new ArrayList<Notice>();
            NoticeDao noticeDao = new NoticeDao();
            noticeList = noticeDao.get_ListInfo();
            if (noticeList.size() <= 0) {
                Notice notice = new Notice();
                notice.setnContext("暂无公告，等待管理员发布哦");
                notice.setnPerson("");
                notice.setnTime(null);
                noticeList.add(notice);
            }
            System.out.print(noticeList);
        %>
        <div class="title">公 告</div>
        <div class="context import">
            <marquee width="100%" height="100%" direction="up" scrolldelay="200">
                <% for (Notice bean : noticeList) { %>
                <label>发布人：<%=bean.getnPerson() %>
                </label><br>
                <label>发布时间：<%=bean.getnTime() %>
                </label><br>
                <label><%=bean.getnContext() %>
                </label><br>
                <label>-------------------------------------------</label><br>
                <%} %>
            </marquee>

        </div>
    </div>
    <div class="gongGao">
        <div class="title">友 情 链 接</div>
        <div class="context">
            <a href="https://blog.csdn.net/qq_40625778">》CSDN，技术分享</a>
            <a href="https://www.cnblogs.com/cafuc20160512056/">》博客园，技术分享</a>
            <a href="https://www.jianshu.com/u/33531987c9a7">》简书，技术分享</a>
            <a href="https://y0ahx3.coding-pages.com/">》个人博客</a>
        </div>
    </div>
</div>
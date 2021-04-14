package com.cya.controller;

import com.cya.dao.NoticeDao;
import com.cya.pojo.Notice;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

public class NoticeServlet extends BaseServlet{
    private String nPerson="";
    private String nContext="";
    public void addNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码类型
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        nPerson=request.getParameter("nPerson");
        nContext=request.getParameter("nContext");
        System.out.println(nPerson+","+nContext);

        Notice notice=new Notice();
        notice.setnContext(nContext);
        notice.setnPerson(nPerson);
        notice.setnTime(new Date());

        NoticeDao noticeDao=new NoticeDao();
        noticeDao.addNotice(notice);
        response.sendRedirect("/manage_books/books/admin/admin_notice.jsp");
    }
    public void removeNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int nId=Integer.parseInt(request.getParameter("nid"));
        NoticeDao noticeDao=new NoticeDao();
        noticeDao.deleteNotice(nId);
        response.sendRedirect("/manage_books/books/admin/admin_notice.jsp");
    }
    public void updateNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String nContext=request.getParameter("nContext");
        int nId=0;
        if(request.getParameter("nId")!=null && request.getParameter("nId")!="") {
            nId=Integer.parseInt(request.getParameter("nId"));
        }
        Notice notice=new Notice();
        notice.setnContext(nContext);
        notice.setnId(nId);
        notice.setnTime(new Date());
        NoticeDao noticeDao=new NoticeDao();
        noticeDao.updateNotice(notice);
        response.sendRedirect("/manage_books/books/admin/admin_notice.jsp");
    }
}

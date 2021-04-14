package com.cya.controller;

import com.cya.dao.TypeDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BookTypeServlet extends BaseServlet{
    public void addBookType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码类型
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取图书分类的名称
        String name = request.getParameter("name");
        TypeDao typedao = new TypeDao();
        //调用函数存入图书分类信息
        typedao.addBookType(name);
        response.sendRedirect("/manage_books/books/admin/admin_booksType.jsp");
    }
    public void removeBookType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //删除图书分类信息
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int tid = Integer.parseInt(request.getParameter("tid"));
        TypeDao typedao = new TypeDao();
        typedao.deleteBookType(tid);
        response.sendRedirect("/manage_books/books/admin/admin_booksType.jsp");
    }
    public void updateBookType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //修改图书类型信息
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String name = request.getParameter("name");
        int tid = Integer.parseInt(request.getParameter("tid"));
        TypeDao typedao = new TypeDao();
        typedao.updateTypeBook(tid, name);
        response.sendRedirect("/manage_books/books/admin/admin_booksType.jsp");
    }
}

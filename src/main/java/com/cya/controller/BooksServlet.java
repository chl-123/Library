package com.cya.controller;

import com.cya.dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class BooksServlet extends BaseServlet{
    public void addBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //获取要添加图书的信息
        String card = request.getParameter("card");
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String autho = request.getParameter("autho");
        String press = request.getParameter("press");
        int num = Integer.parseInt(request.getParameter("num"));
        BookDao bookdao = new BookDao();
        //调用函数，存入图书
        bookdao.addBook(card, name, type, autho, press, num);
        response.sendRedirect("/manage_books/books/admin/displayServlet?action=getBookPage&pageNum=6666");
    }
    public void removeBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //删除图书信息
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int bid = Integer.parseInt(request.getParameter("bid"));
        BookDao bookdao = new BookDao();
        bookdao.deleteBook(bid);
        response.sendRedirect("/manage_books/books/admin/displayServlet?action=getBookPage&pageNum=1");
    }
    public void updateBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //修改图书信息
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String card = request.getParameter("card");
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String autho = request.getParameter("autho");
        String press = request.getParameter("press");
        int num = Integer.parseInt(request.getParameter("num"));
        int bid = Integer.parseInt(request.getParameter("updatebid"));
        BookDao bookdao = new BookDao();
        bookdao.updateBook(bid, card, name, type, autho, press, num);
        response.sendRedirect("/manage_books/books/admin/admin_books.jsp");
    }




}

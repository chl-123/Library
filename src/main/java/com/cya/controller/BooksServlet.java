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
        response.sendRedirect("/manage_books/books/admin/admin_books.jsp");
    }
    public void removeBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        response.sendRedirect("/manage_books/books/admin/admin_books.jsp");
    }
    public void updateBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        response.sendRedirect("/manage_books/books/admin/admin_books.jsp");
    }
    public void addNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        response.sendRedirect("/manage_books/books/admin/admin_books.jsp");
    }
    public void removeNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        response.sendRedirect("/manage_books/books/admin/admin_books.jsp");
    }
    public void updateNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        response.sendRedirect("/manage_books/books/admin/admin_books.jsp");
    }
    public void addBookType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        response.sendRedirect("/manage_books/books/admin/admin_books.jsp");
    }
    public void removeBookType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        response.sendRedirect("/manage_books/books/admin/admin_books.jsp");
    }
    public void updateBookType(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        response.sendRedirect("/manage_books/books/admin/admin_books.jsp");
    }
    public void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        response.sendRedirect("/manage_books/books/admin/admin_books.jsp");
    }
    public void removeUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        response.sendRedirect("/manage_books/books/admin/admin_books.jsp");
    }
    public void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        response.sendRedirect("/manage_books/books/admin/admin_books.jsp");
    }

}

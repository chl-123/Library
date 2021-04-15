package com.cya.controller;

import com.cya.dao.BookDao;
import com.cya.pojo.Book;
import com.cya.pojo.PageInfo;
import com.cya.service.Service;
import com.cya.service.impl.ServiceImpl;
import com.cya.util.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class DisplayServlet extends BaseServlet{
    private Service service=new ServiceImpl();
    public void getBookPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1 获取请求的参数 pageNo 和 pageSize
        int pageNo = WebUtils.parseInt(request.getParameter("pageNum"), 1);
        int pageSize = WebUtils.parseInt(request.getParameter("pageSize"), 5);
        //2 调用BookService.page(pageNo，pageSize)：Page对象
        PageInfo<Book> pageInfo = service.getPage(pageNo,pageSize);
        request.setAttribute("pageInfo",pageInfo);

        //4 请求转发到pages/manager/book_manager.jsp页面
        request.getRequestDispatcher("/books/admin/admin_books.jsp").forward(request,response);
    }
    public void showInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        //因为在管理员界面和读者界面都有查找功能，为了将查找的结果返回正确的页面，设置了tip，tip=1表示管理员界面
        int tip = Integer.parseInt(request.getParameter("tip"));
        String name = request.getParameter("name");
        BookDao bookdao = new BookDao();
        ArrayList<Book> data = bookdao.getLikeList(name);
        //将获取的结果存入请求中
        request.setAttribute("data", data);
        String url = "";
        //转发不同的界面
        if (tip == 1) {
            url = response.encodeURL("/books/admin/admin_books.jsp");
        } else {
            url = response.encodeURL("/books/user/select.jsp");
        }
        //将请求转发
        request.getRequestDispatcher(url).forward(request, response);
    }

}

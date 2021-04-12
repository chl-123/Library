package com.cya.controller;

import com.cya.pojo.Book;
import com.cya.pojo.PageInfo;
import com.cya.service.Service;
import com.cya.service.impl.ServiceImpl;
import com.cya.util.WebUtils;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DisplayServlet extends BaseServlet{
    private Service service=new ServiceImpl();
    public void getBookPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1 获取请求的参数 pageNo 和 pageSize
        int pageNo = WebUtils.parseInt(request.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(request.getParameter("pageSize"), 5);
        //2 调用BookService.page(pageNo，pageSize)：Page对象
        PageInfo<Book> pageInfo = service.getPage(pageNo,pageSize);
        request.setAttribute("page",pageInfo);
        //4 请求转发到pages/manager/book_manager.jsp页面
        request.getRequestDispatcher("/manage_books/books/admin/admin_books.jsp").forward(request,response);
    }
}
